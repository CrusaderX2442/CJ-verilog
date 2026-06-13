// ========================================
// Restador de 4 bits
module restadora (
    input wire A3, A2, A1, A0,
    input wire B3, B2, B1, B0,
    output wire S3, S2, S1, S0,
    output wire C_OUT
);

wire invB3, invB2, invB1, invB0;
not NOT3(invB3, B3);
not NOT2(invB2, B2);
not NOT1(invB1, B1);
not NOT0(invB0, B0);

sumadora ADDER_SUB (
    .A3(A3), .A2(A2), .A1(A1), .A0(A0),
    .B3(invB3), .B2(invB2), .B1(invB1), .B0(invB0),
    .C_IN(1'b1),
    .S3(S3), .S2(S2), .S1(S1), .S0(S0),
    .C_OUT(C_OUT)
);
endmodule
