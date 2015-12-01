require_relative 'erb_compiler.rb'
require 'FileUtils'
FileUtils.mkdir_p("png")
FileUtils.mkdir_p("tabulky")
FileUtils.mkdir_p("gp")

soucet={}

gnuplot = "gnuplot"

Dir["data/*.csv"].each do |fn|
	base = fn.split("/").last.split(".").first   #vybere jméno souboru "assembly_00*"
	pole = File.read(fn).split("#").last.split   #načte soubor "assembly_00*.csv", rozdělí ho na dvě části, bere druhou (data) a vyřadí identifikátor kazety
	velikost = pole.size						 #určí velikost pole
	id_kazeta=pole[0] 							 #identifikátor kazety
	hodnota={}
	i=0
	ax_nod=0
	
	10.times do									 #přičítám do proměnných i a ax_nod
		i += 1
		ax_nod += 1								 #axiální nodalizace (po 1 cm)
		hodnota[ax_nod] = pole[i].to_f			 #načtení hodnota u daného axiálního nódu ze souboru .csv + převádím do floatu
	end
	8.times do
		i += 1
		ax_nod += 5
		hodnota[ax_nod] = pole[i].to_f/5		 #hodnotu musím dělit výškou nódu (v tomto případě 5 cm), v tabulce byla integrální hodnota
	end
	16.times do
		i += 1
		ax_nod += 2
		hodnota[ax_nod] = pole[i].to_f/2
	end
	8.times do
		i += 1
		ax_nod += 5
		hodnota[ax_nod] = pole[i].to_f/5
	end
	10.times do
		i += 1
		ax_nod += 1
		hodnota[ax_nod] = pole[i].to_f
	end	
	soucet[id_kazeta] = 0							 #začínám na nule a přičítáním hodnot získávám celkový součet (aktivitu)
	
	(1..velikost).each do |var|
		soucet[id_kazeta] += pole[var].to_f          #číslu kazety je přiřazen celkový součet (aktivita)
	end
	
	File.open("tabulky/#{id_kazeta}.csv", 'w') do |csv|
		hodnota.each do |key,value|
			csv.puts "#{key} #{value}"
		end
	end
	File.open("gp/#{base}.gp", 'w') do |gp|
		gp.puts "set terminal png"
		gp.puts "set output \"png/#{base}.png\""									#nastavení názvu výstupního souboru
		gp.puts "set xlabel \"axial coordinate [cm]\""								#nastavení názvu x-ové osy
		gp.puts "set ylabel \"signal intensity [n/cm]\""							#nastavení názvu y-ové osy
		gp.puts "set title \"Assembly ID #{id_kazeta}\""							#nastavení názvu grafu
		gp.puts "set title offset 0,-0.5"									    	#nastavení posunutí názvu grafu
		gp.puts "set nokey"															#bez legendy
		gp.puts "set xlabel offset 0,0.7"										    #nastavení posunutí popisku x-ové osy
		gp.puts "set ylabel offset 2.5,0"										    #nastavení posunutí popisku y-ové osy
		gp.puts "set xtics offset 0,0.3"										    #nastavení posunutí hodnot x-ové osy
		gp.puts "set ytics offset 0.3,0"										    #nastavení posunutí hodnot y-ové osy
		gp.puts "plot \"tabulky/#{id_kazeta}.csv\" with histeps"
	end
	
	system("#{gnuplot} gp/#{base}.gp")												#vykreslení grafů
end
razeni = soucet.sort_by{|key, value| value}.reverse									#seřazení celkových aktivit vzestupně + otočení pořadí

File.open("gp/max_aktivity.gp", 'w') do |gp|
	gp.puts "set terminal png"
	gp.puts "set output \"png/max_aktivity.png\""								#nastavení názvu výstupního souboru
	gp.puts "set xlabel \"axial coordinate [cm]\""								#nastavení názvu x-ové osy
	gp.puts "set ylabel \"signal intensity [n/cm]\""							#nastavení názvu y-ové osy
	gp.puts "set title \"PS s největší naměřenou celkovou aktivitou\""			#nastavení názvu grafu
	gp.puts "set title font \"Arial,7\""									#nastavení fontu názvu grafu
	gp.puts "set title offset 0,-0.5"									    	#nastavení posunutí názvu grafu
	gp.puts "set key outside title \"Id kazet\" box"							#legenda venku, název legendy, nastavení ohraničení
	gp.puts "set xlabel offset 0,0.7"										    #nastavení posunutí popisku x-ové osy
	gp.puts "set ylabel offset 2.5,0"										    #nastavení posunutí popisku y-ové osy
	gp.puts "set xtics offset 0,0.3"										    #nastavení posunutí hodnot x-ové osy
	gp.puts "set ytics offset 0.3,0"										    #nastavení posunutí hodnot y-ové osy
	gp.print "plot "
	(0..4).each do |i|
		gp.print "\"tabulky/#{razeni[i][0]}.csv\" t \"#{razeni[i][0]}\" with histeps"           #zadá do plotu postupně grafy 5ti nejvyšších aktivit
		if i == 4 
		else gp.puts ", \\"
		end
	end
end
system("#{gnuplot} gp/max_aktivity.gp")
FileUtils.rm_rf("gp")
FileUtils.rm_rf("csv")
