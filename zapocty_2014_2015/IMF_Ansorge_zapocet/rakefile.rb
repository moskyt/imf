#coding: UTF-8
#------ Skrtipt je třeba nakopírovat a spouštět ze stejné složky, do které je uložena složka "data". ------# 
#---------------------- Ke spuštění lze použít příkaz "rake all". -----------------------------------------#

require 'fileutils'

$gnuplot="gnuplot"       #Do proměnné $gnuplot je třeba zadat cestu k programu Gnuplot.

task :all =>[:slozka, :des_carky, :grafy, :smazto] do				#Spustí všechny "tasky" najednou.
puts "Tak a teď by to mělo být všechno!"
end

task :slozka do														#Vytvoří složku "grafy" do které budou uloženy výsledné soubory *.png.
	unless File.directory? "grafy" then
	FileUtils.mkdir_p "grafy"
	end
end

task :des_carky do													#V případě že datové soubory používají k oddělení desetinných míst čárky, dojde k jejich změně na desetinné tečky.
	Dir["data/*.csv"].each do |name|
		projdi=IO.read(name)
		prosel=projdi.gsub(",",".")
		file=File.open(name,'w')
		file.puts(prosel)
		file.close
	end
end
task :grafy do														#Do složky "grafy" vykreslí z datových souborů grafy ve formátu *.png.

def gp_plot (pathname, h_inv, time_c)
	@f.puts %{plot\\}
	h_inv.each_key do |key|
		@f.puts %{"#{pathname}.csv" u #{time_c}:#{key} w l t "#{h_inv[key]}",\\}
	end
end 

Dir["data/*.csv"].each do |file|
	IO.foreach(file) do |line|
		if line.include?("time")
			signaly=line.split
			d=0
			signaly.each do |a|
				signaly[d]=a.strip.gsub(/[^a-zA-Z0-9\-]/,"") 
				d=d+1
			end
			h={}
			@delka=signaly.length
				(1..@delka).each do |i|
					h[signaly[i-1]]=i
				end
			h_sort=Hash[h.sort_by{|k,v| k}]
			time_c=h_sort["time"]
			h_sort.delete("time")
			h_inv=h_sort.invert
			#puts h
			pathname=file.split(".")[0]
			@name=pathname.split("/")[1]
			@f=File.open("#{pathname}.gp",'w')
			@f.puts "set terminal png 24 size 1400,1000"
			@f.puts %{set output "./grafy/#{@name.sub("file","graf")}.png" }
			@f.puts %{unset key}
			@f.puts "set grid "
			@f.puts "set decimalsign ',' "
			@f.puts %{set title "graf číslo #{@name.split("_")[1]}"}
			@f.puts %{set xlabel "čas"}
			@f.puts %{set ylabel "signál"}
			@f.puts %{set key autotitle }
			gp_plot(pathname,h_inv,time_c)
			@f.close
			system("\"#{$gnuplot}\" #{pathname}.gp")
		end	
			
	end
	puts "#{@name} - hotovo!"
end
end

task :smazto do														#Smaže soubory *.gp, které byly využity gnuplotem pro tvorbu grafů a dále nejsou potřeba.			
	Dir["data/*.gp"].each do |file|
		File.delete(file)
	end
end


