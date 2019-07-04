#!/bin/bash

# makes textbook examples
iverilog -o tb_msdf_textbook adder.v ca_reg.v lib.v Mlib.v msdf.v on_the_fly.v SELM.v tb_msdf_textbook.v V.v
vvp tb_msdf_textbook
gtkwave tb_msdf_textbook.vcd

# makes positive examples
# iverilog -o tb_msdf_all_positive adder.v ca_reg.v lib.v Mlib.v msdf.v on_the_fly.v SELM.v tb_msdf_all_positive.v V.v
# vvp tb_msdf_all_positive
# gtkwave tb_msdf_all_positive.vcd
