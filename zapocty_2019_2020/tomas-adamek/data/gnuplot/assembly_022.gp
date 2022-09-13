set terminal png
set output "data/img/assembly_022.png"
set xlabel "axial coordinate [cm]"
set ylabel "signal intensity [n/cm]"
plot "data/help/assembly_022_help.txt" using 1:2 with fsteps title " A032377"
