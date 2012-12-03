set terminal png
set output "plot4.png"
set style data lines

plot "data/data1.csv", "data/data2.csv", "data/data3.csv", "data/data4.csv"