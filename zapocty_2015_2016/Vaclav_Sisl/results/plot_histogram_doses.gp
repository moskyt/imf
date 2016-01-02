set title "Histogram"
set xlabel "dose [mSv]"
set ylabel "number of samples"
set terminal png
set output "results/plot_histogram_doses.png"
binwidth=50000
bin(x,width)=width*floor(x/width)
plot "results/plot_histogram_doses.txt" using (bin($1,binwidth)):(1.0) smooth freq with boxes notitle
