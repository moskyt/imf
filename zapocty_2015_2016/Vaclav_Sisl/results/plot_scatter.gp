set title "Scatter plot"
set xlabel "time spent in store [days]"
set ylabel "dose [mSv]"
set terminal png
set output "results/plot_scatter.png"
plot "results/plot_scatter.txt" notitle
