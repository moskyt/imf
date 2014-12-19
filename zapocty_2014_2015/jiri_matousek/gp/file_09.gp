set terminal png
set output "png/file_09.png"
set title "měření č. 9"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_09.csv" u 3:2 t "y1" w lines, \
"data/file_09.csv" u 3:1 t "y2" w lines