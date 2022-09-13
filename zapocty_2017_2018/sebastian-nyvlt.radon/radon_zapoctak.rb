require "open-uri"
require "json"

api_key_1 = "AIzaSyAFtAYwTlar49QXNe2NDqxALhTC9rnbwFc" #používám vlastní API klíč - tento je pro zisk GPS
api_key_2 = "AIzaSyDCUqb6iK4yfFCM43JW4qP8EsalwEi62Io" #a tento pro výslednou API - mapku

#nastavení barev - lze upravit (šlo by udělat i vedle do texťáku, aby to bylo více user-friendly...)
cervena = "CC0000"
oranzova = "FF6600"
zluta = "E6E600"
zelena = "33CC00"
modra = "0000FF"

data = [] #sem se zkoupírují data z texťáku a budou se postupně "odbourávat" do hashe "radon"
radon = {} #bude zde výsledný hash aktivit a souřadnic a barev

#skutečný začátek programu
puts
puts "----------------------------------START----------------------------------"
puts

#úprava názvů obcí, aby neobsahovaly české znaky (problém při hledání GPS pomocí Google API)
file = File.read("data/data.csv", encoding: "utf-8")
file_edited = file.tr("ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
                      "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz")
File.write("data/data_edited.csv", file_edited)

#čtení dat z texťáku
File.foreach("data/data_edited.csv", encoding: "utf-8") do |line| #načte data z CSV
	data << line.strip.split(";")[0]
	data << line.strip.split(";")[1].to_f
end
#v poli data je vždy město (na lichých pozicích) a hned za nimi jejich aktivity (na sudých pozicích)

puts "Data načtena."

if data.uniq.size == data.size #ošetřuje duplicitní měření, přesměrovává data z pole "data" do hashe "radon"

	puts "Neopakuje se nic - HURÁ!!!"
	
	data.each do
		radon[data[0]] = {}
		radon[data[0]]["aktivita"] = data[1]
		data.delete(data[0]) #nepodařilo se mi najít příkaz na mazání prvního prvku pole - proto ta opičárna zde a zejména níže...
		data.delete_at(data.index(data[0])) #je potřeba příkaz modifikovat, aby nemazalo případně stejnou hodnotu naměřenou jinde
	end
	
else

	puts "Některá města byla měřená vícekrát..."
	puts "=> Dojde ke zprůměrování duplicitních hodnot."
	puts
	
	data.each do #projížní názvy měst
		#ošetřit aby se neřešily města při druhém, třetím, ... nálezu
		if data.count(data[0]) == 1
			puts "Město #{data[0]} bylo měřeno JEDNOU, byla naměřena aktivita #{data[1]}."
			radon[data[0]] = {}
			radon[data[0]]["aktivita"] = data[1]
			data.delete(data[0]) #nepodařilo se mi najít příkaz na mazání prvního prvku pole - proto ta opičárna zde a zejména níže...
			data.delete_at(data.index(data[0])) #je potřeba příkaz modifikovat, aby nemazalo případně stejnou hodnotu naměřenou jinde
		else
			cetnost = data.count(data[0])
			mesto = data[0]
			print "Město #{mesto} bylo měřeno #{cetnost}x"
			data.delete_at(data.index(data[0])) #opět maže jen první výskyt - názvu města
			hodnota = data[0] #bude se průmerovat
			data.delete_at(data.index(data[0])) #opět maže jen první výskyt - hodnoty
			
			(cetnost-1).times do
				poradi = data.find_index(mesto) #najde další výskyt města
				data.delete_at(data.index(mesto)) #smaže prvek pole data se jménem města
				hodnota += data[poradi] #na původní pozici je nyní naměřená aktivita, ta se přičte
				data.delete_at(data.index(data[poradi])) #a smaže
			end
			hodnota = (hodnota/cetnost).round(3)
			puts ", průměrná aktivita vyšla #{hodnota}."
			radon[mesto] = {}
			radon[mesto]["aktivita"] = hodnota
		end
	end

end #v hashi radon je vždy město (formou hashe) a hodnota v klíči "aktivita"

#získává počáteční písmeno názvu měst - je to pak v mapě hezčí a líp se v tom orientuje
radon.keys.each do |mesto|
	radon[mesto]["pismeno"] = mesto[0]
end

#hledání maxima a minima (vzhledem ke složitější struktuře hashe se mi nepovedlo doheldat funkci, která najde maximum a minimum v klíčích aktivita...)
max = radon[radon.keys[0]]["aktivita"] #bude se hodit později při hledání maxima a minima
min = radon[radon.keys[0]]["aktivita"]

radon.keys.each do |mesto|
	if radon["#{mesto}"]["aktivita"] > max
		max = radon["#{mesto}"]["aktivita"]
	end
	
	if radon["#{mesto}"]["aktivita"] < min
		min = radon["#{mesto}"]["aktivita"]
	end
end

#dělení do intervalů (pro potřeby barev)
interval = ((max-min)/5.0).round(3)

petina = (min+interval).round(3)
dvepetiny = (min+(2*interval)).round(3)
tripetiny = (min+(3*interval)).round(3)
ctyripetiny = (min+(4*interval)).round(3)

puts
puts "Minimální hodnota je #{min}."
puts "Maximální hodnota je #{max}."
puts
puts "Škála je nastavena následovně:"
puts
puts "Modrá:            #{min}---#{petina}"
puts "Zelená:         #{petina}---#{dvepetiny}"
puts "Žlutá:          #{dvepetiny}---#{tripetiny}"
puts "Oranžová:       #{tripetiny}---#{ctyripetiny}"
puts "Červená:        #{ctyripetiny}---#{max}"
puts

#ukládání barev do hashe měst
radon.keys.each do |mesto|
	if radon[mesto]["aktivita"] < petina
		radon[mesto]["barva"] = modra
		
	elsif radon[mesto]["aktivita"] < dvepetiny
		radon[mesto]["barva"] = zelena
		
	elsif radon[mesto]["aktivita"] < tripetiny
		radon[mesto]["barva"] = zluta
		
	elsif radon[mesto]["aktivita"] < ctyripetiny
		radon[mesto]["barva"] = oranzova
		
	elsif radon[mesto]["aktivita"] <= max
		radon[mesto]["barva"] = cervena
		
	else #co kdyby se něco pokazilo...
		radon[mesto]["barva"] = "000000"
		puts "#{radon[mesto]} je nějakej vadnej!!!"
	end
end

#zápis souřadnic do hashe měst
puts "Probíhá zaměřování měst..."
radon.keys.each do |mesto|
	url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{mesto},czech_republic&language:cs&key=#{api_key_1}"
	sirka = JSON[open(url).read]["results"][0]["geometry"]["location"]["lat"].round(6)
	delka = JSON[open(url).read]["results"][0]["geometry"]["location"]["lng"].round(6)
	radon[mesto]["sirka"] = sirka
	radon[mesto]["delka"] = delka
	puts "Město #{mesto} bylo zaměřeno na souřadnicích #{sirka}N, #{delka}E."
end
puts

#produkce výsledného souboru
puts "Začíná výroba finálního HTML souboru (k nalezeni ve složce \"vysledky\")."
File.open("vysledek/radon_zapoctak_vysledek.html", 'w') do |f|
	f.puts %{
	<!doctype html>
	<html>
	  <head>
		<style>
		   #map \{
			height: 650px;
			width: 100%;
		   \}
		</style>
	  </head>
	  
	  <body>
		<h3>Radonová aktivita napříč ČR</h3>
		<div id="map"></div>
		<script>
		  function initMap() \{
			var map = new google.maps.Map(document.getElementById('map'), \{
			  zoom: 8,
			  center: \{lat: 49.894324, lng: 15.361177\}
			\});
	}
	
	radon.keys.each_with_index do |mesto, i|
		if radon[mesto]["barva"] == "0000FF" or radon[mesto]["barva"] == "CC0000"
		f.puts %{
			var marker#{i} = new google.maps.Marker(\{
          position: \{lat: #{radon[mesto]["sirka"]}, lng: #{radon[mesto]["delka"]}\},
          map: map,
		  icon: 'https://chart.googleapis.com/chart?chst=d_map_pin_letter_withshadow&chld=#{radon[mesto]["pismeno"]}|#{radon[mesto]["barva"]}|FFFFFF',
		  title: \"#{mesto}, aktivita: #{radon[mesto]["aktivita"]}\"
        \});
		}
		else
		f.puts %{
			var marker#{i} = new google.maps.Marker(\{
          position: \{lat: #{radon[mesto]["sirka"]}, lng: #{radon[mesto]["delka"]}\},
          map: map,
		  icon: 'https://chart.googleapis.com/chart?chst=d_map_pin_letter_withshadow&chld=#{radon[mesto]["pismeno"]}|#{radon[mesto]["barva"]}|000000',
		  title: \"#{mesto}, aktivita: #{radon[mesto]["aktivita"]}\"
        \});
		}
		end
	end
	
	f.puts %{
		\}
		</script>
		<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDCUqb6iK4yfFCM43JW4qP8EsalwEi62Io&callback=initMap">
		</script>
	  </body>
	</html>
	}
end
puts
puts "Soubor vytvořen."

puts
puts "----------------------------------KONEC----------------------------------"