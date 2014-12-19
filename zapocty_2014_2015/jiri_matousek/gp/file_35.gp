set terminal png
set output "png/file_35.png"
set title "měření č. 35"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_35.csv" u 4:5 t "y1" w lines, \
"data/file_35.csv" u 4:3 t "y2" w lines, \
"data/file_35.csv" u 4:1 t "y3" w lines, \
"data/file_35.csv" u 4:2 t "y4" w lines