
module timer_lock(

    input wire clk,
    input wire rst,
    input wire enable,

    output reg done
);

    reg [4:0] counter;

    always @(posedge clk or posedge rst) begin

        if(rst) begin
            counter <= 0;
            done <= 0;
        end

        else if(enable) begin

            if(counter == 10) begin
                done <= 1;
                counter <= 0;
            end

            else begin
                counter <= counter + 1;
                done <= 0;
            end

        end

        else begin
            counter <= 0;
            done <= 0;
        end

    end

endmodule

