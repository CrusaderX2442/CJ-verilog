
module access_fsm_ic(
    input wire clk,
    input wire rst,
    input wire enter,
    input wire data_in,

    output reg open,
    output reg alarm,
    output reg busy,
    output wire [2:0] state_dbg
);

    //========================
    // ESTADOS
    //========================
    localparam IDLE   = 3'd0,
               B1     = 3'd1,
               B2     = 3'd2,
               B3     = 3'd3,
               OPEN   = 3'd4,
               ERROR  = 3'd5,
               LOCKED = 3'd6;

    //========================
    // REGISTROS
    //========================
    reg [2:0] state;
    reg [2:0] next_state;

    reg [1:0] fail_count;

    wire open_done;
    wire lock_done;

    //========================
    // TEMPORIZADOR OPEN
    //========================
    timer_open open_timer(
        .clk(clk),
        .rst(rst),
        .enable(state == OPEN),
        .done(open_done)
    );

    //========================
    // TEMPORIZADOR LOCK
    //========================
    timer_lock lock_timer(
        .clk(clk),
        .rst(rst),
        .enable(state == LOCKED),
        .done(lock_done)
    );

    //========================
    // REGISTRO DE ESTADO
    //========================
    always @(posedge clk or posedge rst) begin
        if(rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    //========================
    // CONTADOR DE FALLOS
    //========================
    always @(posedge clk or posedge rst) begin

        if(rst)
            fail_count <= 0;

        else if(state == ERROR)
            fail_count <= fail_count + 1;

        else if(state == OPEN)
            fail_count <= 0;

        else if(state == LOCKED && lock_done)
            fail_count <= 0;

    end

    //========================
    // LOGICA DE TRANSICION
    //========================
    always @(*) begin

        next_state = state;

        case(state)

            //================
            // ESPERA
            //================
            IDLE: begin

                if(enter) begin

                    if(data_in == 1'b1)
                        next_state = B1;

                    else
                        next_state = ERROR;

                end

            end

            //================
            // RECIBIO 1
            //================
            B1: begin

                if(enter) begin

                    if(data_in == 1'b0)
                        next_state = B2;

                    else
                        next_state = ERROR;

                end

            end

            //================
            // RECIBIO 10
            //================
            B2: begin

                if(enter) begin

                    if(data_in == 1'b1)
                        next_state = B3;

                    else
                        next_state = ERROR;

                end

            end

            //================
            // RECIBIO 101
            //================
            B3: begin

                if(enter) begin

                    if(data_in == 1'b1)
                        next_state = OPEN;

                    else
                        next_state = ERROR;

                end

            end

            //================
            // ACCESO CORRECTO
            //================
            OPEN: begin

                if(open_done)
                    next_state = IDLE;

            end

            //================
            // ERROR
            //================
            ERROR: begin

                if(fail_count == 2)
                    next_state = LOCKED;

                else
                    next_state = IDLE;

            end

            //================
            // BLOQUEADO
            //================
            LOCKED: begin

                if(lock_done)
                    next_state = IDLE;

            end

            default:
                next_state = IDLE;

        endcase

    end

    //========================
    // SALIDAS
    //========================
    always @(*) begin

        open  = 0;
        alarm = 0;
        busy  = 0;

        case(state)

            OPEN:
                open = 1;

            LOCKED:
                alarm = 1;

        endcase

        if(state != IDLE)
            busy = 1;

    end

    //========================
    // DEBUG
    //========================
    assign state_dbg = state;

endmodule

