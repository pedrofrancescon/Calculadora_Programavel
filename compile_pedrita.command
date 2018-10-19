#! /bin/bash

cd /Users/pedrofrancesconcittolin/Documents/UTFPR/Subjects/Arquitetura\ de\ Computadores/GHDL/lab_5_calculadora

echo

ghdl -a flipflop_T.vhd
ghdl -e flipflop_T

echo
echo "flipflop DONE"
echo

ghdl -a mux16bits.vhd
ghdl -e mux16bits

echo
echo "mux16bits DONE"
echo

ghdl -a rom.vhd
ghdl -e rom

echo
echo "rom DONE"
echo

ghdl -a reg16bits.vhd
ghdl -e reg16bits

echo
echo "reg16bits DONE"
echo

ghdl -a pc16bits.vhd
ghdl -e pc16bits

echo
echo "pc16bits DONE"
echo

ghdl -a pc_rom.vhd
ghdl -e pc_rom

echo
echo "pc_rom DONE"
echo

