module one_pulse(
    input  wire clk,
    input  wire signal_in,
    output wire pulse_out
);

    reg signal_d = 1'b0;

    always @(posedge clk) begin
        signal_d <= signal_in;
    end

    assign pulse_out = signal_in & ~signal_d;

endmodule