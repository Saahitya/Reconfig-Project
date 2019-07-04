module register_16 (input wire clk, reset, input wire [15:0] din, output wire [15:0] dout);
  dfr dfrl_0 (clk, reset, din['h0], dout['h0]);
  dfr dfrl_1 (clk, reset, din['h1], dout['h1]);
  dfr dfrl_2 (clk, reset, din['h2], dout['h2]);
  dfr dfrl_3 (clk, reset, din['h3], dout['h3]);
  dfr dfrl_4 (clk, reset, din['h4], dout['h4]);
  dfr dfrl_5 (clk, reset, din['h5], dout['h5]);
  dfr dfrl_6 (clk, reset, din['h6], dout['h6]);
  dfr dfrl_7 (clk, reset, din['h7], dout['h7]);
  dfr dfrl_8 (clk, reset, din['h8], dout['h8]);
  dfr dfrl_9 (clk, reset, din['h9], dout['h9]);
  dfr dfrl_a (clk, reset, din['ha], dout['ha]);
  dfr dfrl_b (clk, reset, din['hb], dout['hb]);
  dfr dfrl_c (clk, reset, din['hc], dout['hc]);
  dfr dfrl_d (clk, reset, din['hd], dout['hd]);
  dfr dfrl_e (clk, reset, din['he], dout['he]);
  dfr dfrl_f (clk, reset, din['hf], dout['hf]);
endmodule

module invert_16(input wire [15:0] in, output wire [15:0] out);
invert invert_0(in[0], out[0]);
invert invert_1(in[1], out[1]);
invert invert_2(in[2], out[2]);
invert invert_3(in[3], out[3]);
invert invert_4(in[4], out[4]);
invert invert_5(in[5], out[5]);
invert invert_6(in[6], out[6]);
invert invert_7(in[7], out[7]);
invert invert_8(in[8], out[8]);
invert invert_9(in[9], out[9]);
invert invert_10(in[10], out[10]);
invert invert_11(in[11], out[11]);
invert invert_12(in[12], out[12]);
invert invert_13(in[13], out[13]);
invert invert_14(in[14], out[14]);
invert invert_15(in[15], out[15]);
endmodule

module ca_reg_x(input wire clk, reset, valid, input wire [1:0] select_input,  input wire [1:0] in, output wire [15:0] out);
wire [15:0]on_the_fly_output;
wire [15:0]inverted_on_the_fly_output;
// assign valid = 1'b1;
on_the_fly on_the_fly_0(clk, reset, valid, in, on_the_fly_output);
reg [3:0] lut = 4'b0010;
invert_16 invert_16_0({3'b0, on_the_fly_output[15:3]}, inverted_on_the_fly_output);
mux4_16 mux4_16_0(16'b0, {3'b0, on_the_fly_output[15:3]}, inverted_on_the_fly_output, 16'b0, select_input[1], select_input[0], out);
endmodule

// module ca_reg_x(input wire clk, reset, valid, input wire [1:0] select_input,  input wire [1:0] in, output wire [18:0] out);
// wire [15:0]on_the_fly_output;
// wire [15:0]inverted_on_the_fly_output;
// // assign valid = 1'b1;
// assign out[18:16] = 3'b0;
// on_the_fly on_the_fly_0(clk, reset, valid, in, on_the_fly_output);
// reg [3:0] lut = 4'b0010;
// invert_16 invert_16_0(on_the_fly_output, inverted_on_the_fly_output);
// mux4_16 mux4_16_0(16'b0, on_the_fly_output, inverted_on_the_fly_output, 16'b0, select_input[1], select_input[0], out[15:0]);
// endmodule


module ca_reg_y(input wire clk, reset, valid, input wire [1:0] select_input,  input wire [1:0] in, output wire [15:0] out);
wire [15:0]on_the_fly_output;
wire [15:0]on_the_fly_output_;
wire [15:0]inverted_on_the_fly_output;
// assign valid = 1'b1;
on_the_fly on_the_fly_0(clk, reset, valid, in, on_the_fly_output_);
register_16 register_16_0(clk ,reset, on_the_fly_output_, on_the_fly_output);
reg [3:0] lut = 4'b0010;
invert_16 invert_16_0({3'b0, on_the_fly_output[15:3]}, inverted_on_the_fly_output);
mux4_16 mux4_16_0(16'b0, {3'b0, on_the_fly_output[15:3]}, inverted_on_the_fly_output, 16'b0, select_input[1], select_input[0], out);
endmodule
