set terminal png
set output "png/file_01.png"
set title "měření č. 1"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_01.csv" u 1:2 t "y1" w lines, \
"data/file_01.csv" u 1:3 t "y2" w lines