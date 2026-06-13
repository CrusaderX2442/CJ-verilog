module mux_4to1 (
    input I0, I1, I2, I3, 
    input S1, S0,         
    output Y             
);
    wire not_s1, not_s0;
    wire a0, a1, a2, a3;
    wire y0, y1;

    compuerta_NOT inv1 (.A(S1), .Y(not_s1));
    compuerta_NOT inv2 (.A(S0), .Y(not_s0));

    wire sel0_temp;
    compuerta_AND and0_a (.A(not_s1), .B(not_s0), .Y(sel0_temp));
    compuerta_AND and0_b (.A(sel0_temp), .B(I0), .Y(a0));

    wire sel1_temp;
    compuerta_AND and1_a (.A(not_s1), .B(S0), .Y(sel1_temp));
    compuerta_AND and1_b (.A(sel1_temp), .B(I1), .Y(a1));

    wire sel2_temp;
    compuerta_AND and2_a (.A(S1), .B(not_s0), .Y(sel2_temp));
    compuerta_AND and2_b (.A(sel2_temp), .B(I2), .Y(a2));

    wire sel3_temp;
    compuerta_AND and3_a (.A(S1), .B(S0), .Y(sel3_temp));
    compuerta_AND and3_b (.A(sel3_temp), .B(I3), .Y(a3));

    compuerta_OR or1 (.A(a0), .B(a1), .Y(y0));
    compuerta_OR or2 (.A(a2), .B(a3), .Y(y1));
    compuerta_OR or_final (.A(y0), .B(y1), .Y(Y));
endmodule 