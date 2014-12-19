set terminal png
set output "png/file_24.png"
set title "měření č. 24"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_24.csv" u 2:4 t "y1" w lines, \
"data/file_24.csv" u 2:3 t "y2" w lines, \
"data/file_24.csv" u 2:1 t "y3" w lines, \
"data/file_24.csv" u 2:5 t "y4" w lines