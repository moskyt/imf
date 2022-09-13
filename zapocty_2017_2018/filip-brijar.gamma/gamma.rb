require "./funkce/gamma_cteni.rb"
require "./funkce/gamma_gnuplot_generace.rb"
require "./funkce/gamma_gnuplot_generace_maxima.rb"
require "./funkce/gamma_maxima.rb"
require "./funkce/gamma_gnuplot_aplikace.rb"
require "fileutils"		#třeba kvůli tvorbě složek


$stdout.sync = true 	#prý je třeba aby print fungoval správně (https://stackoverflow.com/questions/5080644/how-can-i-use-puts-to-the-console-without-a-line-break-in-ruby-on-rails)

#kontrola přítomnosti složky s daty
if (!Dir.exist?("data"))
	puts "CHYBA: Ve složce s programem není složka \"data\" s *.csv soubory."
	abort("Program předčasně ukončen.")
end

#tvorba složek na výstupy, pokud neexistují
FileUtils::mkdir_p("gnuplot/data/")
FileUtils::mkdir_p("gnuplot/davky/")
FileUtils::mkdir_p("gnuplot/grafy/")

#načítání dat
print "Načítám data..."
data = nacti_data("data/")
if (data == nil)
	abort ("Program předčasně ukončen.")
end
puts "Hotovo"

#hledání palivových souborů s největší celkovou naměřenou hodnotou
print "Hledám maxima..."
maxima = najdi_maxima(data)
if (maxima ==nil)
	abort ("Program předčasně ukončen.")
end
puts "Hotovo"

#vytváření datových a dávkových souborů pro gnuplot
print "Vytvářím vstupy pro gnuplot..."
gnuplot_generace(data)
if (!gnuplot_generace_maxima(maxima))
	abort ("Program předčasně ukončen.")
end
puts "Hotovo"

#použití dávkových souborů gnuplotem
print "Vytvářím grafy..."
if (gnuplot_spust())
	puts "Hotovo"
	puts "Grafy byly úspěšně vytvořeny."
else
	puts "Program předčasně ukončen."
end