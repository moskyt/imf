set terminal png
set output "data/img/assembly_010.png"
set xlabel "axial coordinate [cm]"
set ylabel "signal intensity [n/cm]"
plot "data/help/assembly_010_help.txt" using 1:2 with fsteps title " A090423"
