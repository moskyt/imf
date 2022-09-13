=begin
Funkce generuje dávkový soubor pro gnuplot z pole pěti "ID".
=end

def gnuplot_generace_maxima(maxima)
	if (maxima != nil)
		# vytvoření dávkového souborru pro gnuplot
		f = File.open("./gnuplot/davky/davka_maxima.txt", "w")
			f.puts("
				set terminal png size 1280,960 font \"Arial Bold,10\"
				set output \"gnuplot/grafy/graf_maxima.png\"
				set title \"Five assemblies with highest activity\"
				set xlabel \"axial coordinate [cm]\"
				set ylabel \"signal intensity [n/cm]\"
				set xtics 20
				set key on
				plot 	\"gnuplot/data/" + maxima[4] + ".txt\" with linespoints pointtype 2 lt rgb \"red\" title \"" + maxima[4] + "\", \\
						\"gnuplot/data/" + maxima[3] + ".txt\" with linespoints pointtype 2 lt rgb \"green\" title \"" + maxima[3] + "\", \\
						\"gnuplot/data/" + maxima[2] + ".txt\" with linespoints pointtype 2 lt rgb \"blue\" title \"" + maxima[2] + "\", \\
						\"gnuplot/data/" + maxima[1] + ".txt\" with linespoints pointtype 2 lt rgb \"pink\" title \"" + maxima[1] + "\", \\
						\"gnuplot/data/" + maxima[0] + ".txt\" with linespoints pointtype 2 lt rgb \"violet\" title \"" + maxima[0] + "\"
				unset output
				")
		f.close
		return true
	else
		puts "\n	CHYBA (gnuplot_generace_maxima): Zadané pole je nil."
		return false
	end
		
end
	
