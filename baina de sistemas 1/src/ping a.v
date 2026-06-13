module debouncer (
    input wire clk,
    input wire btn_in,
    output reg btn_tick
);
    parameter MAX_COUNT = 21'd1_000_000;
    reg [20:0] counter;
    reg state_reg, sync_0, sync_1;

    always @(posedge clk) begin
        sync_0 <= ~btn_in;
        sync_1 <= sync_0;
        btn_tick <= 1'b0;
        if (state_reg == sync_1) counter <= 0;
        else begin
            counter <= counter + 1'b1;
            if (counter == MAX_COUNT) begin
                state_reg <= sync_1;
                if (sync_1 == 1'b1) btn_tick <= 1'b1;
            end
        end
    end
endmodule