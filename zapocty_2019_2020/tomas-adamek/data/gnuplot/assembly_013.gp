set terminal png
set output "data/img/assembly_013.png"
set xlabel "axial coordinate [cm]"
set ylabel "signal intensity [n/cm]"
plot "data/help/assembly_013_help.txt" using 1:2 with fsteps title " A048810"
