wire pulse_bin, pulse_bcd, pulse_sexa;
    
    debouncer db_bin (
        .clk(clk), .rst(rst), .btn_in(btn_bin), .pulse_out(pulse_bin)
    );
    debouncer db_bcd (
        .clk(clk), .rst(rst), .btn_in(btn_bcd), .pulse_out(pulse_bcd)
    );
    debouncer db_sexa(
        .clk(clk), .rst(rst), .btn_in(btn_sexa), .pulse_out(pulse_sexa)
    );