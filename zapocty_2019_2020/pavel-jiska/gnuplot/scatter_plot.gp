reset
set encoding utf8
set terminal pdfcairo solid size 24cm,12cm font "Arial,12" enhanced color
set key outside center top horizontal
set format y "%2.0t{/Symbol \264}10^{%L}"
set decimalsign ','
set xrange [21:122]
set grid
set xlabel "Počet dní v laboratoři [den]"
set ylabel "Celková dávka [mSv]"
set output "./graphs/scatter_plot.pdf"
plot "./tables/table.csv" using 2:3 t "Celková dávka jako funkce délky pobytu"
