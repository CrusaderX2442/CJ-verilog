module top_module (
    input [3:0] A,     
    input [3:0] B,     
    input [1:0] Sel,   
    output [7:0] LEDs   
);
    
    wire [3:0] res_sum;
    wire cout_sum;
   
    wire [3:0] res_sub;
    wire bout_sub;
    
    wire [7:0] res_mult;
    
    wire ground;
    wire vcc;

    compuerta_XOR zero_gen (.A(A[0]), .B(A[0]), .Y(ground)); 

    sumador_4bits U_SUM (
        .A(A), .B(B), .Cin(ground), 
        .Sum(res_sum), .Cout(cout_sum)
    );

    restador_4bits U_SUB (
        .A(A), .B(B), .Bin(ground), 
        .Diff(res_sub), .Bout(bout_sub)
    );

    multiplicador_4bits U_MULT (
        .A(A), .B(B), 
        .P(res_mult)
    );

    mux_4to1 Mux0 (
        .I0(res_sum[0]), .I1(res_sub[0]), .I2(res_mult[0]), .I3(ground),
        .S1(Sel[1]), .S0(Sel[0]), .Y(LEDs[0])
    );

    mux_4to1 Mux1 (
        .I0(res_sum[1]), .I1(res_sub[1]), .I2(res_mult[1]), .I3(ground),
        .S1(Sel[1]), .S0(Sel[0]), .Y(LEDs[1])
    );

    mux_4to1 Mux2 (
        .I0(res_sum[2]), .I1(res_sub[2]), .I2(res_mult[2]), .I3(ground),
        .S1(Sel[1]), .S0(Sel[0]), .Y(LEDs[2])
    );

    mux_4to1 Mux3 (
        .I0(res_sum[3]), .I1(res_sub[3]), .I2(res_mult[3]), .I3(ground),
        .S1(Sel[1]), .S0(Sel[0]), .Y(LEDs[3])
    );

    mux_4to1 Mux4 (
        .I0(cout_sum), .I1(bout_sub), .I2(res_mult[4]), .I3(ground),
        .S1(Sel[1]), .S0(Sel[0]), .Y(LEDs[4])
    );

    mux_4to1 Mux5 (
        .I0(ground), .I1(ground), .I2(res_mult[5]), .I3(ground),
        .S1(Sel[1]), .S0(Sel[0]), .Y(LEDs[5])
    );

    mux_4to1 Mux6 (
        .I0(ground), .I1(ground), .I2(res_mult[6]), .I3(ground),
        .S1(Sel[1]), .S0(Sel[0]), .Y(LEDs[6])
    );

    mux_4to1 Mux7 (
        .I0(ground), .I1(ground), .I2(res_mult[7]), .I3(ground),
        .S1(Sel[1]), .S0(Sel[0]), .Y(LEDs[7])
    );

endmodule