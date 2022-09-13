set terminal png
set output "data/img/aaa_max_5.png"
set xlabel "axial coordinate [cm]"
set ylabel "signal intensity [n/cm]"
plot "data/help/assembly_038_help.txt" using 1:2 with fsteps title " A086696", "data/help/assembly_029_help.txt" using 1:2 with fsteps title " A065672", "data/help/assembly_078_help.txt" using 1:2 with fsteps title " A045825", "data/help/assembly_075_help.txt" using 1:2 with fsteps title " A095778", "data/help/assembly_035_help.txt" using 1:2 with fsteps title " A091031"