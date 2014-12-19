set terminal png
set output "png/file_23.png"
set title "měření č. 23"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_23.csv" u 1:2 t "y1" w lines