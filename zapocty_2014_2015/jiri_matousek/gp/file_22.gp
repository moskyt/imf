set terminal png
set output "png/file_22.png"
set title "měření č. 22"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_22.csv" u 5:4 t "y1" w lines, \
"data/file_22.csv" u 5:3 t "y2" w lines, \
"data/file_22.csv" u 5:1 t "y3" w lines, \
"data/file_22.csv" u 5:2 t "y4" w lines