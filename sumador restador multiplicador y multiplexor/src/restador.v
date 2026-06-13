module full_subtractor (
    input A, B, Bin,
    output Diff, Bout
);
    wire d1, b1, b2;

    half_subtractor HS1 (.A(A), .B(B), .Diff(d1), .Bout(b1));
    half_subtractor HS2 (.A(d1), .B(Bin), .Diff(Diff), .Bout(b2));
    
    compuerta_OR OR1 (.A(b1), .B(b2), .Y(Bout));
endmodule