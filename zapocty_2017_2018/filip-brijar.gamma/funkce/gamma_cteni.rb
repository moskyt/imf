=begin
Funkce převádí hodnoty z csv souborů v dané složce na hash "data".
Hash "data" obsahuje data o jednolivých palivových souborech načtených ze souborů ve složce "data". Kažý prvek je uložený pod svým "ID" a obsahuje:
"ID" => identifikáor palivového souboru
"zaznam" => pole dvouprvkových polí obssahující vždy délku nódu a naměřenou hodnou [délka nódu, naměřená hodnota]
"nodu" => počet nódů dělení palivového souboru
"celek" => součet naměřených hodnot přes všechny nódy
=end
def nacti_data(cesta)

	data = Hash.new
	
	#načtení souborů ve složce
	soubory_s_daty = Dir[cesta + "*.csv"]
	
	#kontrola jestli složka "data" není prázdná
	if (soubory_s_daty.length == 0)
		puts ("\nCHYBA: Složka \"data\" neobsahuje žádný *.csv soubor.")
		return nil
	end
	
	#načítání dat
	soubory_s_daty.each do |soubor|
		
		
		#čtení souboru	
		f = File.open(soubor)
		cislo_radku = 1
		temp_hash = Hash.new	#dočasný hash
		temp_rozdeleni = []		#dočasné pole pro ukládání nodalizace
		temp_namereno = []		#dočasné pole pro ukládání naměřených dat
		begin
			radek = f.gets
			
			# čtení ID palivového souboru
			if (cislo_radku == 1) 
					if (radek.include?("#"))
						temp_hash["ID"] = radek.tr("#", "").strip
					else
						puts ("\nCHYBA (nacti_data): V souboru " + soubor + " se vyskytla chyba pri cteni souboru (radek1). Neobsahuje #.")
					end
			end
			
			# čtení rzodělení palivového souboru na nódy
			if (cislo_radku == 2)
					if (radek.include?("#"))
						temp_rozdeleni = radek.tr("#", "").strip.split(",")
					else
						puts ("\nCHYBA (nacti_data): V souboru " + soubor + " se vyskytla chyba pri cteni souboru (radek2). Neobsahuje #.")
					end
			end
			
			# čtení dat naměřených v jednolivých nódech
			if (cislo_radku>2)
						temp_namereno = temp_namereno + radek.strip.split(" ")
			end
			
			cislo_radku = cislo_radku + 1
			
		end while (!f.eof?)
		f.close
		
		
		#spojení polí nodalizace a naměřených hodnot (temp_rozdeleni a temp_namereno) a vložení počtu nódů
		if (temp_namereno.length==temp_rozdeleni.length)
			temp_hash["zaznam"] = temp_rozdeleni.zip(temp_namereno)
			temp_hash["nodu"] = temp_rozdeleni.length
		else 
			puts ("\nCHYBA (nacti_data): V souboru " + soubor + " se neshoduje počet nódů s počtem naměřených dat.")
		end
		
		#konverze stringů v záznamu na float
		temp_hash["zaznam"] = temp_hash["zaznam"].map{|n| [n[0].to_f,n[1].to_f]}
		
		#určení součtu naměřených hodnot přes všechny nódy
		temp_soucet = 0 #dočasná proměnná součtu všech nódů
		temp_hash["zaznam"].each do |prvek|
			temp_soucet = temp_soucet + prvek[1]
		end
		temp_hash["celek"] = temp_soucet		
		
		#uložení dočasného hashe
		data[temp_hash["ID"]] = temp_hash

	
	end

	return data

end