set terminal png
set output 'graf/celkem.png'
n=20
max=740908.8272311148
min=3095.4067391301373
set xrange [0:740908.8272311148]
set xlabel 'Celkova davka [mSv]
set ylabel 'Cetnost vyskytu [-]
set title 'Cetnost vyskytu celkovych davek v danem intervalu'
width=(max-min)/n
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width
plot 'csv/celkem.csv' u (hist($1,width)):(1.0) smooth freq w boxes notitle 
