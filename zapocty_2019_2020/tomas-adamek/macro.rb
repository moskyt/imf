gnuplot = "gnuplot"									#cesta ku gnuplotu

def FSumArrayToN(array,n)																		#časom sa ukáže, že sa hodí zadefinovať si sčítanie prvých n prvkov
	q = 0
	if n==0 then																				#sčítanie n prvkov nedáva moc zmysel ak je n=0 tak to ošetríme zvlášť
		q = 0
	else
		(0..n).each do |j|
			q = q + array[j]
		end
	end
	return q
end

def FSpecialDivision(a,b)																		#ukáže sa že je fajn si zadefinovať delenie nulov tak aby to nerobilo problémy
	q = 0
	if b==0 then
		q = 0																					#v našom prípade potrebujeme aby kód proste odignoroval delenie nulov a hodil nám nulu
	else
		q=a/b
	end
	return q
end

aktivita = {}																					#prázdny hash do ktorého budeme zapisovať celkovú aktivitu
#rád by som tu povedal, že pojmom celková aktivita som pochopil súčet integrálnych hodnôt cez všetky nódy
ident = {}																						#bude jednoduchšie vytvoriť pomocný hash ako šaškovať so sortovaním komplikovanejšieho hashu - tu je to skôr voľba jednoduchosti pred eleganciou ale samozrejme ruby umožňuje to celé nasypať do jedného hashu a vysortovať to tak ako chceme

Dir.mkdir "data/help" unless File.exists?("data/help")											#vytvorime si nejakú hierarchiu výstupov aby sme v tom nemali bordel
Dir.mkdir "data/img" unless File.exists?("data/img")											#ak náhodou to čo chceme vytvoriť už existuje (typicky pri opätovnom spúšťaní macra) tak to nemusíme vytvárať
Dir.mkdir "data/gnuplot" unless File.exists?("data/gnuplot")

base = "a"																						#zadefinujeme si parametre ktoré budeme používať
number = 0
identifier = "a"
Dir["data/*.csv"].each do |fn|																	#iterujem cez každý filename typu assembly_*.csv
	base = fn.split("_").first																	#označím si prvú časť (data/assembly) ako base
	base = base.split("/").last																	#označíme si druhú časť (assembly) ako base (v takomto prípade bude macro fungovať aj pre inak nazvané súbory)
	appendix = fn.split("_").last																#označíme appendix číslo.csv za assembly, aby sme podľa neho mohlli pomenovať číslo
	number = appendix.split(".").first															#označíme number číslo za assembly, aby sme podľa neho mohlli pomenovať gnuplotové command scripty
	puts "#{base}_#{number}.csv"
	j = 0																						#nastavíme iterátor
	dataxs = []																					#zadefinujeme potrebné polia
	dataxf = [0]																				#nulu potrebujeme iba kvôli tomu že to zjednoduší vstup do gnuplotu
	datays = []
	datayf = [0]
	File.foreach("data/#{base}_#{number}.csv") do |line|										#ideme sa hrať s riadkami vstupného súboru
		j = j + 1																				#poradové číslo riadku
		if j == 1 then																			#vieme, že v prvom riadku je identifikátor
			identifier = line.strip.split("#").last												#tvar identifikátoru je # blabla tak my zoberieme to blabla
		end
		if j == 2 then																			#vieme, že v druhom riadku sú dĺžky jednotlivých nódov
			dataxs = line.strip.split("#").last													#druhý riadok začína mriežkov a tú nechceme
			dataxs = dataxs.strip.split(",")													#medzery nepotrebujeme a rozdelíme dĺžky nódov do poľa
			dataxf = dataxf + dataxs.map(&:to_f)												#pole stringov premapujeme na floaty a strčíme ho za tú nulu (opakujem, ula sa nám bude hodiť pre gnuplot)
		end
		if j > 2 then
			datays = line.split																	#od tretieho riadku začínajú dáta z merania tak nimi nakŕmime pole
			datayf = datayf + datays.map(&:to_f)												#opäť to strčíme za tú nulu a každé ďalšie pole (čítané z riadku) strčíme na koniec - takýmto spôsobom nás nezaujíma koľko je tam vlastne riadkov
		end
	end
	aktivita[number.to_s] = FSumArrayToN(datayf,dataxf.length-1)								#nakŕmime hash aktivitou ktorú potom budeme sortovať (áno viem, že konvertovať string na string je úplne zbytočné, ale ponechal som to tam aby ma nemiatlo to že premenná ktorá evokuje číslo je vlastne reťazec)
	ident[number.to_s] = identifier																#nakŕmime hash identifikátormi, ktorými budeme titleovať grafy

	File.open("data/help/#{base}_#{number}_help.txt","w") do |f|								#najjednoduchší sa mi zdal spôsob s pomocným txt súborom ktorý ľahko zožere gnuplot
		(0..dataxf.length-1).each do |i|														#budeme mať takýto počet riadkov
			f.puts "#{FSumArrayToN(dataxf,i)}	#{FSpecialDivision(datayf[i],dataxf[i])}"		#riadky budú vyzerať tak aby z toho dal gnuplot priamo to čo chceme
		end
	end

		File.open("data/gnuplot/#{base}_#{number}.gp","w") do |f|								#otvor/vytvor súbor.gp s názvom ako dátový súbor a priprav ho na písanie
			f.puts "set terminal png"															#píšeme gnuplototvský príkaz že chceme formát png
			f.puts "set output \"data/img/#{base}_#{number}.png\""								#píšeme gnuplototvský príkaz že chceme výstupný png súbor s konkrétnym názvom
			f.puts "set xlabel \"axial coordinate [cm]\""										#pomenujeme os x
			f.puts "set ylabel \"signal intensity [n/cm]\""										#pomenujeme os y
			f.puts "plot \"data/help/#{base}_#{number}_help.txt\" using 1:2 with fsteps title \"#{identifier}\""	#vykreslíme dáta pomocou fsteps, lebo to robí to čo chceme
		end
	system("#{gnuplot} data/gnuplot/#{base}_#{number}.gp")										#spustíme gnuplot
end

aktivita = aktivita.sort_by { |number, value| -value }											#usporiadame hash zostupne a vypluje nám pole dvojíc (preto bolo jednoduchšie vytvoriť pomocný hash na titleovanie)

File.open("data/gnuplot/aaa_max_5.gp","w") do |f|												#otvor/vytvor súbor.gp s názvom ako dátový súbor a priprav ho na písanie
	f.puts "set terminal png"																	#píšeme gnuplototvský príkaz že chceme formát png
	f.puts "set output \"data/img/aaa_max_5.png\""												#píšeme gnuplototvský príkaz že chceme výstupný png súbor s konkrétnym názvom
	f.puts "set xlabel \"axial coordinate [cm]\""												#pomenujeme os x
	f.puts "set ylabel \"signal intensity [n/cm]\""												#pomenujeme os y

	f.print "plot"																				#vykreslíme v loope dáta pomocou fsteps, lebo to robí to čo chceme
	(0..4).each do |k|
		f.print " \"data/help/#{base}_#{aktivita[k][0]}_help.txt\" using 1:2 with fsteps title \"#{ident[aktivita[k][0]]}\""
		if k < 4 then
			f.print ","
		end
	end

end
system("#{gnuplot} data/gnuplot/aaa_max_5.gp")													#spustíme gnuplot


