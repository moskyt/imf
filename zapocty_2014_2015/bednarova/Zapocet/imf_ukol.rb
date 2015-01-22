require 'date'

Davky=Array.new
Vzorky=Hash.new # pro kazdy vzorek podle jeho ID (indexu) chci mit: datum vstupu, datum vystupu, A (vstupni davka), y (vystupni davka)
dmin = 1e7
idmin = ""
vstupmin = ""
vystupmin = ""
dmax = 0
idmax = ""
vstupmax = ""
vystupmax = ""
# Přiřadím si jednotlive údaje do hashe
IO.foreach ("data.csv") do |line|
	datum = line.strip.split[0] # datum vstupu/vystupu
	index = line.strip.split[1] # ID vzorku
	davka = line.strip.split[2] # mSv/den - ve vzorci bud A nebo y	
	 if Vzorky.include? index
		Vzorky[index][1] = datum  # datum vystupu
		Vzorky[index][3] = davka  # y
	 else
		Vzorky[index] = [datum, nil, davka, nil] # ulozim si datum vstupu a A
	 end 
end    
# Vytvorim soubor davky.txt ze ktereho budu vykreslovat
File.open("davky.txt",'w') do |f|
  Vzorky.each do |key, value|
	# vstupniDatum = value[0], vystupniDatum = value[1]
	tvstup  = Date.strptime(value[0],'%Y/%m/%d')
	tvystup = Date.strptime(value[1],'%Y/%m/%d')
	trozdil = [(tvystup-tvstup).to_f, 1].max # V pripade, ze je vzorek odvezen ve stejny den jako privezen, pocitame ze je ve skladu jeden den
	a = value[2].to_f
	y = value[3].to_f
	# Porovnam davky, nektere jsou prehozene pokud vzorek prisel ve stejny den jako odesel (vstup versus vystup)
	 if a < y then
    	 a,y = y,a # prohodim a za y 
     end
	b = -(Math.log(y/a))/trozdil
	puts "#{key}: #{b}"
	d = (a/b)*(1-Math.exp(-b*trozdil)) # celkova davka vyzarena ve skladu pro dany vzorek
	f.puts "#{d}"
	# hledame maximum a minum
    if dmin > d then
		dmin = d
		idmin = key
		vstupmin = value[0]  # prislusny datum vstupu 
        vystupmin = value[1]  # prislusny datum vystupu 
	end
	if dmax < d then
		dmax = d
		idmax = key
		vstupmax = value[0]
        vystupmax = value[1]	
	end
  end
end 
# Vypisu vysledek do souboru
File.open("Vysledky.txt", 'w') do |f|
f.puts "Největší dávka je: #{dmax.round(2)} mSv od vzorku #{idmax}"
f.puts "Datum vstupu: #{vstupmax} a datum výstupu: #{vystupmax}"
f.puts "Nejmenší dávka je: #{dmin.round(2)} mSv od vorku #{idmin}"
f.puts "Datum vstupu: #{vstupmin} a datum výstupu: #{vystupmin}"
end
# Vytvorim graf
File.open("histogram.gp", 'w') do |f|
		f.puts "n=35", "max=#{dmax.round}", "min=#{dmin.round}", "width=(max-min)/n" 
	    f.puts "hist(x,width)=width*floor(x/width)+width/2.0"
		f.puts "set term png", "set output \"histogram.png\""
		f.puts "set boxwidth width", "set style fill solid 0.5", "set xrange [0:max]", "set tics out nomirror"
		f.puts "set xlabel \"Dávka [mSv]\"", "set ylabel \"Počet vzorků [-]\"", "set title \"Rozložení celkových dávek po intervalech\""
		f.puts "plot \"davky.txt\" u (hist($1,width)):(1.0) smooth freq w boxes lc rgb\"pink\" notitle"		
end 
system("gnuplot histogram.gp")
 	
