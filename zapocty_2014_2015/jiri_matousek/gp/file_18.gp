set terminal png
set output "png/file_18.png"
set title "měření č. 18"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_18.csv" u 1:2 t "y1" w lines