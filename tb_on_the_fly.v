`timescale 1 ns / 100 ps
`define TESTVECS 8

module tb;
  reg clk, reset;
  reg [1:0] i;
  reg valid; 
  wire [15:0] o;
  wire [3:0] j;
  reg [2:0] test_vecs [0:(`TESTVECS-1)];
  integer k;
  initial begin $dumpfile("tb_on_the_fly.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b0; end // #12.5 reset = 1'b0; end
  initial clk = 1'b1; always #5 clk =~ clk;
  initial begin
    test_vecs[0] = 3'b110;
    test_vecs[1] = 3'b110;
    test_vecs[2] = 3'b100;
    test_vecs[3] = 3'b110;
    test_vecs[4] = 3'b101;
    test_vecs[5] = 3'b100;
    test_vecs[6] = 3'b100;
    test_vecs[7] = 3'b101;
  end
  initial {i} = 0;
  // mux4 mux4_0 (i, j0, j1, o);
  on_the_fly on_the_fly_0 (clk, reset, valid, i, o);
  initial begin
    #0 for(k=0;k<`TESTVECS;k=k+1)
      begin #10 {valid, i}=test_vecs[k]; end
    #100 $finish;
  end
endmodule
