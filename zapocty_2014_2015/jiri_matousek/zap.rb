#encoding: UTF-8
require 'fileutils'
FileUtils.mkdir_p("png")
FileUtils.mkdir_p("gp")

gnuplot_cesta = "gnuplot"

Dir["data/*.csv"].each do |fn|
	nazev = fn.split("/").last.split(".").first
	data = {}
	time_sloupec = nil
	File.open("#{fn}") do |g|
		line = g.gets
		promenne = line.split("#").last.split.to_a
		i = 0
		promenne.each do |var|
			i += 1
			if var == "time"
				time_sloupec = i
			else
				data[var] = i
			end
		end
	end
	File.open("gp/#{nazev}.gp", 'w') do |gp|
		gp.puts "set terminal png"
		gp.puts "set output \"png/#{nazev}.png\""
		gp.puts "set title \"měření č. #{nazev.split("_").last.to_i}\""
		gp.puts "set xlabel \"čas [s]\""
		gp.puts "set ylabel \"signály\""
		gp.puts "set key outside"
		gp.print "plot "
		i = 0
		data.keys.sort.each do |detektor|
			i += 1
			sloupec = data[detektor]
			gp.print "\"data/#{nazev}.csv\" u #{time_sloupec}:#{sloupec} t \"#{detektor}\" w lines"
			if i == data.size
			
			else
				gp.puts ", \\"
			end
		end
	 end
	 system("#{gnuplot_cesta} gp/#{nazev}.gp")
end