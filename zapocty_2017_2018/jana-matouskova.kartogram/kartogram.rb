require "cmath"



#definice pro vykresleni hexagonu
def hexagon(x, y, size, type, colour) 
	
	vystup = ""
	
	pozice = "<polygon points=\"#{x-26*size},#{y-15*size} #{x},#{y-30*size} #{x+26*size},#{y-15*size} #{x+26*size},#{y+15*size} #{x},#{y+30*size} #{x-26*size},#{y+15*size}\""
	typ = " stroke=\"black\" fill=\"#{colour}\" /> \n"
	text = "<text x=\"#{x-20*size}\" y=\"#{y}\" font-size=\"#{size * 15}\"> #{type} </text>"
	
	vystup = pozice + typ + text
	
end
  
  
pi = Math::PI
barvy = {}
pic_size = 1280.0


#nahrani barev ze souboru
File.foreach("colours.txt") do |line|

	data = line.split
	barvy[ data[0] ] = []
	barvy[ data[0] ][0] = data[1]
	barvy[ data[0] ][1] = 0
	
end



File.open("zona.svg", 'w') do |soubor|

	soubor.puts "<svg width=\"#{pic_size}\" height=\"#{pic_size}\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\">"

	x0 = pic_size/2
	y0 = pic_size/2
	
	size = x0/(10*52)
	first_line = true
	
	x = nil
	y = nil
	
	x_start = nil
	y_start = nil
	
	radek = 0
	
	
	File.foreach("data.txt") do |line|

		data = line.split
				
		if first_line
		
			velikost = data.size
			
			center = data[velikost - 1]
			
			if (center != "*")	
				barvy[center][1] = -5 #z celkoveho poctu odeberu 5 centralnich souboru ktere tam nejsou kvuli symetrii	
			end
				
			x_start = x0 - (velikost - 1) * 52 * size
			y_start = y0
		
			x = x_start
			y = y_start		
		
			first_line = false
		else
		
			x = x_start + radek * 26 * size
			y = y_start + radek * 45 * size
		
		end
		
		
		data.each do |hodnota|
		
			if (hodnota == "*")
			
			else
				# vykreslovani 1/6
				soubor.puts hexagon(x, y, size, hodnota, barvy[hodnota][0])
				

				
				# vykreslovani zbyle plochy podle symetrie
				(1...6).each do |i|				
					
					a0 = x0 - x
					b0 = y - y0
					r = Math.sqrt(a0*a0 + b0*b0)
					alpha = Math.acos( a0/r )
					
					a = r * Math.cos( alpha + i * pi/3)
					b = r * Math.sin( alpha + i * pi/3)
					
					x_new = x0 - a
					y_new = y0 + b
					
					soubor.puts hexagon(x_new, y_new, size, hodnota, barvy[hodnota][0])
					
				end
				
				barvy[hodnota][1] += 6 #pocitani souboru
 				
			end
			
			x += size * 52		
			
		end
		
		radek += 1 #posun na dalsi radek

	end
	
	
	#vypis legendy
	x_leg = 30*size
	y_leg = 35*size
	
	barvy.each do |klic, pole|
		
		soubor.puts hexagon(x_leg, y_leg, size, klic, pole[0])
		soubor.puts "<text x=\"#{x_leg + 30*size}\" y=\"#{y_leg}\" font-size=\"#{size * 25}\"> #{pole[1]} x </text>"
		
		y_leg += 43*size
		
	end

	soubor.puts "</svg>"

end
