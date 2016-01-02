#Tento program zpracovava csv soubory (ulozene v podslozce data) s informacemi o aktivitach palivovych souboru. Vykresli axialni profil intenzity pro kazdy palivovy soubor zvlast a zaroven pro 5 (volitelne) palivovych souboru s nejvesti celkovou aktivitou tento profil intenzity vykresli spolecne do jednoho grafu. Vystup je ulozen do slozky 'out'.

Gnuplot_path="gnuplot"
Clear = 1 # Mazat nepotrebne soubory po skonceni behu programu? (Ano==1)
Pocet_max = 5 # Pocet PS s nejvetsi celkovou aktivitou

#Vytvoreni slozek pro vystup

Dir.mkdir("out") unless File.exists?("out") 
Dir.mkdir("out/grafy") unless File.exists?("out/grafy")
Dir.mkdir("out/dat") unless File.exists?("out/dat")

assemblies={}

if File.exists?("data")
	
	#Nacteni dat z csv souboru
	
	Dir["data/*.csv"].sort.each do |fn|
		File.open(fn,'r') do |f|
			assembly_ID = f.gets.gsub("#","").strip
			node_lengths = f.gets.gsub("#","").strip.split(",")
			b=f.gets
			a_integral=[]
			while b != nil
				a_integral.concat(b.split)
				b=f.gets
			end
			
			#Prepocet integralni a celkove aktivity 
			
			a_diff=[]
			sum_activity=0
			(0...a_integral.size).each do |i|
				a_diff.push(a_integral[i].to_f/(node_lengths[i].to_f))
				sum_activity+=a_integral[i].to_f
			end
			
			assemblies["%s" %assembly_ID] = {"filename"=>File.basename(f, ".csv"),"node_lengths"=>node_lengths, "activity"=>a_diff, "sum_activity"=>sum_activity}
		end
	end

	#Vytvoreni dat pro gnuplot

	assemblies.keys.each do |key|
		File.open("out/dat/%s.dat" %[key],"w") do |f|
			x_value=0
			(0...assemblies[key]["activity"].size).each do |i|
				f.puts "%f, %f" %[x_value,assemblies[key]["activity"][i]]
				x_value+=assemblies[key]["node_lengths"][i].to_f
				f.puts "%f, %f" %[x_value,assemblies[key]["activity"][i]]
			end
		end
	end
	
	#Nalezeni PS s nejvetsi celkovou aktivitou

	assemblies_sorted = assemblies.sort_by { |k, v| v["sum_activity"] }.reverse
	highest_activity=[]
	(0...Pocet_max).each do |i|
		highest_activity.push(assemblies_sorted[i][0])
	end

	#Vytvoreni souboru spustitelneho v gnuplotu

	File.open("plot.gp","w") do |f|
		f.puts "set xtics 20"
		f.puts "set terminal png size 1280,960"
		f.puts "set xlabel \"axial coordinate [cm]\""
		f.puts "set ylabel \"signal intensity [n/cm]\""
		f.puts "set title \"Assemblies with highest integral activity\""
		f.puts "set output 'out/highest_activity.png'"
		f.puts "set key left top"
		f.print "plot "
		i=1
		
		#Nejvyssi aktivita
		
		highest_activity.each do |data|
			f.print "'out/dat/%s.dat'" %[data]
			f.puts "title \"%s\" with linespoints ls %i ,%s" %[data, i,'\\']
			i+=1
		end
		
		#Vsechny palivove soubory
		
		f.puts "\nset nokey"
		assemblies.keys.each do |key|
			f.puts "set title \"Assembly ID %s\"" %[key]
			f.puts "set output 'out/grafy/%s.png'" %[assemblies[key]["filename"]]
			f.print "plot 'out/dat/%s.dat'" %[key]
			f.puts " with linespoints ls 2 linecolor rgb \"red\""
		
		end
	end

	#Spusteni gnuplotu

	system("%s plot.gp" %Gnuplot_path)
	
	#Mazani nepotrebnych dat
	
	if Clear == 1
		require "fileutils"; FileUtils.rm_rf("out/dat"); File.delete("plot.gp")
	end

	puts "Hotovo!\nVýstupní soubory jsou uloženy ve složce 'out'."

else
	puts "Nebyla nalezena složka 'data'."
end
