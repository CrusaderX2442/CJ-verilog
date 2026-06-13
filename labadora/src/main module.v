module lavadora_top #(
    parameter integer CLK_HZ       = 27000000,
    parameter integer T_FILL_SEC   = 40,
    parameter integer T_WASH_SEC   = 40,
    parameter integer T_DRAIN_SEC  = 40,
    parameter integer T_RINSE_SEC  = 40,
    parameter integer T_SPIN_SEC   = 40,
    parameter integer T_PAUSE_SEC  = 4,
    parameter integer T_TOGGLE_SEC = 2
)(
    input  wire clk,
    input  wire btn_on,
    input  wire btn_reset,
    input  wire btn_skip,
    input  wire btn_pause,

    output reg  [3:0] leds,
    output reg  dir_inv,
    output reg  motor_en
);

    //==================================================
    // Botones filtrados
    //==================================================
    wire on_db_n, reset_db_n, skip_db_n, pause_db_n;

    debounce d0 (.clk(clk), .btn_in(btn_on),    .btn_out(on_db_n));
    debounce d1 (.clk(clk), .btn_in(btn_reset), .btn_out(reset_db_n));
    debounce d2 (.clk(clk), .btn_in(btn_skip),  .btn_out(skip_db_n));
    debounce d3 (.clk(clk), .btn_in(btn_pause), .btn_out(pause_db_n));

    // Botones activos en bajo -> invertimos para trabajar lógico activo en 1
    wire on_db    = ~on_db_n;
    wire reset_db = ~reset_db_n;
    wire skip_db  = ~skip_db_n;
    wire pause_db = ~pause_db_n;

    // Pulsos de un ciclo
    wire on_pulse, reset_pulse, skip_pulse, pause_pulse;

    one_pulse p0 (.clk(clk), .signal_in(on_db),    .pulse_out(on_pulse));
    one_pulse p1 (.clk(clk), .signal_in(reset_db), .pulse_out(reset_pulse));
    one_pulse p2 (.clk(clk), .signal_in(skip_db),  .pulse_out(skip_pulse));
    one_pulse p3 (.clk(clk), .signal_in(pause_db), .pulse_out(pause_pulse));

    //==================================================
    // Tick de 1 segundo
    //==================================================
    wire sec_pulse;
    reg paused = 1'b0;

    sec_tick #(
        .CLK_HZ(CLK_HZ)
    ) u_tick (
        .clk(clk),
        .rst(reset_pulse),
        .en(~paused),
        .tick(sec_pulse)
    );

    //==================================================
    // Estados
    //==================================================
    localparam [3:0]
        S_IDLE    = 4'd0,
        S_FILL1   = 4'd1,
        S_WASH    = 4'd2,
        S_DRAIN1  = 4'd3,
        S_FILL2   = 4'd4,
        S_RINSE   = 4'd5,
        S_DRAIN2  = 4'd6,
        S_SPIN    = 4'd7,
        S_PAUSE   = 4'd8;

    reg [3:0] state = S_IDLE;
    reg [3:0] after_pause_state = S_IDLE;

    reg [15:0] sec_count = 0;
    reg [15:0] motor_delay = 0;
    reg [15:0] dir_count = 0;

    //==================================================
    // Pause toggle
    //==================================================
    always @(posedge clk) begin
        if (reset_pulse)
            paused <= 1'b0;
        else if (pause_pulse && state != S_IDLE)
            paused <= ~paused;
    end

    //==================================================
    // Máquina principal
    //==================================================
    always @(posedge clk) begin
        if (reset_pulse) begin
            state <= S_IDLE;
            after_pause_state <= S_IDLE;
            sec_count <= 0;
            motor_delay <= 0;
            dir_count <= 0;
            dir_inv <= 1'b0;
            motor_en <= 1'b0;
        end else if (!paused) begin

            // Arranque solo con ON y solo desde IDLE
            if (state == S_IDLE && on_pulse) begin
                state <= S_FILL1;
                after_pause_state <= S_IDLE;
                sec_count <= 0;
                motor_delay <= 0;
                dir_count <= 0;
                dir_inv <= 1'b0;
                motor_en <= 1'b0;
            end

            // SKIP salta correctamente
            else if (skip_pulse && state != S_IDLE) begin
                case (state)
                    S_FILL1: begin
                        state <= S_PAUSE;
                        after_pause_state <= S_WASH;
                    end

                    S_WASH: begin
                        state <= S_PAUSE;
                        after_pause_state <= S_DRAIN1;
                    end

                    S_DRAIN1: begin
                        state <= S_PAUSE;
                        after_pause_state <= S_FILL2;
                    end

                    S_FILL2: begin
                        state <= S_PAUSE;
                        after_pause_state <= S_RINSE;
                    end

                    S_RINSE: begin
                        state <= S_PAUSE;
                        after_pause_state <= S_DRAIN2;
                    end

                    S_DRAIN2: begin
                        state <= S_PAUSE;
                        after_pause_state <= S_SPIN;
                    end

                    S_SPIN: begin
                        state <= S_IDLE;
                        after_pause_state <= S_IDLE;
                    end

                    S_PAUSE: begin
                        state <= after_pause_state;
                    end

                    default: begin
                        state <= S_IDLE;
                        after_pause_state <= S_IDLE;
                    end
                endcase

                sec_count <= 0;
                motor_delay <= 0;
                dir_count <= 0;
                dir_inv <= 1'b0;
                motor_en <= 1'b0;
            end

            // Avance por tiempo
            else if (sec_pulse) begin
                case (state)
                    S_IDLE: begin
                        sec_count <= 0;
                        motor_delay <= 0;
                        dir_count <= 0;
                        dir_inv <= 1'b0;
                        motor_en <= 1'b0;
                    end

                    S_FILL1: begin
                        motor_en <= 1'b0;
                        dir_inv <= 1'b0;

                        if (sec_count >= T_FILL_SEC - 1) begin
                            state <= S_PAUSE;
                            after_pause_state <= S_WASH;
                            sec_count <= 0;
                            motor_delay <= 0;
                            dir_count <= 0;
                        end else begin
                            sec_count <= sec_count + 1'b1;
                        end
                    end

                    S_WASH: begin
                        if (motor_delay >= 1)
                            motor_en <= 1'b1;
                        else begin
                            motor_en <= 1'b0;
                            motor_delay <= motor_delay + 1'b1;
                        end

                        if (dir_count >= T_TOGGLE_SEC - 1) begin
                            dir_inv <= ~dir_inv;
                            dir_count <= 0;
                        end else begin
                            dir_count <= dir_count + 1'b1;
                        end

                        if (sec_count >= T_WASH_SEC - 1) begin
                            state <= S_PAUSE;
                            after_pause_state <= S_DRAIN1;
                            sec_count <= 0;
                            motor_delay <= 0;
                            dir_count <= 0;
                            dir_inv <= 1'b0;
                            motor_en <= 1'b0;
                        end else begin
                            sec_count <= sec_count + 1'b1;
                        end
                    end

                    S_DRAIN1: begin
                        motor_en <= 1'b0;
                        dir_inv <= 1'b0;

                        if (sec_count >= T_DRAIN_SEC - 1) begin
                            state <= S_PAUSE;
                            after_pause_state <= S_FILL2;
                            sec_count <= 0;
                            motor_delay <= 0;
                            dir_count <= 0;
                        end else begin
                            sec_count <= sec_count + 1'b1;
                        end
                    end

                    S_FILL2: begin
                        motor_en <= 1'b0;
                        dir_inv <= 1'b0;

                        if (sec_count >= T_FILL_SEC - 1) begin
                            state <= S_PAUSE;
                            after_pause_state <= S_RINSE;
                            sec_count <= 0;
                            motor_delay <= 0;
                            dir_count <= 0;
                        end else begin
                            sec_count <= sec_count + 1'b1;
                        end
                    end

                    S_RINSE: begin
                        if (motor_delay >= 1)
                            motor_en <= 1'b1;
                        else begin
                            motor_en <= 1'b0;
                            motor_delay <= motor_delay + 1'b1;
                        end

                        if (dir_count >= T_TOGGLE_SEC - 1) begin
                            dir_inv <= ~dir_inv;
                            dir_count <= 0;
                        end else begin
                            dir_count <= dir_count + 1'b1;
                        end

                        if (sec_count >= T_RINSE_SEC - 1) begin
                            state <= S_PAUSE;
                            after_pause_state <= S_DRAIN2;
                            sec_count <= 0;
                            motor_delay <= 0;
                            dir_count <= 0;
                            dir_inv <= 1'b0;
                            motor_en <= 1'b0;
                        end else begin
                            sec_count <= sec_count + 1'b1;
                        end
                    end

                    S_DRAIN2: begin
                        motor_en <= 1'b0;
                        dir_inv <= 1'b0;

                        if (sec_count >= T_DRAIN_SEC - 1) begin
                            state <= S_PAUSE;
                            after_pause_state <= S_SPIN;
                            sec_count <= 0;
                            motor_delay <= 0;
                            dir_count <= 0;
                        end else begin
                            sec_count <= sec_count + 1'b1;
                        end
                    end

                    S_SPIN: begin
                        dir_inv <= 1'b0;

                        if (motor_delay >= 1)
                            motor_en <= 1'b1;
                        else begin
                            motor_en <= 1'b0;
                            motor_delay <= motor_delay + 1'b1;
                        end

                        if (sec_count >= T_SPIN_SEC - 1) begin
                            state <= S_IDLE;
                            after_pause_state <= S_IDLE;
                            sec_count <= 0;
                            motor_delay <= 0;
                            dir_count <= 0;
                            dir_inv <= 1'b0;
                            motor_en <= 1'b0;
                        end else begin
                            sec_count <= sec_count + 1'b1;
                        end
                    end

                    S_PAUSE: begin
                        motor_en <= 1'b0;
                        dir_inv <= 1'b0;

                        if (sec_count >= T_PAUSE_SEC - 1) begin
                            state <= after_pause_state;
                            sec_count <= 0;
                            motor_delay <= 0;
                            dir_count <= 0;
                            dir_inv <= 1'b0;
                            motor_en <= 1'b0;
                        end else begin
                            sec_count <= sec_count + 1'b1;
                        end
                    end

                    default: begin
                        state <= S_IDLE;
                        after_pause_state <= S_IDLE;
                        sec_count <= 0;
                        motor_delay <= 0;
                        dir_count <= 0;
                        dir_inv <= 1'b0;
                        motor_en <= 1'b0;
                    end
                endcase
            end
        end
    end

    //==================================================
    // LEDs
    //==================================================
    always @(*) begin
        case (state)
            S_IDLE:   leds = 4'b0000;
            S_FILL1:  leds = 4'b0001;
            S_WASH:   leds = 4'b0010;
            S_DRAIN1: leds = 4'b0011;
            S_FILL2:  leds = 4'b0100;
            S_RINSE:  leds = 4'b0101;
            S_DRAIN2: leds = 4'b0110;
            S_SPIN:   leds = 4'b0111;
            S_PAUSE:  leds = 4'b1000;
            default:  leds = 4'b0000;
        endcase
    end

endmodule