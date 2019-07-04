module libselm(input wire v_1,v0,v1, output wire p_1,p0);
wire o1,o2,o3,o4;
posrange pos(v_1,v0,v1,o1);
zerorange zer(v_1,v0,v1,o2);
negrange neg(v_1,v0,v1,o3);
or2 io(o1,o3,o4);
and2 io0(!o2,o1,p_1);
and3 io1(!o2,!o1,o3,p0);
endmodule

module posrange(input wire i_1,i0,i1, output wire o);
wire o1;
or2 io(i1,i0,o1);
and2 io1(o1,!i_1,o);
endmodule

module zerorange(input wire i_1,i0,i1, output wire o);
wire o1,o2;
and3 io(!i_1,!i0,!i1,o1);
and3 io1(i_1,i0,i1,o2);
or2 io2(o1,o2,o);
endmodule

module negrange(input wire i_1,i0,i1, output wire o);
wire o1;
or2 io(!i1,!i0,o1);
and2 io1(o1,i_1,o);
endmodule
