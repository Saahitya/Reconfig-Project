module M(input wire [3:0] v, input wire [1:0] p, input wire bin, output wire [3:0] difference, output wire bout);
	wire x;
	wire [3:0] b;
	xor2 xor0(p[0], p[1], x);
	assign difference[0]=v[0];
	assign difference[1]=v[1];
	addsub addsub_0(p[1], v[2], x, p[1], difference[2], b[0]);
	addsub addsub_1(p[1], v[3], 1'b0, b[0], difference[3], bout);
	//addsub addsub_2(p[0], v[2], 1'b0, b[1], difference[2], b[2]);
	//addsub addsub_3(p[0], v[3], 1'b0, b[2], b[3], bout);
endmodule

