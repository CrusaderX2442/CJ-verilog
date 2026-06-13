
module operation_block_5 (
    input wire A0, A1, A2, A3, B0, B1, B2, B3,
    output wire OUT_AR1H, OUT_AR2H, OUT_AR3H, OUT_AR4H, OUT_AR5H,
    output wire OUT_AR1L, OUT_AR2L, OUT_AR3L, OUT_AR4L, OUT_AR5L,
    output reg OUT_LG1H, OUT_LG2H, OUT_LG3H, OUT_LG4H,
    output reg OUT_LG1L, OUT_LG2L, OUT_LG3L, OUT_LG4L
);

// Inversión modo alto
always @(*) begin
    OUT_LG1H = ~B0;
    OUT_LG2H = ~B1;
    OUT_LG3H = ~B2;
    OUT_LG4H = ~B3;
end

// Inversión modo bajo
always @(*) begin
    OUT_LG1L = ~B0;
    OUT_LG2L = ~B1;
    OUT_LG3L = ~B2;
    OUT_LG4L = ~B3;
end

// Preparación aritmética alta
reg y0, y1, y2, y3;
reg y4, y5, y6, y7;
always @(*) begin
    y0 = A0 & B0;
    y1 = A1 & B1;
    y2 = A2 & B2;
    y3 = A3 & B3;
    y4 = A0 | ~B0;
    y5 = A1 | ~B1;
    y6 = A2 | ~B2;
    y7 = A3 | ~B3;
end

sumadora INST_ADD_H (
    .A3(y3), .A2(y2), .A1(y1), .A0(y0), .C_IN(1'b0),
    .B3(y7), .B2(y6), .B1(y5), .B0(y4),
    .S3(OUT_AR4H), .S2(OUT_AR3H), .S1(OUT_AR2H), .S0(OUT_AR1H), .C_OUT(OUT_AR5H)
);

// Preparación aritmética baja
reg z0, z1, z2, z3;
reg z4, z5, z6, z7;
always @(*) begin
    z0 = A0 | B0;
    z1 = A1 | B1;
    z2 = A2 | B2;
    z3 = A3 | B3;
    z4 = A0 & ~B0;
    z5 = A1 & ~B1;
    z6 = A2 & ~B2;
    z7 = A3 & ~B3;
end

sumadora INST_ADD_L (
    .A3(z3), .A2(z2), .A1(z1), .A0(z0), .C_IN(1'b0),
    .B3(z7), .B2(z6), .B1(z5), .B0(z4),
    .S3(OUT_AR4L), .S2(OUT_AR3L), .S1(OUT_AR2L), .S0(OUT_AR1L), .C_OUT(OUT_AR5L)
);
endmodule
