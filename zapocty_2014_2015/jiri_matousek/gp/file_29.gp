set terminal png
set output "png/file_29.png"
set title "měření č. 29"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_29.csv" u 4:3 t "y1" w lines, \
"data/file_29.csv" u 4:2 t "y2" w lines, \
"data/file_29.csv" u 4:1 t "y3" w lines