

// ========================================
// Módulo de operaciones XOR y suma - Variante 9
module operation_block_9 (
    input wire A0, A1, A2, A3, B0, B1, B2, B3,
    output wire OUT_AR1H, OUT_AR2H, OUT_AR3H, OUT_AR4H, OUT_AR5H,
    output wire OUT_AR1L, OUT_AR2L, OUT_AR3L, OUT_AR4L, OUT_AR5L,
    output reg OUT_LG1H, OUT_LG2H, OUT_LG3H, OUT_LG4H,
    output reg OUT_LG1L, OUT_LG2L, OUT_LG3L, OUT_LG4L
);

// Lógica XOR modo alto
always @(*) begin
    OUT_LG1H = A0 ^ B0;
    OUT_LG2H = A1 ^ B1;
    OUT_LG3H = A2 ^ B2;
    OUT_LG4H = A3 ^ B3;
end

// Lógica XNOR modo bajo
always @(*) begin
    OUT_LG1L = A0 ~^ B0;
    OUT_LG2L = A1 ~^ B1;
    OUT_LG3L = A2 ~^ B2;
    OUT_LG4L = A3 ~^ B3;
end

// Suma aritmética alta
sumadora INST_ADD_H (
    .A3(A3), .A2(A2), .A1(A1), .A0(A0), .C_IN(1'b0),
    .B3(B3), .B2(B2), .B1(B1), .B0(B0),
    .S3(OUT_AR4H), .S2(OUT_AR3H), .S1(OUT_AR2H), .S0(OUT_AR1H), .C_OUT(OUT_AR5H)
);

// Suma aritmética baja
sumadora INST_ADD_L (
    .A3(A3), .A2(A2), .A1(A1), .A0(A0), .C_IN(1'b0),
    .B3(B3), .B2(B2), .B1(B1), .B0(B0),
    .S3(OUT_AR4L), .S2(OUT_AR3L), .S1(OUT_AR2L), .S0(OUT_AR1L), .C_OUT(OUT_AR5L)
);
endmodule