#Sem zadejte cestu ke GNU plotu
gnu_cesta="gnuplot"
#
data = {}
aktivity={}
max = []
Dir.mkdir("pics") unless File.exists?("pics")
def plot(base,data,aktivity,gnu_cesta) 
	gp_filename = "pics/#{base}.gp"
	data.each do |zaklad,j|
		if zaklad == base 
			puts base
			File.open("data/#{base}_o.csv","w") do |g|
				j.each do |x,y|
					y.each do |delka,hodnota|
						a0=0						
						a=0	
						c0=0						
						delka.each do |i1|
							a0+=1
							b0=0
							hodnota.each do |i2|
								b0+=1
								if a0==b0
									a+=i1.to_f/2
									g.puts "%10.5f %10.5f " % [a,i2.to_f/i1.to_f]   
									a+=i1.to_f/2
									c0+=i2.to_f/i1.to_f
								end
								
							end
						end
						
						aktivity[x] = c0
					end
				
					File.open("pics/#{base}.gp","w") do |f|
						f.puts "set title 'ID kazety = #{x}'"
						f.puts "set terminal png"
						f.puts "set output \"pics/#{x}.png\""
						f.puts "set xlabel 'Axiální vzdálenost'"      
						f.puts "set ylabel 'Intenzita'"
						f.puts "plot \'data/#{base}_o.csv\' using 1:2 title 'Exp. data'"
					end
				end
			end
		end
	end
	system("\"#{gnu_cesta}\" #{gp_filename}")
	File.delete(gp_filename)
	File.delete("data/#{base}_o.csv")
	aktivity
end

def najdi_max(aktivity,max)	
	
	f=[]
	g=[]
	aktivity.each do |id,aktivita|
		f<< aktivity[id]
	end
	(1..5).each do |vec|
		g<<f.max
		f.delete(f.max)
	end
	g.each do |hledani|
		aktivity.each do |id,aktivita|
			if hledani==aktivita
				max<<id
			end
		end
	end
	max
end

def plot2(data,max,gnu_cesta) 
	gp_filename = "max_aktivita.gp"
	ii=[]
	max.each do |i|
		data.each do |zaklad,j|
			j.each do |id,y|
				if id == i
					File.open("#{i}_o.csv","w") do |g|
						y.each do |delka,hodnota|
							a0=0						
							a=0	
							c0=0						
							delka.each do |i1|
								a0+=1
								b0=0
								hodnota.each do |i2|
									b0+=1
									if a0==b0
										a+=i1.to_f/2
										g.puts "%10.5f %10.5f " % [a,i2.to_f/i1.to_f]   
										a+=i1.to_f/2
									end
								end
							end
						end
					end
				end
			end
		end
		ii<<i
	end

	
	File.open("max_aktivita.gp","w") do |f|
		f.puts "set title 'Kazety s největší aktivitou'"
		f.puts "set terminal png"
		f.puts "set output \"max_aktivita.png\""
		f.puts "set xlabel 'Axiální vzdálenost'"      
		f.puts "set ylabel 'Intenzita'"
		f.puts "plot \'#{ii[0]}_o.csv\' using 1:2 title '#{ii[0]}',\'#{ii[1]}_o.csv\' using 1:2 title '#{ii[1]}',\'#{ii[2]}_o.csv\' using 1:2 title '#{ii[2]}',\'#{ii[3]}_o.csv\' using 1:2 title '#{ii[3]}',\'#{ii[4]}_o.csv\' using 1:2 title '#{ii[4]}'"
	end
	system("\"#{gnu_cesta}\" #{gp_filename}")
	File.delete(gp_filename)
	max.each do |i|
		File.delete("#{i}_o.csv")
	end
end


Dir["data/*.csv"].each do |filename|
	File.open(filename, "r") do |f|
		base = File.basename(filename, ".csv")
		line = f.gets.split(" ")
		id = line[1]
		line = f.gets.split("#")
		delky = line[1].strip.split(", ")
		data[base] ||= {}
		aktivity[id] ||= {}
		data[base][id] ||= {}
		hodnoty = nil
		hodnoty = File.read(filename).scan(/\d+\.\d+/)
		data[base][id][delky] = hodnoty
		plot(base,data,aktivity,gnu_cesta)
		
	end	
end
najdi_max(aktivity,max)
plot2(data,max,gnu_cesta)