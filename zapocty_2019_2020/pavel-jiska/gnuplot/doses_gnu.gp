reset
set encoding utf8
set terminal pdfcairo solid size 48cm,12cm font "Arial,12" enhanced color
set key outside center top horizontal
set format y "%2.0t{/Symbol \264}10^{%L}"
set decimalsign ','
set xlabel "ID vzorku"
set ylabel "Celková dávka [mSv]"
set output "./graphs/doses_histogram.pdf"
unset xtics
set style histogram clustered gap 0
set style data histogram
set style fill solid border
plot "./tables/table.csv" using 3 t "Rozložení celkových dávek"
