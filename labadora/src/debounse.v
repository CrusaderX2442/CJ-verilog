module debounce #(
    parameter integer COUNT_MAX = 540000
)(
    input  wire clk,
    input  wire btn_in,
    output reg  btn_out = 1'b1
);

    reg [19:0] counter = 0;
    reg sync_0 = 1'b1;
    reg sync_1 = 1'b1;
    reg stable_state = 1'b1;

    always @(posedge clk) begin
        sync_0 <= btn_in;
        sync_1 <= sync_0;

        if (sync_1 != stable_state) begin
            if (counter < COUNT_MAX)
                counter <= counter + 1'b1;
            else begin
                stable_state <= sync_1;
                btn_out <= sync_1;
                counter <= 0;
            end
        end else begin
            counter <= 0;
        end
    end

endmodule