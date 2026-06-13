module ComparadorPrincipal (
input [5:1] x, y,
output [3:1] out
);
wire res_menor, res_igual, res_mayor;
BloqueIgual instancia_eq (
.a(x),
.b(y),
.q(res_igual)
);
BloqueMenor instancia_lt (
.a(x),
.b(y),
.q(res_menor)
);
BloqueMayor instancia_gt (
.a(x),
.b(y),
.q(res_mayor)
);
buf b1 (out[1], res_menor);
buf b2 (out[2], res_igual);
buf b3 (out[3], res_mayor);
endmodule