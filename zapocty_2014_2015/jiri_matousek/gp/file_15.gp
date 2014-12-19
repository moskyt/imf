set terminal png
set output "png/file_15.png"
set title "měření č. 15"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_15.csv" u 5:7 t "y1" w lines, \
"data/file_15.csv" u 5:4 t "y2" w lines, \
"data/file_15.csv" u 5:6 t "y3" w lines, \
"data/file_15.csv" u 5:3 t "y4" w lines, \
"data/file_15.csv" u 5:2 t "y5" w lines, \
"data/file_15.csv" u 5:1 t "y6" w lines