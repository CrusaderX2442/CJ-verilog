// ========================================
// Módulo de operaciones OR y AND - Variante 11
module operation_block_11 (
    input wire A0, A1, A2, A3, B0, B1, B2, B3,
    output reg OUT_AR1H, OUT_AR2H, OUT_AR3H, OUT_AR4H,
    output wire OUT_AR1L, OUT_AR2L, OUT_AR3L, OUT_AR4L, OUT_AR5L,
    output reg OUT_LG1H, OUT_LG2H, OUT_LG3H, OUT_LG4H,
    output reg OUT_LG1L, OUT_LG2L, OUT_LG3L, OUT_LG4L
);

// Operador OR alto
always @(*) begin
    OUT_LG1H = A0 | B0;
    OUT_LG2H = A1 | B1;
    OUT_LG3H = A2 | B2;
    OUT_LG4H = A3 | B3;
end

// Operador AND bajo
always @(*) begin
    OUT_LG1L = A0 & B0;
    OUT_LG2L = A1 & B1;
    OUT_LG3L = A2 & B2;
    OUT_LG4L = A3 & B3;
end

// Aritmética OR alta
always @(*) begin
    OUT_AR1H = A0 | B0;
    OUT_AR2H = A1 | B1;
    OUT_AR3H = A2 | B2;
    OUT_AR4H = A3 | B3;
end

// Preparación para resta baja
reg y0, y1, y2, y3;
always @(*) begin
    y0 = A0 & B0;
    y1 = A1 & B1;
    y2 = A2 & B2;
    y3 = A3 & B3;
end

restadora INST_SUB (
    .A3(y3), .A2(y2), .A1(y1), .A0(y0),
    .B3(1'b0), .B2(1'b0), .B1(1'b0), .B0(1'b1),
    .S3(OUT_AR4L), .S2(OUT_AR3L), .S1(OUT_AR2L), .S0(OUT_AR1L), .C_OUT(OUT_AR5L)
);
endmodule