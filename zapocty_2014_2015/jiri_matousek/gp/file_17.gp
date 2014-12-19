set terminal png
set output "png/file_17.png"
set title "měření č. 17"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_17.csv" u 2:1 t "y1" w lines