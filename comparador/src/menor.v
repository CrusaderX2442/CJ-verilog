module BloqueMenor (
input [5:1] a, b,
output q
);
wire [5:1] n_a;
wire [5:1] eq_bits;
wire [5:1] diff;
wire [5:1] t;
not inv1(n_a[1], a[1]);
not inv2(n_a[2], a[2]);
not inv3(n_a[3], a[3]);
not inv4(n_a[4], a[4]);
not inv5(n_a[5], a[5]);
xnor xn5(eq_bits[5], a[5], b[5]);
xnor xn4(eq_bits[4], a[4], b[4]);
xnor xn3(eq_bits[3], a[3], b[3]);
xnor xn2(eq_bits[2], a[2], b[2]);
and a_d5(diff[5], n_a[5], b[5]);
and a_d4(diff[4], n_a[4], b[4]);
and a_d3(diff[3], n_a[3], b[3]);
and a_d2(diff[2], n_a[2], b[2]);
and a_d1(diff[1], n_a[1], b[1]);
buf b_t5(t[5], diff[5]);
and a_t4(t[4], diff[4], eq_bits[5]);
and a_t3(t[3], diff[3], eq_bits[5], eq_bits[4]);
and a_t2(t[2], diff[2], eq_bits[5], eq_bits[4], eq_bits[3]);
and a_t1(t[1], diff[1], eq_bits[5], eq_bits[4], eq_bits[3], eq_bits[2]);
or or_final(q, t[5], t[4], t[3], t[2], t[1]);
endmodule