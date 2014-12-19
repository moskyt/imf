set terminal png
set output "png/file_04.png"
set title "měření č. 4"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_04.csv" u 2:1 t "y1" w lines