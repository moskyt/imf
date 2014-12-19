set terminal png
set output "png/file_50.png"
set title "měření č. 50"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_50.csv" u 2:3 t "y1" w lines, \
"data/file_50.csv" u 2:1 t "y2" w lines