module half_subtractor (
    input A, B,
    output Diff, Bout
);
    wire not_A;

    // Diff = A XOR B
    compuerta_XOR g1 (.A(A), .B(B), .Y(Diff));

    // Bout = (NOT A) AND B
    compuerta_NOT n1 (.A(A), .Y(not_A));
    compuerta_AND a1 (.A(not_A), .B(B), .Y(Bout));
endmodule