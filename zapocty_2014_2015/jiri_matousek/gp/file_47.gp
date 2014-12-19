set terminal png
set output "png/file_47.png"
set title "měření č. 47"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_47.csv" u 3:2 t "y1" w lines, \
"data/file_47.csv" u 3:1 t "y2" w lines, \
"data/file_47.csv" u 3:4 t "y3" w lines