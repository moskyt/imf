set terminal png
set output "data/img/assembly_090.png"
set xlabel "axial coordinate [cm]"
set ylabel "signal intensity [n/cm]"
plot "data/help/assembly_090_help.txt" using 1:2 with fsteps title " A007291"
