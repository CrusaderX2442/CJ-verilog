
module compuerta_AND (input A, input B, output Y);
    and(Y, A, B);
endmodule

module compuerta_OR (input A, input B, output Y);
    or(Y, A, B);
endmodule

module compuerta_XOR (input A, input B, output Y);
    xor(Y, A, B);
endmodule

module compuerta_NOT (input A, output Y);
    not(Y, A);
endmodule