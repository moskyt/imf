set terminal png
set output "png/file_11.png"
set title "měření č. 11"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_11.csv" u 1:3 t "y1" w lines, \
"data/file_11.csv" u 1:2 t "y2" w lines