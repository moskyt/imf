set terminal png
set output "data/img/assembly_044.png"
set xlabel "axial coordinate [cm]"
set ylabel "signal intensity [n/cm]"
plot "data/help/assembly_044_help.txt" using 1:2 with fsteps title " A034929"
