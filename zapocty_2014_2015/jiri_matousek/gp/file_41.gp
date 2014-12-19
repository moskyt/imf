set terminal png
set output "png/file_41.png"
set title "měření č. 41"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_41.csv" u 1:2 t "y1" w lines