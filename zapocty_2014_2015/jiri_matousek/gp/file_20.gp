set terminal png
set output "png/file_20.png"
set title "měření č. 20"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_20.csv" u 1:5 t "y1" w lines, \
"data/file_20.csv" u 1:4 t "y2" w lines, \
"data/file_20.csv" u 1:3 t "y3" w lines, \
"data/file_20.csv" u 1:7 t "y4" w lines, \
"data/file_20.csv" u 1:2 t "y5" w lines, \
"data/file_20.csv" u 1:6 t "y6" w lines