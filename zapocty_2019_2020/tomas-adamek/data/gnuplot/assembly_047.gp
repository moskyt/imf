set terminal png
set output "data/img/assembly_047.png"
set xlabel "axial coordinate [cm]"
set ylabel "signal intensity [n/cm]"
plot "data/help/assembly_047_help.txt" using 1:2 with fsteps title " A041950"