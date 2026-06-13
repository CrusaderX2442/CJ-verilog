module BloqueIgual (
input [5:1] a, b,
output q
);
wire [5:1] coinc;
and g_final (q, coinc[1], coinc[2], coinc[3], coinc[4], coinc[5]);
xnor x1 (coinc[1], a[1], b[1]);
xnor x5 (coinc[5], a[5], b[5]);
xnor x2 (coinc[2], a[2], b[2]);
xnor x4 (coinc[4], a[4], b[4]);
xnor x3 (coinc[3], a[3], b[3]);
endmodule