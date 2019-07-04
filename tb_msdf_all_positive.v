`timescale 1 ns / 100 ps
`define TESTVECS 13

module tb;
  reg clk, reset;
  reg [1:0] xi, yi;
  reg valid, valid2, valid3;
  reg [7:0] test_vecs [(`TESTVECS-1):0];
  wire [1:0] p;
  integer k;
  initial begin $dumpfile("tb_msdf_all_positive.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b0; end // #12.5 reset = 1'b0; end
  initial clk = 1'b1; always #5 clk =~ clk;
  initial begin
    test_vecs[0] = 8'b00000001;
    test_vecs[1] = 8'b10100100;
    test_vecs[2] = 8'b10000100;
    test_vecs[3] = 8'b00101100;
    test_vecs[4] = 8'b10101100;
    test_vecs[5] = 8'b10101110;
    test_vecs[6] = 8'b00101110;
    test_vecs[7] = 8'b10101110;
    test_vecs[8] = 8'b10001110;
    test_vecs[9] = 8'b00001110;
    test_vecs[10] = 8'b00001110;
    test_vecs[11] = 8'b00001110;
    test_vecs[12] = 8'b00001110;

  end
//  initial {reset} = {17'b0, 17'b0, 1'b0, 1'b0, 1'b0};
  // mux4 mux4_0 (i, j0, j1, o);
  msdf_mult msdf_mult_0(clk, reset, valid, valid2, valid3, xi, yi, p);
  // adder_array adder_array_0(x, y, ws_i, wc_i, cx, cy, cin, ws_o, wc_o , cout);
  initial begin
    #0 for(k=0;k<`TESTVECS;k=k+1)
      begin #10 {xi, yi, valid, valid2, valid3, reset}=test_vecs[k]; end   
    #150 $finish;
  end
endmodule
