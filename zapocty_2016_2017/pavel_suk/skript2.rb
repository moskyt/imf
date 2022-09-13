require 'time'
idecko={}
vysledne={}
cesta_gnu="\"gnuplot\""
File.open("upravena_data2.csv", "w") do |f|
	File.foreach("data.csv") do |line|
		line=line.gsub(". ", ".").gsub(":", " ")
		if line.include?("e+")
			aktivita=line.split(" ")[2]
			aktivita=aktivita.to_f
			line=line.split(" ")[0]+" "+ line.split(" ")[1] + " " + aktivita.to_s
		end
		if line.include?("/")
			datum=line.split(" ")[0]
			datum=datum.split("/")[1]+"."+datum.split("/")[0]+"."+datum.split("/")[2]
			#puts datum
			line=datum+" "+line.split(" ")[1]+" "+line.split(" ")[2]
			#puts line
		end
		if line.include?("-")
			datum=line.split(" ")[0]
			datum=datum.split("-")[2]+"."+datum.split("-")[1]+"."+datum.split("-")[0]
			#puts datum
			line=datum+" "+line.split(" ")[1]+" "+line.split(" ")[2]
			#puts line
		end
		data=line.scan(/(\d+\.\d+\.\d+)\s+(\w+)\s+(\d+.\d+)/)[0]

		if idecko.has_key?(data[1])
			idecko[data[1]].push(data[0]).push(data[2])
		else
			idecko[data[1]]=data[0], data[2]
		end
	end
	f.puts "# id doba celkova davka"
	idecko.each do |id, info|
		#puts id
		#puts info[2]
		#puts info[0]
		doba=(Time.strptime(info[2], "%d.%m.%Y")- Time.strptime(info[0], "%d.%m.%Y")) #s
		#puts doba/3600/24
		davka=info[1].to_f-info[3].to_f
		bi=1/doba.to_f*Math.log(info[1].to_f/info[3].to_f, 2.718281828)
		celkovadavka=(info[1].to_f/bi-(info[1].to_f/bi)*Math.exp(-bi*doba))/3600/24
		f.puts id.to_s + " " + (doba/3600/24).to_s + " " + celkovadavka.to_s
		vysledne[id]=doba,celkovadavka
	end
	max=0
	maxid= " "
	min=100000
	minid= " "
	#f.puts vysledne
	vysledne.each do |id, info|
		if info[1].to_f > max
			max=info[1].to_f
			maxid=id.to_s
		end
		if info[1].to_f<min
			min=info[1].to_f
			minid=id.to_s
		end
	end
	File.open("maxmin.txt", "w") do |file|
		file.puts "%15s %8.3f %1s %15s %6s" % ["Maximální dávka:", max, " ", "Vzorek:", maxid.to_s]
		file.puts "%15s %8.3f %2s %15s %6s" % ["Minimální dávka:", min, " ", "Vzorek:", minid.to_s]
	end
end
filename="upravena_data2.csv"
def plot(filename, cesta_gnu)
	gp_filename="histogram_davek.gp"
	png_filename="histogram_davek.png"
	File.open(gp_filename, "w") do |f|
		f.puts "set yzeroaxis"
		f.puts "set style line 1 lt 1 lc rgb \"orange\" lw 1"
		f.puts "set style line 2 lt 1 lc rgb \"black\" lw 1"
		f.puts "set title \"Histogram dávek jednotlivých vzorků\" "
		f.puts "set xlabel \"Vzorky\""
		f.puts "set xrange [ 0 : 2900 ]"
		f.puts "set ylabel \"Dávka (mSv)\" "
		f.puts "set boxwidth 0.5"
		f.puts "set style fill solid"
		f.puts "set terminal png"
		f.puts "set output \"#{png_filename}\""
		f.puts "plot \"#{filename}\" using 3 ls 1 with boxes"
	end
	system("#{cesta_gnu} #{gp_filename}")
	File.delete(gp_filename)

	gp1_filename="histogram_delky_pobytu_vzorku.gp"
	png1_filename="histogram_delky_pobytu_vzorku.png"
	File.open(gp1_filename, "w") do |f|
		f.puts "set yzeroaxis"
		f.puts "set style line 1 lt 1 lc rgb \"orange\" lw 1"
		f.puts "set style line 2 lt 1 lc rgb \"black\" lw 1"
		f.puts "set title \"Histogram délky pobytu vzorku\" "
		f.puts "set xlabel \"Vzorky\""
		f.puts "set xrange [ 0 : 2900 ]"
		f.puts "set ylabel \"Délka pobytu (dny)\" "
		f.puts "set boxwidth 0.5"
		f.puts "set style fill solid"
		f.puts "set terminal png"
		f.puts "set output \"#{png1_filename}\""
		f.puts "plot \"#{filename}\" using 2 ls 1 with boxes"
	end
	system("#{cesta_gnu} #{gp1_filename}")
	File.delete(gp1_filename)

	gp2_filename="scatter_plot.gp"
	png2_filename="scatter_plot.png"
	File.open(gp2_filename, "w") do |f|
		f.puts "set yzeroaxis"
		f.puts "set style line 1 lt 1 lc rgb \"orange\" lw 1"
		f.puts "set style line 2 lt 1 lc rgb \"black\" lw 1"
		f.puts "set title \"Vztah mezi délkou pobytu a celkovou dávkou \" "
		f.puts "set xlabel \"Délka pobytu (dny)\""
		f.puts "set xrange [ 0 : 125 ]"
		f.puts "set ylabel \"Dávka (mSv)\" "
		f.puts "set boxwidth 0.5"
		f.puts "set style fill solid"
		f.puts "set terminal png"
		f.puts "set output \"#{png2_filename}\""
		f.puts "plot \"#{filename}\" using 2:3 ls 1 with points"
	end
	system("#{cesta_gnu} #{gp2_filename}")
	File.delete(gp2_filename)
end

plot(filename, cesta_gnu)
