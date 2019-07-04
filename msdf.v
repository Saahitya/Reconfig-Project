module register (input wire clk, reset, input wire [17:0] din, output wire [17:0] dout);
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
  dfr dfrl_g (clk, reset, din[16], dout[16]);
  dfr dfrl_h (clk, reset, din[17], dout[17]);
endmodule

module msdf_mult(input wire clk, reset, valid, valid2, valid3, input wire [1:0] xi, yi, output wire [1:0] pi);
	wire [1:0] xi_, yi_;
	wire [3:0] difference;
	dfr lx0(clk, reset, xi[0], xi_[0]);
	dfr lx1(clk, reset, xi[1], xi_[1]);
	dfr ly0(clk, reset, yi[0], yi_[0]);
	dfr ly1(clk, reset, yi[1], yi_[1]);

	wire cx, cy;
	reg [3:0] lut = 4'b0010;
	mux4 mux4_x(lut, xi_[1], xi_[0], cx);
	mux4 mux4_y(lut, yi_[1], yi_[0], cy);

	wire [15:0] out_x;
	wire [15:0] out_y;
	wire [15:0] out_y_;
	wire [0:17] out_y_big;
	wire [0:17] out_y_big_;
	ca_reg_x ca_reg_x_(clk, reset, valid, yi_,  xi_, out_x);
	ca_reg_y ca_reg_y_(clk, reset, valid2, xi_,  yi, out_y);
	wire cout;
	output wire [17:0] ws_o, wc_o, ws_o_;
	
//	reg [17:0] ws = 18'b000000000000000000;
//	reg [17:0] wc = 18'b000000000000000000;
	wire [17:0] ws, wc;
	dfr dfr_(clk, reset, cout, cin);
	adder_array add(out_x, out_y, ws, wc, cx, cy, 1'b0, ws_o, wc_o, cout);
	//adder_array add({3'b0, out_x[15:3]}, {3'b0, out_y[15:3]}, ws, wc, cx, cy, cin, ws_o, wc_o, cout);


	register ws_reg(clk, reset, {difference[2:0], ws_o[13:0], 1'b0}, ws);
	register wc_reg(clk, reset, {3'b000, wc_o[13:0], 1'b0}, wc);
	
	wire cout1;
	output wire [3:0] sum;
	reg [1:0] p = 2'b00;
	V V0(ws_o[17], ws_o[16], ws_o[15], ws_o[14], wc_o[16], wc_o[15], wc_o[14], wc_o[13], sum, cout);

	libselm SELM(sum[3],sum[2],sum[1],pi[1],pi[0]);

	wire bout;
	M M0(sum[3:0],p[1:0],1'b0,difference,bout);
	always@(posedge clk) begin
	    if(valid3) begin  
	    	assign p = pi;
	    end
	end
endmodule
