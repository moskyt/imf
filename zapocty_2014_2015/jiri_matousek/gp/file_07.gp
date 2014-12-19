set terminal png
set output "png/file_07.png"
set title "měření č. 7"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_07.csv" u 3:1 t "y1" w lines, \
"data/file_07.csv" u 3:4 t "y2" w lines, \
"data/file_07.csv" u 3:2 t "y3" w lines