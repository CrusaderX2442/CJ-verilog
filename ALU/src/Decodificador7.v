
// Decodificador a 7 segmentos
module display_7seg (
    input wire A, B, C, D,
    output wire a, b, c, d, e, f, g
);

// Inversores
wire invA, invB, invC, invD;
not NOT_A(invA, A);
not NOT_B(invB, B);
not NOT_C(invC, C);
not NOT_D(invD, D);

// Términos compartidos
wire term_BC, term_BCD, term_AC, term_ABC;
and G1(term_BC, invB, invC);
and G2(term_BCD, term_BC, invD);
and G3(term_AC, invA, C);
and G4(term_ABC, A, invB, invC);

// Segmento a
wire seg_a1, seg_a3, seg_a4;
and GA1(seg_a1, A, invB, invC);
and GA3(seg_a3, term_BCD);
and GA4(seg_a4, invA, B, invC, D);
or OR_A(a, seg_a1, term_AC, seg_a3, seg_a4);

// Segmento b
wire seg_b1, seg_b2, seg_b3;
and GB1(seg_b1, invA, invB);
and GB2(seg_b2, invA, invC, invD);
and GB3(seg_b3, invA, C, D);
or OR_B(b, seg_b1, seg_b2, seg_b3, term_ABC);

// Segmento c
wire seg_c1, seg_c2, seg_c3;
and GC1(seg_c1, invA, B);
and GC2(seg_c2, invA, invC);
and GC3(seg_c3, invA, D);
or OR_C(c, seg_c1, seg_c2, seg_c3, term_ABC);

// Segmento d
wire seg_d1, seg_d2, seg_d3, seg_d4;
and GD1(seg_d1, term_BCD);
and GD2(seg_d2, invA, C, invD);
and GD3(seg_d3, invA, invB, C);
and GD4(seg_d4, invA, B, invC, D);
or OR_D(d, seg_d1, seg_d2, seg_d3, seg_d4);

// Segmento e
wire seg_e2;
and GE2(seg_e2, invA, C, invD);
or OR_E(e, term_BCD, seg_e2);

// Segmento f
wire seg_f1, seg_f2, seg_f4;
and GF1(seg_f1, invA, B, invC);
and GF2(seg_f2, term_BCD);
and GF4(seg_f4, invA, B, invD);
or OR_F(f, term_ABC, seg_f1, seg_f2, seg_f4);

// Segmento g
wire seg_g1, seg_g2, seg_g3;
and GG1(seg_g1, invA, C, invD);
and GG2(seg_g2, invA, invB, C);
and GG3(seg_g3, invA, B, invC);
or OR_G(g, seg_g1, seg_g2, seg_g3, term_ABC);
endmodule