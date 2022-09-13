Dir["data/*.csv"].each do  |filename|
gnuplot = "gnuplot "


file = filename.gsub("data/", "")
file = file.gsub(".csv", "")

time = "time"
label = ""
popisx = ""
popisy = ""

	File.open(filename) do |f|
		line = ''
		column = []
		until  line.include?("y1")

			line = f.gets

			label_value = line.include?("label")
			 if label_value
				 label = line
				 label = label.gsub("# label : ", "")
				 label = label.gsub(/\n/," ")

			 end

			 popisx_value = line.include?("# x :")
			 if popisx_value
				 popisx = line
				 popisx = popisx.gsub("# x : ", "")
				 popisx = popisx.gsub(/\n/," ")

			 end

			 popisy_value = line.include?("# y :")
			 if popisy_value
				 popisy = line
				 popisy = popisy.gsub("# y : ", "")
				 popisy = popisy.gsub(/\n/," ")

			 end
		end

		columns = line.split
		size = columns.size

		#odmazani hashe
		(0..size).each do |k|
			hash = "#{columns[k]}".include?("#")
			if hash
				columns[k] = columns[k].gsub("#", "")
			end
		end

		(0..size).each do |i|

		x = "#{columns[i]}".include?("time")

			if x

				 File.open("plots/#{file}.gp", "w") do |g|
					 g.puts "set terminal png size 1920,1080 enhanced font 'calibri,40'"
					 g.puts "set output \"plots/#{file}.png\""

					unless popisx.empty?
						 g.puts "set xlabel \" #{popisx} \" "
						 else
						 g.puts "set xlabel \" time \" "
					 end

					unless popisy.empty?
						 g.puts "set ylabel \" #{popisy} \" "
					 end

					 unless label.empty?
						 g.puts "set title \" #{label} \" noenhanced"
						 else
						 g.puts "set title \" #{file} \" noenhanced "
					 end

					 g.puts "set key outside right"
					 g.print "plot "

					 (0..size-1).each do |j|
						if j != i
							g.print "\"data/#{file}.csv\" using #{i+1}:#{j+1} title \"#{columns[j]}\","
						end
					 end

					 puts "Created #{file}.gp"
				 end

			end

		end
		puts "running gnuplot"
		system("#{gnuplot} plots/#{file}.gp")
		puts "Removing #{file}.gp"
		File.delete("plots/#{file}.gp")

	end


end