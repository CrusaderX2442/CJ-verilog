module resta_4bit (
    input [3:0] A,
    input [3:0] B,
    output [4:0] Resta
);
    wire b1, b2, b3;
    wire nA0, nA1, nA2, nA3;
    wire b2_a, b2_b, b2_c;
    wire b3_a, b3_b, b3_c;
    wire b4_a, b4_b, b4_c;

    not (nA0, A[0]); not (nA1, A[1]); not (nA2, A[2]); not (nA3, A[3]);

    // Bit 0
    xor (Resta[0], A[0], B[0]);
    and (b1, nA0, B[0]);

    // Bit 1
    xor (Resta[1], A[1], B[1], b1);
    and (b2_a, nA1, B[1]);
    xnor(b2_b, A[1], B[1]);
    and (b2_c, b2_b, b1);
    or  (b2, b2_a, b2_c);

    // Bit 2
    xor (Resta[2], A[2], B[2], b2);
    and (b3_a, nA2, B[2]);
    xnor(b3_b, A[2], B[2]);
    and (b3_c, b3_b, b2);
    or  (b3, b3_a, b3_c);

    // Bit 3
    xor (Resta[3], A[3], B[3], b3);
    and (b4_a, nA3, B[3]);
    xnor(b4_b, A[3], B[3]);
    and (b4_c, b4_b, b3);
    or  (Resta[4], b4_a, b4_c); // Borrow final

endmodule