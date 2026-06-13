module top_comparador (
    input  wire [4:0] A,      // Entrada A de 5 bits (Switches)
    input  wire [4:0] B,      // Entrada B de 5 bits (Switches)
    output wire led_mayor,    // Salida LED Mayor
    output wire led_igual,    // Salida LED Igual
    output wire led_menor     // Salida LED Menor
);

    wire g4, e4, l4; // Salidas del bit 4
    wire g3, e3, l3; // Salidas del bit 3
    wire g2, e2, l2; // Salidas del bit 2
    wire g1, e1, l1; // Salidas del bit 1

    comp_1bit bit4 (
        .a(A[4]), .b(B[4]),
        .i_gt(1'b0), .i_eq(1'b1), .i_lt(1'b0), 
        .o_gt(g4),   .o_eq(e4),   .o_lt(l4)
    );

    comp_1bit bit3 (
        .a(A[3]), .b(B[3]),
        .i_gt(g4), .i_eq(e4), .i_lt(l4), // Recibe del bit 4
        .o_gt(g3), .o_eq(e3), .o_lt(l3)
    );

    comp_1bit bit2 (
        .a(A[2]), .b(B[2]),
        .i_gt(g3), .i_eq(e3), .i_lt(l3), // Recibe del bit 3
        .o_gt(g2), .o_eq(e2), .o_lt(l2)
    );

    comp_1bit bit1 (
        .a(A[1]), .b(B[1]),
        .i_gt(g2), .i_eq(e2), .i_lt(l2), // Recibe del bit 2
        .o_gt(g1), .o_eq(e1), .o_lt(l1)
    );

    comp_1bit bit0 (
        .a(A[0]), .b(B[0]),
        .i_gt(g1), .i_eq(e1), .i_lt(l1), // Recibe del bit 1
        .o_gt(led_mayor), .o_eq(led_igual), .o_lt(led_menor) // Salida final a LEDs
    );

endmodule