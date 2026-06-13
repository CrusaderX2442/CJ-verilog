module toggle_ff(
    input  wire clk,
    input  wire rst,
    input  wire toggle,
    input  wire force_zero,
    output reg  q
);

    always @(posedge clk) begin
        if (rst)
            q <= 1'b0;
        else if (force_zero)
            q <= 1'b0;
        else if (toggle)
            q <= ~q;
    end

endmodule