# Databáze paliva
# ===============

# Adresář "data" obsahuje ve formátu JSON pro jednotlivé kampaně provozu JE vždy datum začátku (BOC)
# a konce (EOC) provozu a také seznam použitých palivových souborů v dané vsázce včetně změny vyhoření.

# Vytvořte skript, který pro každý palivový soubor (je jich dohromady asi 100) vygeneruje hezké PDF, které bude pro každý PS obsahovat:
# - identifikátor PS
# - celkové vyhoření
# - datum prvního zavezení PS
# - datum posledního vyvezení PS
# - nejdelší dobu mimo AZ (například pokud byl soubor zavezen v 3., 4. a 8. kampani, bude to počet dní od konce 4. do začátku 8. kampaně)
# - tabulku s jednotlivými kampaněmi, ve které byl PS zavezen, pro každou z nich: číslo kampaně, vyhoření na začátku a na konci kampaně

require "json"
require "date"
require_relative "./erb_compiler.rb"

latex_adress = "C:/Users/marta/AppData/Local/Programs/MiKTeX 2.9/miktex/bin/x64/pdflatex.exe"			#Cesta k programu pdflatex.exe
data_adress = "./data/*"																				#Cesta k vychozim kampanim

latex_adress = "pdflatex"

def cislo_kampan(kampan)
	cislo = 0
	nazev = kampan.scan(/(\d)/)
	prvni = nazev[0][0]
	druhy = nazev[1][0]
	if prvni.to_i == 0
		cislo = druhy.to_i
	else
		cislo = (prvni+druhy).to_i
	end
	return cislo
end

def Vytvor_ukladaci_slozku()
	if(File.directory?("PDF_files")) 			#Soubory ukladame do vlastni slozky, kterou si vytvorime + kontrola existence
		puts "Ukladani do slozky PDF_files"
	else
		puts "Vytvareni slozky PDF_files"
		Dir.mkdir "PDF_files"
		puts "Ukladani do slozky PDF_files"
	end
end

def uklid_zbytecne_soubory(soubor)
	File.delete("#{soubor["Nazev"]}.tex") if File.exist?("#{soubor["Nazev"]}.tex")
	File.delete("#{soubor["Nazev"]}.log") if File.exist?("#{soubor["Nazev"]}.log")
	File.delete("#{soubor["Nazev"]}.aux") if File.exist?("#{soubor["Nazev"]}.aux")
end

def Vytvor_PDF(soubory, latex_adress, pocet_kampani)
	pocet_souboru = 0
	soubory.each do |soubor|
		pocet_souboru = pocet_souboru + 1
		erb("databaze_paliva.txt.rb","./PDF_files/#{soubor["Nazev"]}.tex", {soubor:soubor, pocet_kampani:pocet_kampani})
		Dir.chdir("./PDF_files") do
			system("\"#{latex_adress}\" #{soubor["Nazev"]}.tex")
			uklid_zbytecne_soubory(soubor)
		end
		puts "#{soubor["Nazev"]} zpracován"
	end
	puts "Vygenerováno #{pocet_souboru} .pdf souborů do složky PDF_files."
end

soubory = []
pocet_kampani = 0

Dir["#{data_adress}"].each do |kampan|

	data_kampan = JSON[File.read(kampan)]

	pocet_kampani = pocet_kampani + 1

	vsazka = {}
	data_kampan["dburnup"].each do |soubor_nazev, vyhoreni|
		vsazka[soubor_nazev]=vyhoreni
	end

	vsazka.keys.each do |soubor_nazev|
		if cislo_kampan(kampan) == 1
			soubory << {
				"Nazev" => soubor_nazev,
				"Prvni zavezeni" => data_kampan["boc"],
				"Celkove vyhoreni" => vsazka[soubor_nazev],
				"Cislo kampane #{cislo_kampan(kampan)}" => cislo_kampan(kampan),
				"Vyhoreni #{cislo_kampan(kampan)}" => vsazka[soubor_nazev],
				"Zacatek kampane #{cislo_kampan(kampan)}" => data_kampan["boc"],
				"Konec kampane #{cislo_kampan(kampan)}" => data_kampan["eoc"]
			}
		else
			shoda = false
			soubory.each do |pouzity_soubor|
				if pouzity_soubor["Nazev"] == soubor_nazev
					pouzity_soubor["Celkove vyhoreni"] = pouzity_soubor["Celkove vyhoreni"].to_f+vsazka[soubor_nazev].to_f
					pouzity_soubor.store("Cislo kampane #{cislo_kampan(kampan)}", cislo_kampan(kampan))
					pouzity_soubor.store("Vyhoreni #{cislo_kampan(kampan)}", vsazka[soubor_nazev])
					pouzity_soubor.store("Zacatek kampane #{cislo_kampan(kampan)}", data_kampan["boc"])
					pouzity_soubor.store("Konec kampane #{cislo_kampan(kampan)}", data_kampan["eoc"])
					shoda = true
					break
				else
					next
				end
			end
			if shoda == true
				next
			else
				soubory << {
					"Nazev" => soubor_nazev,
					"Prvni zavezeni" => data_kampan["boc"],
					"Celkove vyhoreni" => vsazka[soubor_nazev],
					"Cislo kampane #{cislo_kampan(kampan)}" => cislo_kampan(kampan),
					"Vyhoreni #{cislo_kampan(kampan)}" => vsazka[soubor_nazev],
					"Zacatek kampane #{cislo_kampan(kampan)}" => data_kampan["boc"],
					"Konec kampane #{cislo_kampan(kampan)}" => data_kampan["eoc"]
				}
			end
		end
	end
	puts "Kampan #{cislo_kampan(kampan)} zpracovana"

end

Vytvor_ukladaci_slozku()

Vytvor_PDF(soubory, latex_adress, pocet_kampani)
