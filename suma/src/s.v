module suma_4bit (
    input [3:0] A,
    input [3:0] B,
    output [4:0] Suma
);
    wire c1, c2, c3;
    wire c2_a, c2_b, c2_c;
    wire c3_a, c3_b, c3_c;
    wire c4_a, c4_b, c4_c;

    // Bit 0
    xor (Suma[0], A[0], B[0]);
    and (c1, A[0], B[0]);

    // Bit 1
    xor (Suma[1], A[1], B[1], c1);
    and (c2_a, A[1], B[1]);
    xor (c2_b, A[1], B[1]);
    and (c2_c, c2_b, c1);
    or  (c2, c2_a, c2_c);

    // Bit 2
    xor (Suma[2], A[2], B[2], c2);
    and (c3_a, A[2], B[2]);
    xor (c3_b, A[2], B[2]);
    and (c3_c, c3_b, c2);
    or  (c3, c3_a, c3_c);

    // Bit 3
    xor (Suma[3], A[3], B[3], c3);
    and (c4_a, A[3], B[3]);
    xor (c4_b, A[3], B[3]);
    and (c4_c, c4_b, c3);
    or  (Suma[4], c4_a, c4_c); // Carry final

endmodule