set terminal png
set xdata time
set grid
set xtics rotate by 45 right
set timefmt "%d.%m.%Y"
set xlabel 'Datum'
set ylabel 'Hodnoty'
set title "Atlantis NPP, unit 11"
set output "grafy/Atlantis11.png"
plot  'grafy/data/data31.txt' using 1:2 title "Boritá [g/kg]", 'grafy/data/data31.txt' using 1:3 title "AO [%]" , 'grafy/data/data31.txt' using 1:4 title "fha [%]"
