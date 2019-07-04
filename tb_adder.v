`timescale 1 ns / 100 ps
`define TESTVECS 8

module tb;
  reg clk, reset;
  reg [15:0] x, y;
  reg [17:0] ws_i, wc_i;
  reg cx, cy, cin;
  wire [17:0] ws_o, wc_o;
  wire [3:0] j;
  reg [31:0] test_vecs [0:(`TESTVECS-1)];
  integer k;
  initial begin $dumpfile("tb_adder.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b0; end // #12.5 reset = 1'b0; end
  initial clk = 1'b1; always #5 clk =~ clk;
  initial begin
    test_vecs[0] = 32'b11111111111111111111111111111111;
    test_vecs[1] = 32'b11111111111111111111111111111111;
    test_vecs[2] = 32'b11111111111111111111111111111111;
    test_vecs[3] = 32'b11111111111111111111111111111111;
    test_vecs[4] = 32'b11111111111111111111111111111111;
    test_vecs[5] = 32'b11111111111111111111111111111111;
    test_vecs[6] = 32'b11111111111111111111111111111111;
    test_vecs[7] = 32'b11111111111111111111111111111111;
  end
  initial {ws_i, wc_i, cx, cy, cin} = {18'b111111111111111111, 18'b111111111111111111, 1'b0, 1'b0, 1'b1};
  // mux4 mux4_0 (i, j0, j1, o);
  // on_the_fly on_the_fly_0 (clk, reset, valid, i, o);
  adder_array adder_array_0(x, y, ws_i, wc_i, cx, cy, cin, ws_o, wc_o , cout);
  initial begin
    #0 for(k=0;k<`TESTVECS;k=k+1)
      begin #10 {x, y}=test_vecs[k]; end
    #100 $finish;
  end
endmodule
