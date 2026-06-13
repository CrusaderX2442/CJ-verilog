// Módulo de operaciones combinadas - Variante 2
module operation_block_2 (
    input wire A0, A1, A2, A3, B0, B1, B2, B3,
    output wire OUT_AR1H, OUT_AR2H, OUT_AR3H, OUT_AR4H, OUT_ARNH,
    output reg OUT_AR1L, OUT_AR2L, OUT_AR3L, OUT_AR4L,
    output reg OUT_LG1H, OUT_LG2H, OUT_LG3H, OUT_LG4H,
    output reg OUT_LG1L, OUT_LG2L, OUT_LG3L, OUT_LG4L
);

// Operaciones lógicas modo alto
always @(*) begin
    OUT_LG1H = ~A0 | B0;
    OUT_LG2H = ~A1 | B1;
    OUT_LG3H = ~A2 | B2;
    OUT_LG4H = ~A3 | B3;
end

// Operaciones lógicas modo bajo
always @(*) begin
    OUT_LG1L = ~A0 & B0;
    OUT_LG2L = ~A1 & B1;
    OUT_LG3L = ~A2 & B2;
    OUT_LG4L = ~A3 & B3;
end

// Preparación aritmética modo alto
reg x0, x1, x2, x3;
always @(*) begin
    x0 = A0 & ~B0;
    x1 = A1 & ~B1;
    x2 = A2 & ~B2;
    x3 = A3 & ~B3;
end

restadora INST_SUB (
    .A3(x3), .A2(x2), .A1(x1), .A0(x0),
    .B3(1'b0), .B2(1'b0), .B1(1'b0), .B0(1'b1),
    .S3(OUT_AR4H), .S2(OUT_AR3H), .S1(OUT_AR2H), .S0(OUT_AR1H), .C_OUT(OUT_ARNH)
);

// Operaciones aritméticas modo bajo
always @(*) begin
    OUT_AR1L = A0 | ~B0;
    OUT_AR2L = A1 | ~B1;
    OUT_AR3L = A2 | ~B2;
    OUT_AR4L = A3 | ~B3;
end
endmodule