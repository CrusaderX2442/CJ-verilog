module half_adder (
    input A, B,
    output Sum, Carry
);
    // Usamos TUS módulos, no primitivas
    compuerta_XOR g1 (.A(A), .B(B), .Y(Sum));
    compuerta_AND g2 (.A(A), .B(B), .Y(Carry));
endmodule
