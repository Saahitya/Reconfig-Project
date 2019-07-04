module comp_add (input wire i0, i1, i2, i3, cin, output wire o1, carry, cout);
	wire o2;
	fa m0(i0,i1,i2,o2,cout);
	fa m1(i3,o2,cin,o1,carry);
endmodule

// module adder_array (input wire [15:0] x, y, input wire [17:0] ws_i,wc_i, input wire cx,cy, cin, output wire [17:0] ws_o,wc_o ,output wire cout);
// 	wire [0:16] c;
// 	comp_add m0(x[0],y[0],cx,cy,cin,ws_o[0],wc_o[0],c[0]); //cin from the previous digit
// 	comp_add m1(x[1],y[1],ws_i[1],wc_i[1],c[0],ws_o[1],wc_o[1],c[1]);
// 	comp_add m2(x[2],y[2],ws_i[2],wc_i[2],c[1],ws_o[2],wc_o[2],c[2]);
// 	comp_add m3(x[3],y[3],ws_i[3],wc_i[3],c[2],ws_o[3],wc_o[3],c[3]);
// 	comp_add m4(x[4],y[4],ws_i[4],wc_i[4],c[3],ws_o[4],wc_o[4],c[4]);
// 	comp_add m5(x[5],y[5],ws_i[5],wc_i[5],c[4],ws_o[5],wc_o[5],c[5]);
// 	comp_add m6(x[6],y[6],ws_i[6],wc_i[6],c[5],ws_o[6],wc_o[6],c[6]);
// 	comp_add m7(x[7],y[7],ws_i[7],wc_i[7],c[6],ws_o[7],wc_o[7],c[7]);
// 	comp_add m8(x[8],y[8],ws_i[8],wc_i[8],c[7],ws_o[8],wc_o[8],c[8]);
// 	comp_add m9(x[9],y[9],ws_i[9],wc_i[9],c[8],ws_o[9],wc_o[9],c[9]);
// 	comp_add m10(x[10],y[10],ws_i[10],wc_i[10],c[9],ws_o[10],wc_o[10],c[10]);
// 	comp_add m11(x[11],y[11],ws_i[11],wc_i[11],c[10],ws_o[11],wc_o[11],c[11]);
// 	comp_add m12(x[12],y[12],ws_i[12],wc_i[12],c[11],ws_o[12],wc_o[12],c[12]);
// 	comp_add m13(x[13],y[13],ws_i[13],wc_i[13],c[12],ws_o[13],wc_o[13],c[13]);
// 	comp_add m14(x[14],y[14],ws_i[14],wc_i[14],c[13],ws_o[14],wc_o[14],c[14]);
// 	comp_add m15(x[15],y[15],ws_i[15],wc_i[15],c[14],ws_o[15],wc_o[15],c[15]);
// 	comp_add m16(x[15],y[15],ws_i[16],wc_i[16],c[15],ws_o[16],wc_o[16],c[16]); //using wc_i[0] as padding since this will always be 0
// 	comp_add m17(x[15],y[15],ws_i[17],wc_i[17],c[16],ws_o[17],wc_o[17],cout); //cout to the next digit
// endmodule

module adder_array (input wire [15:0] x, y, input wire [17:0] ws_i,wc_i, input wire cx,cy, cin, output wire [17:0] ws_o,wc_o ,output wire cout);
	wire [0:16] c;
	comp_add m0(x[0],y[0],cx,cy,cin,ws_o[0],wc_o[0],c[0]); //cin from the previous digit
	comp_add m1(x[1],y[1],ws_i[1],wc_i[1],c[0],ws_o[1],wc_o[1],c[1]);
	comp_add m2(x[2],y[2],ws_i[2],wc_i[2],c[1],ws_o[2],wc_o[2],c[2]);
	comp_add m3(x[3],y[3],ws_i[3],wc_i[3],c[2],ws_o[3],wc_o[3],c[3]);
	comp_add m4(x[4],y[4],ws_i[4],wc_i[4],c[3],ws_o[4],wc_o[4],c[4]);
	comp_add m5(x[5],y[5],ws_i[5],wc_i[5],c[4],ws_o[5],wc_o[5],c[5]);
	comp_add m6(x[6],y[6],ws_i[6],wc_i[6],c[5],ws_o[6],wc_o[6],c[6]);
	comp_add m7(x[7],y[7],ws_i[7],wc_i[7],c[6],ws_o[7],wc_o[7],c[7]);
	comp_add m8(x[8],y[8],ws_i[8],wc_i[8],c[7],ws_o[8],wc_o[8],c[8]);
	comp_add m9(x[9],y[9],ws_i[9],wc_i[9],c[8],ws_o[9],wc_o[9],c[9]);
	comp_add m10(x[10],y[10],ws_i[10],wc_i[10],c[9],ws_o[10],wc_o[10],c[10]);
	comp_add m11(x[11],y[11],ws_i[11],wc_i[11],c[10],ws_o[11],wc_o[11],c[11]);
	comp_add m12(x[12],y[12],ws_i[12],wc_i[12],c[11],ws_o[12],wc_o[12],c[12]);
	comp_add m13(x[13],y[13],ws_i[13],wc_i[13],c[12],ws_o[13],wc_o[13],c[13]);
	comp_add m14(x[14],y[14],ws_i[14],wc_i[14],c[13],ws_o[14],wc_o[14],c[14]);
	comp_add m15(x[15],y[15],ws_i[15],wc_i[15],c[14],ws_o[15],wc_o[15],c[15]);
	comp_add m16(x[15],y[15],ws_i[16],wc_i[16],c[15],ws_o[16],wc_o[16],c[16]); //using wc_i[0] as padding since this will always be 0
	comp_add m17(x[15],y[15],ws_i[17],wc_i[17],c[16],ws_o[17],wc_o[17],cout); //cout to the next digit
	// assign cout = 1'b0;
endmodule

// module adder_array (input wire [18:0] x, y, input wire [20:0] ws_i,wc_i, input wire cx,cy, cin, output wire [20:0] ws_o,wc_o ,output wire cout);
// 	wire [0:17] c;
// 	comp_add m0(x[0],y[0],cx,cy,cin,ws_o[0],wc_o[0],c[0]); //cin from the previous digit
// 	comp_add m1(x[1],y[1],ws_i[1],wc_i[1],c[0],ws_o[1],wc_o[1],c[1]);
// 	comp_add m2(x[2],y[2],ws_i[2],wc_i[2],c[1],ws_o[2],wc_o[2],c[2]);
// 	comp_add m3(x[3],y[3],ws_i[3],wc_i[3],c[2],ws_o[3],wc_o[3],c[3]);
// 	comp_add m4(x[4],y[4],ws_i[4],wc_i[4],c[3],ws_o[4],wc_o[4],c[4]);
// 	comp_add m5(x[5],y[5],ws_i[5],wc_i[5],c[4],ws_o[5],wc_o[5],c[5]);
// 	comp_add m6(x[6],y[6],ws_i[6],wc_i[6],c[5],ws_o[6],wc_o[6],c[6]);
// 	comp_add m7(x[7],y[7],ws_i[7],wc_i[7],c[6],ws_o[7],wc_o[7],c[7]);
// 	comp_add m8(x[8],y[8],ws_i[8],wc_i[8],c[7],ws_o[8],wc_o[8],c[8]);
// 	comp_add m9(x[9],y[9],ws_i[9],wc_i[9],c[8],ws_o[9],wc_o[9],c[9]);
// 	comp_add m10(x[10],y[10],ws_i[10],wc_i[10],c[9],ws_o[10],wc_o[10],c[10]);
// 	comp_add m11(x[11],y[11],ws_i[11],wc_i[11],c[10],ws_o[11],wc_o[11],c[11]);
// 	comp_add m12(x[12],y[12],ws_i[12],wc_i[12],c[11],ws_o[12],wc_o[12],c[12]);
// 	comp_add m13(x[13],y[13],ws_i[13],wc_i[13],c[12],ws_o[13],wc_o[13],c[13]);
// 	comp_add m14(x[14],y[14],ws_i[14],wc_i[14],c[13],ws_o[14],wc_o[14],c[14]);
// 	comp_add m15(x[15],y[15],ws_i[15],wc_i[15],c[14],ws_o[15],wc_o[15],c[15]);
// 	comp_add m16(x[16],y[16],ws_i[16],wc_i[16],c[15],ws_o[15],wc_o[15],c[15]);
// 	comp_add m17(x[15],y[15],ws_i[15],wc_i[15],c[14],ws_o[15],wc_o[15],c[15]);
// 	comp_add m18(x[15],y[15],ws_i[15],wc_i[15],c[14],ws_o[15],wc_o[15],c[15]);

// 	comp_add m16(1'b0,1'b0,ws_i[16],wc_i[16],c[15],ws_o[16],wc_o[16],c[16]); //using wc_i[0] as padding since this will always be 0
// 	comp_add m17(1'b0,1'b0,ws_i[17],wc_i[17],c[16],ws_o[17],wc_o[17],cout); //cout to the next digit

// endmodule


// module adder_array (input wire [15:0] x, y, input wire [17:0] ws_i,wc_i, input wire cx,cy, cin, output wire [17:0] ws_o,wc_o ,output wire cout);
// 	wire [0:17] c;
// 	wire stemp1, stemp2, stemp3;
// 	wire ctemp1, ctemp2, ctemp3;
// 	comp_add m0(x[0],y[0],cx,cy,cin,stemp1,ctemp1,c[0]); //cin from the previous digit
// 	comp_add m1(x[1],y[1],ws_i[1],wc_i[1],c[0],stemp2,ctemp2,c[1]);
// 	comp_add m2(x[2],y[2],ws_i[2],wc_i[2],c[1],stemp3,ctemp3,c[2]);
// 	comp_add m3(x[3],y[3],ws_i[3],wc_i[3],c[2],ws_o[0],wc_o[0],c[3]);
// 	comp_add m4(x[4],y[4],ws_i[4],wc_i[4],c[3],ws_o[1],wc_o[1],c[4]);
// 	comp_add m5(x[5],y[5],ws_i[5],wc_i[5],c[4],ws_o[2],wc_o[2],c[5]);
// 	comp_add m6(x[6],y[6],ws_i[6],wc_i[6],c[5],ws_o[3],wc_o[3],c[6]);
// 	comp_add m7(x[7],y[7],ws_i[7],wc_i[7],c[6],ws_o[4],wc_o[4],c[7]);
// 	comp_add m8(x[8],y[8],ws_i[8],wc_i[8],c[7],ws_o[5],wc_o[5],c[8]);
// 	comp_add m9(x[9],y[9],ws_i[9],wc_i[9],c[8],ws_o[6],wc_o[6],c[9]);
// 	comp_add m10(x[10],y[10],ws_i[10],wc_i[10],c[9],ws_o[7],wc_o[7],c[10]);
// 	comp_add m11(x[11],y[11],ws_i[11],wc_i[11],c[10],ws_o[8],wc_o[8],c[11]);
// 	comp_add m12(x[12],y[12],ws_i[12],wc_i[12],c[11],ws_o[9],wc_o[9],c[12]);
// 	comp_add m13(x[13],y[13],ws_i[13],wc_i[13],c[12],ws_o[10],wc_o[10],c[13]);
// 	comp_add m14(x[14],y[14],ws_i[14],wc_i[14],c[13],ws_o[11],wc_o[11],c[14]);
// 	comp_add m15(x[15],y[15],ws_i[15],wc_i[15],c[14],ws_o[12],wc_o[12],c[15]);
// 	comp_add m16(wc_i[0],wc_i[0],ws_i[16],wc_i[16],c[15],ws_o[13],wc_o[13],c[16]); //using wc_i[0] as padding since this will always be 0
// 	comp_add m17(wc_i[0],wc_i[0],ws_i[17],wc_i[17],c[16],ws_o[14],wc_o[14],cout); //cout to the next digit
// 	assign ws_o[15] = 1'b0;
// 	assign ws_o[16] = 1'b0;
// 	assign ws_o[17] = 1'b0;
// 	assign wc_o[15] = 1'b0;
// 	assign wc_o[16] = 1'b0;
// 	assign wc_o[17] = 1'b0;

// endmodule