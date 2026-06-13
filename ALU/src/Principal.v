module central (
    input wire A0, A1, A2, A3, B0, B1, B2, B3,
    input wire [2:0] A,
    input wire [1:0] S,
    output wire S0, S1, S2, S3, S4, SN,
    output wire a3, b3, c3, d3, e3, f3, g3,
    output wire a4, b4, c4, d4, e4, f4, g4
);

// Señales del bloque 2
wire R1_AR1H, R1_AR2H, R1_AR3H, R1_AR4H, R1_ARNH;
wire R1_AR1L, R1_AR2L, R1_AR3L, R1_AR4L;
wire R1_LG1H, R1_LG2H, R1_LG3H, R1_LG4H;
wire R1_LG1L, R1_LG2L, R1_LG3L, R1_LG4L;

operation_block_2 inst_op2 (
    .A0(A0), .A1(A1), .A2(A2), .A3(A3),
    .B0(B0), .B1(B1), .B2(B2), .B3(B3),
    .OUT_AR1H(R1_AR1H), .OUT_AR2H(R1_AR2H), .OUT_AR3H(R1_AR3H), .OUT_AR4H(R1_AR4H), .OUT_ARNH(R1_ARNH),
    .OUT_AR1L(R1_AR1L), .OUT_AR2L(R1_AR2L), .OUT_AR3L(R1_AR3L), .OUT_AR4L(R1_AR4L),
    .OUT_LG1H(R1_LG1H), .OUT_LG2H(R1_LG2H), .OUT_LG3H(R1_LG3H), .OUT_LG4H(R1_LG4H),
    .OUT_LG1L(R1_LG1L), .OUT_LG2L(R1_LG2L), .OUT_LG3L(R1_LG3L), .OUT_LG4L(R1_LG4L)
);

// Señales del bloque 9
wire R2_AR1H, R2_AR2H, R2_AR3H, R2_AR4H, R2_AR5H;
wire R2_AR1L, R2_AR2L, R2_AR3L, R2_AR4L, R2_AR5L;
wire R2_LG1H, R2_LG2H, R2_LG3H, R2_LG4H;
wire R2_LG1L, R2_LG2L, R2_LG3L, R2_LG4L;

operation_block_9 inst_op9 (
    .A0(A0), .A1(A1), .A2(A2), .A3(A3),
    .B0(B0), .B1(B1), .B2(B2), .B3(B3),
    .OUT_AR1H(R2_AR1H), .OUT_AR2H(R2_AR2H), .OUT_AR3H(R2_AR3H), .OUT_AR4H(R2_AR4H), .OUT_AR5H(R2_AR5H),
    .OUT_AR1L(R2_AR1L), .OUT_AR2L(R2_AR2L), .OUT_AR3L(R2_AR3L), .OUT_AR4L(R2_AR4L), .OUT_AR5L(R2_AR5L),
    .OUT_LG1H(R2_LG1H), .OUT_LG2H(R2_LG2H), .OUT_LG3H(R2_LG3H), .OUT_LG4H(R2_LG4H),
    .OUT_LG1L(R2_LG1L), .OUT_LG2L(R2_LG2L), .OUT_LG3L(R2_LG3L), .OUT_LG4L(R2_LG4L)
);

// Señales del bloque 11
wire R3_AR1H, R3_AR2H, R3_AR3H, R3_AR4H;
wire R3_AR1L, R3_AR2L, R3_AR3L, R3_AR4L, R3_AR5L;
wire R3_LG1H, R3_LG2H, R3_LG3H, R3_LG4H;
wire R3_LG1L, R3_LG2L, R3_LG3L, R3_LG4L;

operation_block_11 inst_op11 (
    .A0(A0), .A1(A1), .A2(A2), .A3(A3),
    .B0(B0), .B1(B1), .B2(B2), .B3(B3),
    .OUT_AR1H(R3_AR1H), .OUT_AR2H(R3_AR2H), .OUT_AR3H(R3_AR3H), .OUT_AR4H(R3_AR4H),
    .OUT_AR1L(R3_AR1L), .OUT_AR2L(R3_AR2L), .OUT_AR3L(R3_AR3L), .OUT_AR4L(R3_AR4L), .OUT_AR5L(R3_AR5L),
    .OUT_LG1H(R3_LG1H), .OUT_LG2H(R3_LG2H), .OUT_LG3H(R3_LG3H), .OUT_LG4H(R3_LG4H),
    .OUT_LG1L(R3_LG1L), .OUT_LG2L(R3_LG2L), .OUT_LG3L(R3_LG3L), .OUT_LG4L(R3_LG4L)
);

// Señales del bloque 13
wire R4_AR1H, R4_AR2H, R4_AR3H, R4_AR4H, R4_AR5H;
wire R4_AR1L, R4_AR2L, R4_AR3L, R4_AR4L, R4_AR5L;
wire R4_LG1H, R4_LG2H, R4_LG3H, R4_LG4H;
wire R4_LG1L, R4_LG2L, R4_LG3L, R4_LG4L;

operation_block_13 inst_op13 (
    .A0(A0), .A1(A1), .A2(A2), .A3(A3),
    .B0(B0), .B1(B1), .B2(B2), .B3(B3),
    .OUT_AR1H(R4_AR1H), .OUT_AR2H(R4_AR2H), .OUT_AR3H(R4_AR3H), .OUT_AR4H(R4_AR4H), .OUT_AR5H(R4_AR5H),
    .OUT_AR1L(R4_AR1L), .OUT_AR2L(R4_AR2L), .OUT_AR3L(R4_AR3L), .OUT_AR4L(R4_AR4L), .OUT_AR5L(R4_AR5L),
    .OUT_LG1H(R4_LG1H), .OUT_LG2H(R4_LG2H), .OUT_LG3H(R4_LG3H), .OUT_LG4H(R4_LG4H),
    .OUT_LG1L(R4_LG1L), .OUT_LG2L(R4_LG2L), .OUT_LG3L(R4_LG3L), .OUT_LG4L(R4_LG4L)
);

// Señales del bloque 8
wire R5_AR1H, R5_AR2H, R5_AR3H, R5_AR4H, R5_AR5H;
wire R5_AR1L, R5_AR2L, R5_AR3L, R5_AR4L, R5_AR5L;
wire R5_LG1H, R5_LG2H, R5_LG3H, R5_LG4H;
wire R5_LG1L, R5_LG2L, R5_LG3L, R5_LG4L;

operation_block_8 inst_op8 (
    .A0(A0), .A1(A1), .A2(A2), .A3(A3),
    .B0(B0), .B1(B1), .B2(B2), .B3(B3),
    .OUT_AR1H(R5_AR1H), .OUT_AR2H(R5_AR2H), .OUT_AR3H(R5_AR3H), .OUT_AR4H(R5_AR4H), .OUT_AR5H(R5_AR5H),
    .OUT_AR1L(R5_AR1L), .OUT_AR2L(R5_AR2L), .OUT_AR3L(R5_AR3L), .OUT_AR4L(R5_AR4L), .OUT_AR5L(R5_AR5L),
    .OUT_LG1H(R5_LG1H), .OUT_LG2H(R5_LG2H), .OUT_LG3H(R5_LG3H), .OUT_LG4H(R5_LG4H),
    .OUT_LG1L(R5_LG1L), .OUT_LG2L(R5_LG2L), .OUT_LG3L(R5_LG3L), .OUT_LG4L(R5_LG4L)
);

// Señales del bloque 5
wire R6_AR1H, R6_AR2H, R6_AR3H, R6_AR4H, R6_AR5H;
wire R6_AR1L, R6_AR2L, R6_AR3L, R6_AR4L, R6_AR5L;
wire R6_LG1H, R6_LG2H, R6_LG3H, R6_LG4H;
wire R6_LG1L, R6_LG2L, R6_LG3L, R6_LG4L;

operation_block_5 inst_op5 (
    .A0(A0), .A1(A1), .A2(A2), .A3(A3),
    .B0(B0), .B1(B1), .B2(B2), .B3(B3),
    .OUT_AR1H(R6_AR1H), .OUT_AR2H(R6_AR2H), .OUT_AR3H(R6_AR3H), .OUT_AR4H(R6_AR4H), .OUT_AR5H(R6_AR5H),
    .OUT_AR1L(R6_AR1L), .OUT_AR2L(R6_AR2L), .OUT_AR3L(R6_AR3L), .OUT_AR4L(R6_AR4L), .OUT_AR5L(R6_AR5L),
    .OUT_LG1H(R6_LG1H), .OUT_LG2H(R6_LG2H), .OUT_LG3H(R6_LG3H), .OUT_LG4H(R6_LG4H),
    .OUT_LG1L(R6_LG1L), .OUT_LG2L(R6_LG2L), .OUT_LG3L(R6_LG3L), .OUT_LG4L(R6_LG4L)
);

// Señales multiplexadas lógicas y aritméticas
wire LOG0H, LOG1H, LOG2H, LOG3H;
wire LOG0L, LOG1L, LOG2L, LOG3L;
wire ARI0H, ARI1H, ARI2H, ARI3H, ARI4H, ARINH;
wire ARI0L, ARI1L, ARI2L, ARI3L, ARI4L, ARINL;

// Multiplexado de señales lógicas High
selector_8x1 MX_LOG0H (.sel(A), .D0(R1_LG1H), .D1(R2_LG1H), .D2(R3_LG1H), .D3(R4_LG1H), .D4(R5_LG1H), .D5(R6_LG1H), .D6(1'b0), .D7(1'b0), .out(LOG0H));
selector_8x1 MX_LOG1H (.sel(A), .D0(R1_LG2H), .D1(R2_LG2H), .D2(R3_LG2H), .D3(R4_LG2H), .D4(R5_LG2H), .D5(R6_LG2H), .D6(1'b0), .D7(1'b0), .out(LOG1H));
selector_8x1 MX_LOG2H (.sel(A), .D0(R1_LG3H), .D1(R2_LG3H), .D2(R3_LG3H), .D3(R4_LG3H), .D4(R5_LG3H), .D5(R6_LG3H), .D6(1'b0), .D7(1'b0), .out(LOG2H));
selector_8x1 MX_LOG3H (.sel(A), .D0(R1_LG4H), .D1(R2_LG4H), .D2(R3_LG4H), .D3(R4_LG4H), .D4(R5_LG4H), .D5(R6_LG4H), .D6(1'b0), .D7(1'b0), .out(LOG3H));

// Multiplexado de señales lógicas Low
selector_8x1 MX_LOG0L (.sel(A), .D0(R1_LG1L), .D1(R2_LG1L), .D2(R3_LG1L), .D3(R4_LG1L), .D4(R5_LG1L), .D5(R6_LG1L), .D6(1'b0), .D7(1'b0), .out(LOG0L));
selector_8x1 MX_LOG1L (.sel(A), .D0(R1_LG2L), .D1(R2_LG2L), .D2(R3_LG2L), .D3(R4_LG2L), .D4(R5_LG2L), .D5(R6_LG2L), .D6(1'b0), .D7(1'b0), .out(LOG1L));
selector_8x1 MX_LOG2L (.sel(A), .D0(R1_LG3L), .D1(R2_LG3L), .D2(R3_LG3L), .D3(R4_LG3L), .D4(R5_LG3L), .D5(R6_LG3L), .D6(1'b0), .D7(1'b0), .out(LOG2L));
selector_8x1 MX_LOG3L (.sel(A), .D0(R1_LG4L), .D1(R2_LG4L), .D2(R3_LG4L), .D3(R4_LG4L), .D4(R5_LG4L), .D5(R6_LG4L), .D6(1'b0), .D7(1'b0), .out(LOG3L));

// Multiplexado de señales aritméticas High
selector_8x1 MX_ARI0H (.sel(A), .D0(R1_AR1H), .D1(R2_AR1H), .D2(R3_AR1H), .D3(R4_AR1H), .D4(R5_AR1H), .D5(R6_AR1H), .D6(1'b0), .D7(1'b0), .out(ARI0H));
selector_8x1 MX_ARI1H (.sel(A), .D0(R1_AR2H), .D1(R2_AR2H), .D2(R3_AR2H), .D3(R4_AR2H), .D4(R5_AR2H), .D5(R6_AR2H), .D6(1'b0), .D7(1'b0), .out(ARI1H));
selector_8x1 MX_ARI2H (.sel(A), .D0(R1_AR3H), .D1(R2_AR3H), .D2(R3_AR3H), .D3(R4_AR3H), .D4(R5_AR3H), .D5(R6_AR3H), .D6(1'b0), .D7(1'b0), .out(ARI2H));
selector_8x1 MX_ARI3H (.sel(A), .D0(R1_AR4H), .D1(R2_AR4H), .D2(R3_AR4H), .D3(R4_AR4H), .D4(R5_AR4H), .D5(R6_AR4H), .D6(1'b0), .D7(1'b0), .out(ARI3H));
selector_8x1 MX_ARI4H (.sel(A), .D0(R1_ARNH), .D1(R2_AR5H), .D2(1'b0), .D3(R4_AR5H), .D4(R5_AR5H), .D5(R6_AR5H), .D6(1'b0), .D7(1'b0), .out(ARI4H));

// Multiplexado de señales aritméticas Low
selector_8x1 MX_ARI0L (.sel(A), .D0(R1_AR1L), .D1(R2_AR1L), .D2(R3_AR1L), .D3(R4_AR1L), .D4(R5_AR1L), .D5(R6_AR1L), .D6(1'b0), .D7(1'b0), .out(ARI0L));
selector_8x1 MX_ARI1L (.sel(A), .D0(R1_AR2L), .D1(R2_AR2L), .D2(R3_AR2L), .D3(R4_AR2L), .D4(R5_AR2L), .D5(R6_AR2L), .D6(1'b0), .D7(1'b0), .out(ARI1L));
selector_8x1 MX_ARI2L (.sel(A), .D0(R1_AR3L), .D1(R2_AR3L), .D2(R3_AR3L), .D3(R4_AR3L), .D4(R5_AR3L), .D5(R6_AR3L), .D6(1'b0), .D7(1'b0), .out(ARI2L));
selector_8x1 MX_ARI3L (.sel(A), .D0(R1_AR4L), .D1(R2_AR4L), .D2(R3_AR4L), .D3(R4_AR4L), .D4(R5_AR4L), .D5(R6_AR4L), .D6(1'b0), .D7(1'b0), .out(ARI3L));
selector_8x1 MX_ARI4L (.sel(A), .D0(1'b0), .D1(R2_AR5L), .D2(R3_AR5L), .D3(R4_AR5L), .D4(R5_AR5L), .D5(R6_AR5L), .D6(1'b0), .D7(1'b0), .out(ARI4L));

// Multiplexores finales de salida
selector_4x1 MX_OUT0 (.sel(S), .in0(LOG0H), .in1(LOG0L), .in2(ARI0H), .in3(ARI0L), .out(S0));
selector_4x1 MX_OUT1 (.sel(S), .in0(LOG1H), .in1(LOG1L), .in2(ARI1H), .in3(ARI1L), .out(S1));
selector_4x1 MX_OUT2 (.sel(S), .in0(LOG2H), .in1(LOG2L), .in2(ARI2H), .in3(ARI2L), .out(S2));
selector_4x1 MX_OUT3 (.sel(S), .in0(LOG3H), .in1(LOG3L), .in2(ARI3H), .in3(ARI3L), .out(S3));
selector_4x1 MX_OUT4 (.sel(S), .in0(1'b0), .in1(1'b0), .in2(ARI4H), .in3(ARI4L), .out(S4));
selector_4x1 MX_OUTN (.sel(S), .in0(1'b0), .in1(1'b0), .in2(ARI4H), .in3(ARI4L), .out(SN));

// Conversión a BCD y displays
wire BCD_Aa, BCD_Ba, BCD_Ca, BCD_Da, BCD_Ab, BCD_Bb, BCD_Cb, BCD_Db;
buf FIXED3(BCD_Aa, 1'b0);
buf FIXED4(BCD_Ba, 1'b0);

binary5_to_bcd CONV_BCD (
    .A(S4), .B(S3), .C(S2), .D(S1), .E(S0),
    .C1(BCD_Ca), .D1(BCD_Da), .A2(BCD_Ab), .B2(BCD_Bb), .C2(BCD_Cb), .D2(BCD_Db)
);

display_7seg DISP_TENS (
    .A(BCD_Aa), .B(BCD_Ba), .C(BCD_Ca), .D(BCD_Da),
    .a(a3), .b(b3), .c(c3), .d(d3), .e(e3), .f(f3), .g(g3)
);

display_7seg DISP_UNITS (
    .A(BCD_Ab), .B(BCD_Bb), .C(BCD_Cb), .D(BCD_Db),
    .a(a4), .b(b4), .c(c4), .d(d4), .e(e4), .f(f4), .g(g4)
);

endmodule