set terminal png
set output "png/file_46.png"
set title "měření č. 46"
set xlabel "čas [s]"
set ylabel "signály"
set key outside
plot "data/file_46.csv" u 1:2 t "y1" w lines