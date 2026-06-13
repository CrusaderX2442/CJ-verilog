module restador_4bits (
    input [3:0] A, B,
    input Bin,
    output [3:0] Diff,
    output Bout
);
    wire b1, b2, b3;

    full_subtractor FS0 (.A(A[0]), .B(B[0]), .Bin(Bin), .Diff(Diff[0]), .Bout(b1));
    full_subtractor FS1 (.A(A[1]), .B(B[1]), .Bin(b1),  .Diff(Diff[1]), .Bout(b2));
    full_subtractor FS2 (.A(A[2]), .B(B[2]), .Bin(b2),  .Diff(Diff[2]), .Bout(b3));
    full_subtractor FS3 (.A(A[3]), .B(B[3]), .Bin(b3),  .Diff(Diff[3]), .Bout(Bout));
endmodule