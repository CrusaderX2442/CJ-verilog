module divisor_frecuencia (
    input wire clk,
    output reg tick_1hz
);
    reg [25:0] count = 0;
    always @(posedge clk) begin
        if (count == 26'd50_000_000 - 1) begin
            count <= 0;
            tick_1hz <= 1'b1;
        end else begin
            count <= count + 1'b1;
            tick_1hz <= 1'b0;
        end
    end
endmodule