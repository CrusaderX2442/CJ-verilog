module top_contadores (
    input wire clk, input wire rst, input wire btn_bin, input wire btn_bcd, input wire btn_sexa,
    output wire [3:0] led_bin, output wire [3:0] led_bcd, output wire [5:0] led_sexa
);
    wire t_bin, t_bcd, t_sexa, t_auto;
    divisor_frecuencia div (.clk(clk), .tick_1hz(t_auto));
    debouncer d1 (.clk(clk), .btn_in(btn_bin), .btn_tick(t_bin));
    debouncer d2 (.clk(clk), .btn_in(btn_bcd), .btn_tick(t_bcd));
    debouncer d3 (.clk(clk), .btn_in(btn_sexa), .btn_tick(t_sexa));
    contador_binario c1 (.clk(clk), .rst(rst), .btn_tick(t_bin), .tick_1hz(t_auto), .out(led_bin));
    contador_bcd c2 (.clk(clk), .rst(rst), .btn_tick(t_bcd), .tick_1hz(t_auto), .out(led_bcd));
    contador_sexagesimal c3 (.clk(clk), .rst(rst), .btn_tick(t_sexa), .tick_1hz(t_auto), .out(led_sexa));
endmodule