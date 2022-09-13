reset
set encoding utf8
set terminal pdfcairo solid size 48cm,12cm font "Arial,12" enhanced color
set key outside center top horizontal
set decimalsign ','
set xlabel "ID vzorku"
set ylabel "Počet dní v laboratoři [den]"
set output "./graphs/dates_histogram.pdf"
unset xtics
set style data histogram
set style fill solid border
plot "./tables/table.csv" using 2 t "Rozložení délky pobytu v laboratoři"
