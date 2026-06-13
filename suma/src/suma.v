module half_adder(
    input A,
    input B,
    output S,
    output Cout
);
    xor(S, A, B);
    and(Cout, A, B);
endmodule


// MÓDULO 2: SUMADOR COMPLETO (FULL ADDER)
module full_adder(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);
    wire s1, c1, c2;

    half_adder HA1(.A(A), .B(B), .S(s1), .Cout(c1));
    half_adder HA2(.A(s1), .B(Cin), .S(S), .Cout(c2));
    or(Cout, c1, c2);
endmodule


// MÓDULO 3: SUMADOR DE 4 BITS
module sumador_4bit(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout
);
    wire c1, c2, c3;

    full_adder FA0(.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(c1));
    full_adder FA1(.A(A[1]), .B(B[1]), .Cin(c1), .S(S[1]), .Cout(c2));
    full_adder FA2(.A(A[2]), .B(B[2]), .Cin(c2), .S(S[2]), .Cout(c3));
    full_adder FA3(.A(A[3]), .B(B[3]), .Cin(c3), .S(S[3]), .Cout(Cout));
endmodule