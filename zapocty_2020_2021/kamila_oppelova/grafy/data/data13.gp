set terminal png
set xdata time
set grid
set xtics rotate by 45 right
set timefmt "%d.%m.%Y"
set xlabel 'Datum'
set ylabel 'Hodnoty'
set title "Disneyland NPP, unit 5"
set output "grafy/Disneyland05.png"
plot  'grafy/data/data13.txt' using 1:2 title "Boritá [g/kg]", 'grafy/data/data13.txt' using 1:3 title "AO [%]" , 'grafy/data/data13.txt' using 1:4 title "fha [%]"
