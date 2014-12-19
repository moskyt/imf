set terminal png
set output "png/file_31.png"
set title "měření č. 31"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_31.csv" u 3:4 t "y1" w lines, \
"data/file_31.csv" u 3:2 t "y2" w lines, \
"data/file_31.csv" u 3:1 t "y3" w lines