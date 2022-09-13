=begin
Funkce spustí dávkové soubory pro gnuplot ze složky "gnuplot/davky". Jestliže se při provádění některé dávky vyskytne chyba funkce vrátí false.
=end
def gnuplot_spust()
	davky = Dir["./gnuplot/davky/*.txt"]
	vystupni_stav = true #proměnná kam se ukládá výstup volání system (vrací: true - proběhlo správně, nil - chyba, false - "non zero exit status" (https://stackoverflow.com/questions/18728069/ruby-system-command-check-exit-code))
	
	davky.each do |davka|
		vystupni_stav = system("gnuplot " + davka)
		
		#kontrola zda byla dávka spuštěna
		if (vystupni_stav == nil)
			puts "\nCHYBA (gnuplot_spust): Gnuplot dávku " + davka + " nelze provést."
			return false
		else
			#kontrola zda nedošlo k chybě při provádění dávky
			if (vystupni_stav == false)
				puts "\nCHYBA (gnuplot_spust): Při provádění dávky " + davka + " došlo k anomálii :)."
				gnuplot_chyba = true
				return false
			end
		end
	end
end