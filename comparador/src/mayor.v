module BloqueMayor (
input [5:1] a, b,
output q
);
wire [5:1] n_b;
wire [5:1] par;
wire [5:1] gana;
wire [5:1] seq;
or salida(q, seq[5], seq[4], seq[3], seq[2], seq[1]);
not n1(n_b[1], b[1]);
not n2(n_b[2], b[2]);
not n3(n_b[3], b[3]);
not n4(n_b[4], b[4]);
not n5(n_b[5], b[5]);
and g5(gana[5], a[5], n_b[5]);
and g4(gana[4], a[4], n_b[4]);
and g3(gana[3], a[3], n_b[3]);
and g2(gana[2], a[2], n_b[2]);
and g1(gana[1], a[1], n_b[1]);
xnor x5(par[5], a[5], b[5]);
xnor x4(par[4], a[4], b[4]);
xnor x3(par[3], a[3], b[3]);
xnor x2(par[2], a[2], b[2]);
and s1(seq[1], gana[1], par[2], par[3], par[4], par[5]);
and s2(seq[2], gana[2], par[3], par[4], par[5]);
and s3(seq[3], gana[3], par[4], par[5]);
and s4(seq[4], gana[4], par[5]);
buf s5(seq[5], gana[5]);
endmodule