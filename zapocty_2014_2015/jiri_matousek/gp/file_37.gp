set terminal png
set output "png/file_37.png"
set title "měření č. 37"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_37.csv" u 3:1 t "y1" w lines, \
"data/file_37.csv" u 3:2 t "y2" w lines