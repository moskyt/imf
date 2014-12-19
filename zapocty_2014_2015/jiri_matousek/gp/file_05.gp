set terminal png
set output "png/file_05.png"
set title "měření č. 5"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_05.csv" u 1:4 t "y1" w lines, \
"data/file_05.csv" u 1:2 t "y2" w lines, \
"data/file_05.csv" u 1:3 t "y3" w lines