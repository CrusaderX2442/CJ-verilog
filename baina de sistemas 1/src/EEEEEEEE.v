wire tick_1hz;
    divisor_1hz div_1hz (
        .clk(clk),
        .rst(rst),
        .tick(tick_1hz)
    );