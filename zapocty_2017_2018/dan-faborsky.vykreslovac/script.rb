#Dan Fáborský
#IMF 2017/2018
#Univerzální vykreslovač

puts "---------------- START -----------------"

gnu_way = "gnuplot"


Dir["data/*.csv"].each do |filename|
	
	#vytvoreni potrebnych promenych
	base = File.basename(filename, ".csv")
	label = base
	poc_sloup = 0
	x = "time"
	y = ""
	data = {}
	
	#kontrola prubehu na konzoli
	puts base
	
	#pruchod vstupnich hodnot a ulozeni do pameti
	File.foreach(filename) do |line|
	
		if ( line.include?("# label") )
			label = line.split(":",2)[-1].strip

		elsif (line.include?("# x") )
			x = line.split(":",2)[-1].strip

		elsif (line.include?("# y") )
			y = line.split(":",2)[-1].strip

		elsif (line.include?("time") && !line.include?("x") )
			zahlavi = line.split("#")[-1].split
			
			zahlavi.each do |val|
				data[val] = []
				poc_sloup += 1
			end
			
		else
			split = line.split
			
			data.each_with_index  do |(key,_),index|
				data[key] << split[index]
			end
			
		end
	end
	
	# preskladani dat do tvaru: time, y1, ... a zapis dat
	File.open("gnuplot/#{base}.txt", 'w') do |text|
		
		size = data["time"].size

		(0...size).each do |i|
		
			radek = []
			index = 0
		
			data.each_key do |key|
				
				if (key == "time")
					index = 0
				else
					index = key.split("",2)[-1].to_i
				end
				
				radek[index] = data[key][i]
				
			end	
	
			radek.each do |val|
				text.print "#{val}\t"
			end
			text.puts
			
		end
	end

	#vytvoreni spustilenycch souboru pro gnuplot
	File.open("gnuplot/#{base}.gp", 'w') do |script|
		
		script.puts "set terminal png size 1920,1080"
		script.puts "set xlabel \"#{x}\""
		script.puts "set ylabel \"#{y}\""
		script.puts "set title \"#{label}\""
		script.puts "set key outside"
		script.puts "set output \"charts/#{base}.png\""
		script.print "plot \"gnuplot/#{base}.txt\" using 1:2 title 'y1'"
		
		(3..poc_sloup).each do |i|
			script.print ",\ \"gnuplot/#{base}.txt\" using 1:#{i} title 'y#{i-1}'"
		end
	
	end
	
	#vytvoreni grafu
	system " \"#{gnu_way}\" gnuplot/#{base}.gp "
	
	
end	
	
puts 
puts "----------------------- KONEC ---------------------------"