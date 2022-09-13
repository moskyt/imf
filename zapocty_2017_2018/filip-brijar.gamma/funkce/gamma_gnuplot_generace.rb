def gnuplot_generace(data)
	
	
	# generování souborů pro gnuplot
	data.each do |palivovy_soubor_klic,palivovy_soubor_data|
		
		
		# vytvoření datovéo souboru pro gnuplot
		f = File.open("./gnuplot/data/"+palivovy_soubor_data["ID"]+".txt", "w")
		pozice = 0
		palivovy_soubor_data["zaznam"].each do |nod|
			f.puts("%3i %.10f" %[pozice,nod[1]/nod[0]])
			pozice = pozice + nod[0]
			f.puts("%3i %.10f" %[pozice,nod[1]/nod[0]])
		end
		f.close
		
		
		# vytvoření dávkového souborru pro gnuplot
		f = File.open("./gnuplot/davky/davka_" + palivovy_soubor_data["ID"] + ".txt", "w")
			f.puts("
				set terminal png size 1280,960 font \"Arial Bold,10\"
				set output \"gnuplot/grafy/graf_"+ palivovy_soubor_data["ID"] +".png\"
				set title \"Assembly ID " + palivovy_soubor_data["ID"] + "\"
				set xlabel \"axial coordinate [cm]\"
				set ylabel \"signal intensity [n/cm]\"
				set xtics 20
				set key off
				plot \"gnuplot/data/" + palivovy_soubor_data["ID"] + ".txt\" with linespoints pointtype 2 lt rgb \"red\"
				unset output
				")
		f.close
		
		
		
	end
	
end