module V (input wire ws_1, ws0, ws1, ws2, wc_1, wc0, wc1, wc2, output wire [3:0] sum, output wire cout);
	wire out[2:0];
	assign c=1'b0;
	fa fa0(ws2,wc2,c,sum[0],out[0]);
	fa fa1(ws1,wc1,out[0],sum[1],out[1]);
	fa fa2(ws0,wc0,out[1],sum[2],out[2]);
	fa fa3(ws_1,wc_1,out[2],sum[3],cout);
endmodule