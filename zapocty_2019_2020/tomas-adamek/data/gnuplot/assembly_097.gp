set terminal png
set output "data/img/assembly_097.png"
set xlabel "axial coordinate [cm]"
set ylabel "signal intensity [n/cm]"
plot "data/help/assembly_097_help.txt" using 1:2 with fsteps title " A068199"
