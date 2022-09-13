include Math
require 'pp'
require_relative "erb_compiler"

def rotace(vstup, k) #aplikace matice rotace o k=krat 60 stupnu
	vystup=[]
	vystup.clear
	vystup[0]=vstup[0]*cos(k*PI/3) - vstup[1]*sin(k*PI/3)
	vystup[1]=vstup[0]*sin(k*PI/3) + vstup[1]*cos(k*PI/3)
	vystup
end

puts "Probiha vykreslovani klikaci mapy zony"
COLOR = {} 				#sem se budou prirazovat barvy pro jednotlive typy clanku
EXTRACOLOR = ["#FF0000", "#32CD32", "#FFFF00", "#4682B4", "#FFA500", "#D2691E", "#BDB76B", "#800080", "#FF00FF"]
#-----------------------------------------------------------------------
#nacteni mapy zony
map=[[]] #mapa zony
p=0
File.foreach("data.txt") do |line| 
	map[p]=line.split
	p = p+1
end
#-----------------------------------------------------------------------
#vytvoreni klikaciho kartogramu
rozmer = 800 									#rozmer ctverce s obrazkem aktivni zony <- VOLITELNE!!!
central = [rozmer/2, rozmer/2] 					#stred obrazku AZ
roztec = rozmer/30								#technicky pul roztece / vzdalenost stred sestiuhelnika - stred strany
rameno = sqrt(1.3333333*roztec*roztec) 			#spocitano ze vzorcu z roztece
stred = []
puvodni=[]
pocet = {}
File.open("AZ.svg" , "w") do |f| 				#zapis svg zony
	f.puts %{<svg width="#{rozmer}" height="#{rozmer}" xmlns="http://www.w3.org/2000/svg" version="1.1">}
	(0..(map.size-1)).each do |i|				#iterace pres radky mapy sestiny
		(0..(map[i].size-1)).each do |j|		#iterace pres sloupce mapy sestiny
			if map[i][j]!="*" 					#vyber, zda je dane policko obsazeno
				stred.clear						
				typ = map[i][j]
				#-----------------------------------------------
				#spocitani poctu clanku daneho typu v jedne sestine
				if  pocet[typ]					
					pocet[typ]=pocet[typ] + 1
				else
					pocet[typ]=1
				end
				#-----------------------------------------------
				#urcovani pozice stredu oproti souradnici 0,0
				if i==0 						#tady urcuji pozici oproti nulovemu stredu pro prvni radek 
					stred[0] = (j-map[i].size+1)*2*roztec -roztec*i 
					stred[1] = i*1.5*rameno
				else							#tady urcuji pozici oproti nulovemu stredu pro zbyle radky
					if i.odd?					#v zavislosti na sudosti/lichosti radku
						stred[0] = (j-map[i].size+1)*2*roztec -roztec*i -2*roztec
						stred[1] = i*1.5*rameno
					else
						stred[0] = (j-map[i].size+1)*2*roztec -roztec*i -2*roztec
						stred[1] = i*1.5*rameno
					end
				end
				puvodni.clear
				puvodni=puvodni + stred 		#ulozeni pozice stredu pro nasledujici iteraci
				#-----------------------------------------------
				#vykreslovani jednotlivych clanku v AZ do vsech sestin najednou
				(1..6).each do |k|
					stred.clear
					stred[0]=rotace(puvodni, k)[0] + central[0] #postupne rotovani clanku do vsech sestin AZ
					stred[1]=rotace(puvodni, k)[1] + central[1]	 # spolu s posunem stredu kartogramu ze stredu 0,0 do stredu obrazku
					
					unless COLOR[typ]			#prirazeni barvy k typum clanku
						COLOR[typ]=EXTRACOLOR.shift
					end
					barva = COLOR[typ]
					text = map[i][j].to_s
					#-----------------------------------------------
					#samotne kresleni s parametry stredu clanku, barvy clanku a typu clanku
					#text s popiskem clanku i clanek samotny jsou udelany jako klikaci
					f.puts %{<polygon fill="#{barva}" stroke="black" stroke-width="3px" points="#{stred[0]+rameno*cos(PI/2)},#{stred[1]+rameno*sin(PI/2)} #{stred[0]+rameno*cos(PI/6)},#{stred[1]+rameno*sin(PI/6)} #{stred[0]+rameno*cos(-PI/6)},#{stred[1]+rameno*sin(-PI/6)} #{stred[0]+rameno*cos(-PI/2)},#{stred[1]+rameno*sin(-PI/2)} #{stred[0]+rameno*cos(-5*PI/6)},#{stred[1]+rameno*sin(-5*PI/6)} #{stred[0]+rameno*cos(5*PI/6)},#{stred[1]+rameno*sin(5*PI/6)}" onclick="$('.pocty').hide(); $('##{typ}').show();"/>}
					f.puts %{<text x="#{stred[0]}" y="#{stred[1]}" text-anchor="middle" fill="black" font-size="#{rameno/2}" onclick="$('.pocty').hide(); $('##{typ}').show();"> #{text} </text>}
				end
			else
				#puts "dalsi" #preskoceni poli v mape s nactenou hvezdickou
			end
		end	
	end
	f.puts %{</svg>}
end
#-----------------------------------------------------------------------
#dopocet poctu clanku v cele AZ
pocet.each do |typ, cislo| 
	pocet[typ] = pocet[typ] * 6
end
typ=map[0][map.size]
pocet[typ]=pocet[typ]-5
#------------------------------------
#sestaveni zdrojoveho kodu html dle formy "AZ.html.erb"
#predavany parametr jsou pocty clanku jednotlivych typu
erb("AZ.html.erb", "AZ.html", {:pocet=>pocet})
puts "klikaci mapa zony je ulozena v souboru AZ.html"
#hotovo