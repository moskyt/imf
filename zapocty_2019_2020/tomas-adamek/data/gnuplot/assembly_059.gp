set terminal png
set output "data/img/assembly_059.png"
set xlabel "axial coordinate [cm]"
set ylabel "signal intensity [n/cm]"
plot "data/help/assembly_059_help.txt" using 1:2 with fsteps title " A014031"
