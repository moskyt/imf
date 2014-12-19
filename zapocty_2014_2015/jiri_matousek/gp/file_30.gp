set terminal png
set output "png/file_30.png"
set title "měření č. 30"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_30.csv" u 1:2 t "y1" w lines, \
"data/file_30.csv" u 1:3 t "y2" w lines, \
"data/file_30.csv" u 1:4 t "y3" w lines