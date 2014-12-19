set terminal png
set output "png/file_12.png"
set title "měření č. 12"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_12.csv" u 3:5 t "y1" w lines, \
"data/file_12.csv" u 3:2 t "y2" w lines, \
"data/file_12.csv" u 3:1 t "y3" w lines, \
"data/file_12.csv" u 3:4 t "y4" w lines