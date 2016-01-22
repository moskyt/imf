Dir.mkdir("plots") unless File.exists?("plots")
File.open("gnuplotfile.gp", 'w') do |f|
	f.puts "set terminal png noenhanced"
	f.puts "set xzeroaxis linetype -1 linewidth 1.5"
	f.puts "set key outside"
	f.puts "set key right top"

	Dir["data/*.csv"].each do |fn|
		fn = File.basename(fn,".csv")
			number = fn.slice(5..-1)
			label = fn
			xlabel = "time"
			ylabel = "y"
			columns = []
			
			IO.foreach("data/#{fn}.csv") do |line|
				if line.include?("# label")
					a = line.strip.split(": ")#strip odrizne konec radku, coz vadilo pri generovani souboru do gnuplotu, hazelo to tam novej radek pred koncem uvozovek.
					label = a[1]
				end	

				if line.include?("# x")
					a = line.strip.split(": ")
					xlabel = a[1]
				end	

				if line.include?("# y")
					a = line.strip.split(": ")
					ylabel = a[1]
				end	
			
				if line.include?("y1")
					a = line.strip.split("#")
					columns = a[1].split(" ")
				end	
			end	

		f.puts "set output \"plots/plot_#{number}.png\""
		f.puts "set xlabel \"#{xlabel}\""
		f.puts "set ylabel \"#{ylabel}\""
		f.puts "set title \'#{label}\'"
		f.write "plot "
		(0..columns.size-1).each do |i|
  			unless  i == columns.index("time")
  				f.write "\"data/#{fn}.csv\" using #{columns.index("time")+1}:#{i+1} title \"#{columns[i]}\","
			end
		end
		f.write "\n"
	end
end		


system("gnuplot gnuplotfile.gp")



