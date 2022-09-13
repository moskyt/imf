set terminal png
set output "data/img/assembly_050.png"
set xlabel "axial coordinate [cm]"
set ylabel "signal intensity [n/cm]"
plot "data/help/assembly_050_help.txt" using 1:2 with fsteps title " A047739"
