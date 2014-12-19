set terminal png
set output "png/file_48.png"
set title "měření č. 48"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_48.csv" u 6:5 t "y1" w lines, \
"data/file_48.csv" u 6:2 t "y2" w lines, \
"data/file_48.csv" u 6:1 t "y3" w lines, \
"data/file_48.csv" u 6:4 t "y4" w lines, \
"data/file_48.csv" u 6:3 t "y5" w lines