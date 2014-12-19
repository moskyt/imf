set terminal png
set output "png/file_21.png"
set title "měření č. 21"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_21.csv" u 5:4 t "y1" w lines, \
"data/file_21.csv" u 5:3 t "y2" w lines, \
"data/file_21.csv" u 5:2 t "y3" w lines, \
"data/file_21.csv" u 5:1 t "y4" w lines