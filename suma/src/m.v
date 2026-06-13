module main (
    input [1:0] sel,
    input [3:0] A,
    input [3:0] B,
    output [7:0] S
);
    // Cables para conectar los módulos
    wire [4:0] res_suma;
    wire [4:0] res_resta;
    wire [7:0] res_mult;

    // Instanciación de módulos
    suma_4bit           inst_suma  (.A(A), .B(B), .Suma(res_suma));
    resta_4bit          inst_resta (.A(A), .B(B), .Resta(res_resta));
    multiplicacion_4bit inst_mult  (.A(A), .B(B), .P(res_mult));

    // Lógica de Multiplexación final (Compuertas OR/AND)
    // sel == 00 -> Suma
    // sel == 01 -> Resta
    // sel == 10 -> Multiplicación

    wire s0_n, s1_n;
    not (s0_n, sel[0]);
    not (s1_n, sel[1]);

    wire enable_suma, enable_resta, enable_mult;
    and (enable_suma, s1_n, s0_n); // 00
    and (enable_resta, s1_n, sel[0]); // 01
    and (enable_mult, sel[1], s0_n); // 10

    // Aplicar máscara de habilitación a cada bit
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : mux_bits
            wire b_sum = (i < 5) ? (res_suma[i] & enable_suma) : 1'b0;
            wire b_res = (i < 5) ? (res_resta[i] & enable_resta) : 1'b0;
            wire b_mul = res_mult[i] & enable_mult;
            
            or (S[i], b_sum, b_res, b_mul);
        end
    endgenerate

endmodule