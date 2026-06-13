module contador_binario;
    reg corriendo;
    always @(posedge clk) begin
        if (~rst) begin out <= 4'b0; corriendo <= 1'b0; end
        else begin
            if (btn_tick) corriendo <= ~corriendo;
            if (corriendo && tick_1hz) out <= out + 1'b1;
        end
    end
endmodule