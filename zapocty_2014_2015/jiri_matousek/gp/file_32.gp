set terminal png
set output "png/file_32.png"
set title "měření č. 32"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_32.csv" u 4:6 t "y1" w lines, \
"data/file_32.csv" u 4:5 t "y2" w lines, \
"data/file_32.csv" u 4:1 t "y3" w lines, \
"data/file_32.csv" u 4:2 t "y4" w lines, \
"data/file_32.csv" u 4:3 t "y5" w lines