set terminal png
set output "png/file_08.png"
set title "měření č. 8"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_08.csv" u 3:5 t "y1" w lines, \
"data/file_08.csv" u 3:2 t "y2" w lines, \
"data/file_08.csv" u 3:1 t "y3" w lines, \
"data/file_08.csv" u 3:4 t "y4" w lines