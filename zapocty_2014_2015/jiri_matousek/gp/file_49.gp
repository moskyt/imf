set terminal png
set output "png/file_49.png"
set title "měření č. 49"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_49.csv" u 1:4 t "y1" w lines, \
"data/file_49.csv" u 1:5 t "y2" w lines, \
"data/file_49.csv" u 1:3 t "y3" w lines, \
"data/file_49.csv" u 1:2 t "y4" w lines