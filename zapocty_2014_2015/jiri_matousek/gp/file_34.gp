set terminal png
set output "png/file_34.png"
set title "měření č. 34"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_34.csv" u 1:3 t "y1" w lines, \
"data/file_34.csv" u 1:2 t "y2" w lines