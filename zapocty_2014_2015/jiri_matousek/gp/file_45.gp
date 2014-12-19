set terminal png
set output "png/file_45.png"
set title "měření č. 45"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_45.csv" u 3:1 t "y1" w lines, \
"data/file_45.csv" u 3:2 t "y2" w lines, \
"data/file_45.csv" u 3:6 t "y3" w lines, \
"data/file_45.csv" u 3:5 t "y4" w lines, \
"data/file_45.csv" u 3:7 t "y5" w lines, \
"data/file_45.csv" u 3:4 t "y6" w lines