// ========================================
// Conversor binario de 5 bits a BCD
module binary5_to_bcd (
    input wire A, B, C, D, E,
    output wire C1, D1, A2, B2, C2, D2
);

// Inversores de entrada
wire invA, invB, invC, invD, invE;
not INV0(invA, A);
not INV1(invB, B);
not INV2(invC, C);
not INV3(invD, D);
not INV4(invE, E);

// Salida C1
wire w0, w1;
and GATE00(w0, A, C);
and GATE01(w1, A, B);
or GATE_C1(C1, w0, w1);

// Salida D1
wire w2, w3, w4, w5;
and GATE02(w2, A, invB, invC);
and GATE03(w3, invA, B, D);
and GATE04(w4, invA, B, C);
and GATE05(w5, B, C, D);
or GATE_D1(D1, w2, w3, w4, w5);

// Salida A2
wire w6, w7, w8;
and GATE06(w6, invA, B, invC, invD);
and GATE07(w7, A, invB, invC, D);
and GATE08(w8, A, B, C, invD);
or GATE_A2(A2, w6, w7, w8);

// Salida B2
wire w9, w10, w11, w12;
and GATE09(w9, invA, invB, C);
and GATE10(w10, A, invC, invD);
and GATE11(w11, invA, C, D);
and GATE12(w12, A, B, invC);
or GATE_B2(B2, w9, w10, w11, w12);

// Salida C2
wire w13, w14, w15, w16, w17;
and GATE13(w13, invA, invB, D);
and GATE14(w14, invB, C, D);
and GATE15(w15, A, invB, invC, invD);
and GATE16(w16, invA, B, C, invD);
and GATE17(w17, A, B, invC, D);
or GATE_C2(C2, w13, w14, w15, w16, w17);

// Salida D2
buf BUFFER0(D2, E);
endmodule