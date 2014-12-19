set terminal png
set output "png/file_06.png"
set title "měření č. 6"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_06.csv" u 2:1 t "y1" w lines, \
"data/file_06.csv" u 2:3 t "y2" w lines