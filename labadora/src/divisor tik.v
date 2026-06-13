module sec_tick #(
    parameter integer CLK_HZ = 27000000
)(
    input  wire clk,
    input  wire rst,
    input  wire en,
    output reg  tick = 1'b0
);

    localparam integer MAX_COUNT = CLK_HZ - 1;
    reg [31:0] counter = 0;

    always @(posedge clk) begin
        if (rst) begin
            counter <= 0;
            tick <= 1'b0;
        end else if (en) begin
            if (counter >= MAX_COUNT) begin
                counter <= 0;
                tick <= 1'b1;
            end else begin
                counter <= counter + 1'b1;
                tick <= 1'b0;
            end
        end else begin
            counter <= 0;
            tick <= 1'b0;
        end
    end

endmodule