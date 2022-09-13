# encoding: utf-8

require "pp"
require "open-uri"
require "erb"
require_relative "erb_compiler"


# nacteni dat ze souboru - misto mereni a aktivita - (datum mereni zde neni)
# jmeno mista mereni - problemy s diakritikou v url
#        => prevedeni do tvaru bez diakritiky => jmeno_bez
# nacteni zemepisnych souradnic
data0 = []
File.foreach("data.csv", :encoding=>"UTF-8") do |line|

		jmeno0=line.strip.split(";")[0]
		aktivita0=line.strip.split(";")[1]

		jmeno_bez=line.strip.split(";")[0].gsub(/[ěščřžýáíéďťňóůúŠČŘŽÝĚÁÍÉÓÚŮĎŤŇ]/,
								'ě' => 'e', 'š' => 's', 'č' => 'c', 'ř' => 'r', 'ž' => 'z',
								'ý' => 'y', 'á' => 'a', 'í' => 'i', 'é' => 'e', 'ď' => 'd',
								'ť' => 't', 'ň' => 'n', 'ó' => 'o', 'ů' => 'u', 'ú' => 'u',
								'Š' => 'S', 'Č' => 'C', 'Ř' => 'R', 'Ž' => 'Z', 'Ý' => 'Y',
								'Ě' => 'E', 'Á' => 'A', 'Í' => 'I', 'É' => 'E', 'Ó' => 'O',
								'Ú' => 'U', 'Ů' => 'U', 'Ď' => 'D', 'Ť' => 'T', 'Ň' => 'N')


		url="http://api.mapy.cz/geocode?query=#{jmeno_bez}"
			f = open("#{url}")
			s = f.read
		pozice_x0 = s.match(/x="([^\s]+)"/)[1]
		pozice_y0 = s.match(/y="([^\s]+)"$/)[1]


		data0 << [jmeno0, aktivita0, pozice_x0, pozice_y0]
end




# prirazeni jednotlivych mereni ke stejnym mistum mereni
# vypocteni prumerne aktivity v urcitem miste mereni
# problemy s diakritikou v html.erb
#         => prevod do tvaru pro lehky prevod zpet v html.erb
#             (neelegantni zpusob i tvar nahrazeni, ale jediny fungujici z mnoha vyzkousenych)
data1=[]
prumer_vse=[]

data0.each do |l|

		pozice_x=l[2]
		pozice_y=l[3]

		jmeno=l[0].encode("UTF-8")
		pocet_mereni=0
		jednotliva_mereni=[]
		aktivita_celkova=0
		data0.each do |m|
				jmeno1=m[0].encode("UTF-8")
				if jmeno==jmeno1
					pocet_mereni+=1
					aktivita_celkova+=m[1].to_f
					jednotliva_mereni<<m[1].to_f
				end
		end
		prumer=aktivita_celkova/pocet_mereni
		prumer_vse<<prumer



		jmeno_html=jmeno.gsub(/[ěščřžýáíéďťňóůúŠČŘŽÝĚÁÍÉÓÚŮĎŤŇ]/,
					'ě' => ':eee:', 'š' => ':sss:', 'č' => ':ccc:', 'ř' => ':rrr:', 'ž' => ':zzz:',
					'ý' => ':yy:', 'á' => ':aa:', 'í' => ':ii:', 'é' => ':ee:', 'ď' => ':ddd:',
					'ť' => ':ttt:', 'ň' => ':nnn:', 'ó' => ':oo:', 'ů' => ':uuu:', 'ú' => ':uu:',
					'Š' => ':SSS:', 'Č' => ':CCC:', 'Ř' => ':RRR:', 'Ž' => ':ZZZ:', 'Ý' => ':YY:',
					'Ě' => ':EEE:', 'Á' => ':AA:', 'Í' => ':II:', 'É' => ':EE:', 'Ó' => ':OO:',
					'Ú' => ':UU:', 'Ů' => ':UUU:', 'Ď' => ':DDD:', 'Ť' => ':TTT:', 'Ň' => ':NNN:')


		data1<<[jmeno_html, pozice_x, pozice_y, pocet_mereni, prumer]+jednotliva_mereni
end


# odstraneni opakujicich se prvku (kolikrat se v danem miste merilo, tolik stejnych dat)
data2=data1.uniq


# prirazeni cisla reprezentujici barvu
#       barva bude ve tvaru: hsl(x, 100%, 50%)
#       kde x=barva= 240(modra) az 360(cervena)
max_davka=prumer_vse.max
min_davka=prumer_vse.min
rozdil=max_davka-min_davka

data=[]
data2.each do |h|
		barva=[]
		delta=(h[4]-min_davka)/rozdil
		barva<<((120*delta)+240)

		data<<h+barva
end



# konecna data ve forme:
#		data:	[0]-nazev mista mereni
#       		[1]-zemepisna delka
#       		[2]-zemepisna sirka
#       		[3]-pocet mereni v danem miste
#       		[4]-prumerna hodnota aktivity radonu v danem miste
#       		[5..-2]-hodnoty jednotlivych mereni
#       		[-1]-cislo reprezentujici barvu


erb("radon.html.erb", "radon.html", {:dat => data})

puts "Vytvořena mapa: radon.html"