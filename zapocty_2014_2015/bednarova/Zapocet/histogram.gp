n=35
max=733271
min=3006
width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0
set term png
set output "histogram.png"
set boxwidth width
set style fill solid 0.5
set xrange [0:max]
set tics out nomirror
set xlabel "Dávka [mSv]"
set ylabel "Počet vzorků [-]"
set title "Rozložení celkových dávek po intervalech"
plot "davky.txt" u (hist($1,width)):(1.0) smooth freq w boxes lc rgb"pink" notitle
