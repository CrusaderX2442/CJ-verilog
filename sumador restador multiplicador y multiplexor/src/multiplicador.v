module multiplicador_4bits (
    input [3:0] A,
    input [3:0] B,
    output [7:0] P
);

    wire pp00, pp10, pp20, pp30;
    wire pp01, pp11, pp21, pp31;
    wire pp02, pp12, pp22, pp32;
    wire pp03, pp13, pp23, pp33;

    wire s1_1, s1_2, s1_3;
    wire c1_0, c1_1, c1_2, c1_3;

    wire s2_1, s2_2, s2_3;
    wire c2_0, c2_1, c2_2, c2_3;

    wire c3_0, c3_1, c3_2;

    compuerta_AND a00 (.A(A[0]), .B(B[0]), .Y(pp00));
    compuerta_AND a10 (.A(A[1]), .B(B[0]), .Y(pp10));
    compuerta_AND a20 (.A(A[2]), .B(B[0]), .Y(pp20));
    compuerta_AND a30 (.A(A[3]), .B(B[0]), .Y(pp30));

    compuerta_AND a01 (.A(A[0]), .B(B[1]), .Y(pp01));
    compuerta_AND a11 (.A(A[1]), .B(B[1]), .Y(pp11));
    compuerta_AND a21 (.A(A[2]), .B(B[1]), .Y(pp21));
    compuerta_AND a31 (.A(A[3]), .B(B[1]), .Y(pp31));

    compuerta_AND a02 (.A(A[0]), .B(B[2]), .Y(pp02));
    compuerta_AND a12 (.A(A[1]), .B(B[2]), .Y(pp12));
    compuerta_AND a22 (.A(A[2]), .B(B[2]), .Y(pp22));
    compuerta_AND a32 (.A(A[3]), .B(B[2]), .Y(pp32));

    compuerta_AND a03 (.A(A[0]), .B(B[3]), .Y(pp03));
    compuerta_AND a13 (.A(A[1]), .B(B[3]), .Y(pp13));
    compuerta_AND a23 (.A(A[2]), .B(B[3]), .Y(pp23));
    compuerta_AND a33 (.A(A[3]), .B(B[3]), .Y(pp33));

    compuerta_AND buffer_p0 (.A(pp00), .B(pp00), .Y(P[0]));

    half_adder HA1_0 (
        .A(pp10), .B(pp01), 
        .Sum(P[1]), .Carry(c1_0)
    );

    full_adder FA1_1 (
        .A(pp20), .B(pp11), .Cin(c1_0), 
        .Sum(s1_1), .Cout(c1_1)
    );

    full_adder FA1_2 (
        .A(pp30), .B(pp21), .Cin(c1_1), 
        .Sum(s1_2), .Cout(c1_2)
    );

    half_adder HA1_3 (
        .A(pp31), .B(c1_2), 
        .Sum(s1_3), .Carry(c1_3)
    );

    half_adder HA2_0 (
        .A(s1_1), .B(pp02), 
        .Sum(P[2]), .Carry(c2_0)
    );

    full_adder FA2_1 (
        .A(s1_2), .B(pp12), .Cin(c2_0), 
        .Sum(s2_1), .Cout(c2_1)
    );

    full_adder FA2_2 (
        .A(s1_3), .B(pp22), .Cin(c2_1), 
        .Sum(s2_2), .Cout(c2_2)
    );

    full_adder FA2_3 (
        .A(c1_3), .B(pp32), .Cin(c2_2), 
        .Sum(s2_3), .Cout(c2_3)
    );

    half_adder HA3_0 (
        .A(s2_1), .B(pp03), 
        .Sum(P[3]), .Carry(c3_0)
    );

    full_adder FA3_1 (
        .A(s2_2), .B(pp13), .Cin(c3_0), 
        .Sum(P[4]), .Cout(c3_1)
    );

    full_adder FA3_2 (
        .A(s2_3), .B(pp23), .Cin(c3_1), 
        .Sum(P[5]), .Cout(c3_2)
    );

    full_adder FA3_3 (
        .A(c2_3), .B(pp33), .Cin(c3_2), 
        .Sum(P[6]), .Cout(P[7])
    );

endmodule