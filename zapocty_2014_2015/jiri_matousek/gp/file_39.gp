set terminal png
set output "png/file_39.png"
set title "měření č. 39"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_39.csv" u 2:4 t "y1" w lines, \
"data/file_39.csv" u 2:6 t "y2" w lines, \
"data/file_39.csv" u 2:1 t "y3" w lines, \
"data/file_39.csv" u 2:5 t "y4" w lines, \
"data/file_39.csv" u 2:7 t "y5" w lines, \
"data/file_39.csv" u 2:3 t "y6" w lines