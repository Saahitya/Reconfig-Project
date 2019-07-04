module mux4_mod (input wire i0, i1, i2, i3, input wire j1, j0, output wire o);
  wire  t0, t1;
  mux2 mux2_0 (i0, i1, j1, t0);
  mux2 mux2_1 (i2, i3, j1, t1);
  mux2 mux2_2 (t0, t1, j0, o);
endmodule

module mux4_16(input wire [15:0] i_1, input wire [15:0] i_2, input wire [15:0] i_3, input wire [15:0] i_4, input wire s_1, input wire s_2, output wire [15:0] out);
mux4_mod mux4_0(i_1[0], i_2[0], i_3[0], i_4[0], s_1, s_2, out[0]);
mux4_mod mux4_1(i_1[1], i_2[1], i_3[1], i_4[1], s_1, s_2, out[1]);
mux4_mod mux4_2(i_1[2], i_2[2], i_3[2], i_4[2], s_1, s_2, out[2]);
mux4_mod mux4_3(i_1[3], i_2[3], i_3[3], i_4[3], s_1, s_2, out[3]);
mux4_mod mux4_4(i_1[4], i_2[4], i_3[4], i_4[4], s_1, s_2, out[4]);
mux4_mod mux4_5(i_1[5], i_2[5], i_3[5], i_4[5], s_1, s_2, out[5]);
mux4_mod mux4_6(i_1[6], i_2[6], i_3[6], i_4[6], s_1, s_2, out[6]);
mux4_mod mux4_7(i_1[7], i_2[7], i_3[7], i_4[7], s_1, s_2, out[7]);
mux4_mod mux4_8(i_1[8], i_2[8], i_3[8], i_4[8], s_1, s_2, out[8]);
mux4_mod mux4_9(i_1[9], i_2[9], i_3[9], i_4[9], s_1, s_2, out[9]);
mux4_mod mux4_10(i_1[10], i_2[10], i_3[10], i_4[10], s_1, s_2, out[10]);
mux4_mod mux4_11(i_1[11], i_2[11], i_3[11], i_4[11], s_1, s_2, out[11]);
mux4_mod mux4_12(i_1[12], i_2[12], i_3[12], i_4[12], s_1, s_2, out[12]);
mux4_mod mux4_13(i_1[13], i_2[13], i_3[13], i_4[13], s_1, s_2, out[13]);
mux4_mod mux4_14(i_1[14], i_2[14], i_3[14], i_4[14], s_1, s_2, out[14]);
mux4_mod mux4_15(i_1[15], i_2[15], i_3[15], i_4[15], s_1, s_2, out[15]);
endmodule

module on_the_fly(input wire clk, reset, valid, input wire [1:0]in, output wire [0:15]Q);
wire [0:15] Qm;
wire [0:15] Q_temp;
wire [0:15] Qm_temp;
mux4_16 mux4_16_Q(Q, Qm, Q, Q, in[1], in[0], Q_temp);
mux4_16 mux4_16_Qm(Qm, Qm, Q, Qm, in[1], in[0], Qm_temp);

endmodule
