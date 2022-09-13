set terminal png
set output "data/img/assembly_028.png"
set xlabel "axial coordinate [cm]"
set ylabel "signal intensity [n/cm]"
plot "data/help/assembly_028_help.txt" using 1:2 with fsteps title " A049962"
