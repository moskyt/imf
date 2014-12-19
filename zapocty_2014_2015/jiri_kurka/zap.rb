require 'fileutils'
require 'date'

FileUtils.mkdir_p("graf")
FileUtils.mkdir_p("gp")
FileUtils.mkdir_p("csv")

data={}
davkamin=nil
davkamax=nil
gnuplotcesta= "gnuplot"

IO.foreach("data/data.csv") do |lines|
	datum,id,davka= *lines.split
	rok=datum.split("/")[0].to_i
	mesic=datum.split("/")[1].to_i
	den=datum.split("/")[2].to_i
	date=Date.civil(rok,mesic,den)
	
	pole=[date,davka]
	data[id]||=[]
	data[id]<<pole
end

File.open("csv/celkem.csv", 'w') do |j|
	data.keys.each do |var|
		davkain=data[var][0][1]
		davkaout=data[var][1][1]
		datumin=data[var][0][0]
		datumout=data[var][1][0]
		pocetd=datumout-datumin+1
	
		a=davkain.to_f
		b=(Math.log((davkaout.to_f)/a)/pocetd)
		
		celkovad=a/b*(Math.exp(b*pocetd)-1)
		
		davkamax||=celkovad
		davkamin||=celkovad
		
			if celkovad > davkamax
				davkamax=celkovad
			elsif   celkovad < davkamin
				davkamin=celkovad
			else
			
			end
	j.puts celkovad
	end
end

File.open("gp/celkem.gp", "w") do |f|
	f.puts "set terminal png"
	f.puts "set output 'graf/celkem.png'"
	f.puts "n=20" 
	f.puts "max=#{davkamax}" 
	f.puts "min=#{davkamin}" 
	f.puts "set xrange [0:#{davkamax}]"
	f.puts "set xlabel 'Celkova davka [mSv]"
	f.puts "set ylabel 'Cetnost vyskytu [-]"
	f.puts "set title 'Cetnost vyskytu celkovych davek v danem intervalu'"
	f.puts "width=(max-min)/n" 
	f.puts "hist(x,width)=width*floor(x/width)+width/2.0"
	f.puts "set boxwidth width"
	f.puts "plot 'csv/celkem.csv' u (hist($1,width)):(1.0) smooth freq w boxes notitle "
end

system("\"#{gnuplotcesta}\" gp/celkem.gp")
	
puts "maximalni celkova davka je #{davkamin.round} mSv"
puts "minimalni celkova davka je #{davkamax.round} mSv"