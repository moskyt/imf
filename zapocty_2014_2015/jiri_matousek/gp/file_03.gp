set terminal png
set output "png/file_03.png"
set title "měření č. 3"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_03.csv" u 5:1 t "y1" w lines, \
"data/file_03.csv" u 5:2 t "y2" w lines, \
"data/file_03.csv" u 5:4 t "y3" w lines, \
"data/file_03.csv" u 5:3 t "y4" w lines