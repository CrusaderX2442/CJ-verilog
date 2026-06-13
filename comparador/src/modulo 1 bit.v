module comp_1bit (
    input  wire a,       // Bit de la palabra A
    input  wire b,       // Bit de la palabra B
    input  wire i_gt,    // Input Greater Than (Mayor que) de la etapa anterior
    input  wire i_eq,    // Input Equal (Igual) de la etapa anterior
    input  wire i_lt,    // Input Less Than (Menor que) de la etapa anterior
    output wire o_gt,    // Output Mayor
    output wire o_eq,    // Output Igual
    output wire o_lt     // Output Menor
);

    assign o_gt = i_gt | (i_eq & (a & ~b));

    assign o_lt = i_lt | (i_eq & (~a & b));

    assign o_eq = i_eq & (a == b);

endmodule