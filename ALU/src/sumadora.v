// ========================================
// Sumador de 4 bits
module sumadora (
    input wire A3, A2, A1, A0,
    input wire B3, B2, B1, B0,
    input wire C_IN,
    output wire S3, S2, S1, S0,
    output wire C_OUT
);

// Sumador completo bit 0
wire xor0, and0, and1, carry0;
xor XOR1(xor0, A0, B0);
xor XOR2(S0, xor0, C_IN);
and AND0(and0, xor0, C_IN);
and AND1(and1, A0, B0);
or OR0(carry0, and0, and1);

// Sumador completo bit 1
wire xor1, and2, and3, carry1;
xor XOR3(xor1, A1, B1);
xor XOR4(S1, xor1, carry0);
and AND2(and2, xor1, carry0);
and AND3(and3, A1, B1);
or OR1(carry1, and2, and3);

// Sumador completo bit 2
wire xor2, and4, and5, carry2;
xor XOR5(xor2, A2, B2);
xor XOR6(S2, xor2, carry1);
and AND4(and4, xor2, carry1);
and AND5(and5, A2, B2);
or OR2(carry2, and4, and5);

// Sumador completo bit 3
wire xor3, and6, and7;
xor XOR7(xor3, A3, B3);
xor XOR8(S3, xor3, carry2);
and AND6(and6, xor3, carry2);
and AND7(and7, A3, B3);
or OR3(C_OUT, and6, and7);
endmodule
