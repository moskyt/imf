system("mkdir vstup_gnuplot")       #slozka pro vstupni soubory pro gnuplot
system("mkdir data_gnuplot")        #slozka pro data pro gnuplot
system("mkdir vystupy_gnuplot")     #slozka pro vysledne grafy

def cteniDat(jmeno)
    data = { :assembly => "", :delky => [], :intenzity => [], :maximum => ""} #hash pro zapis veskerych dat
    file = File.open("data/assembly_#{jmeno}.csv").read.split("\n")
    data[:assembly] = file[0].gsub("#"," ").strip #cteni nazvu PS z prvniho radku
    data[:delky] =  file[1].gsub("#"," ").split(",").map{ |x| x.to_i} #cteni delek z druheho radku
    temp =[]
    for i in 2...file.length    #postupne nacitani integrovanych intenzit
        temp += file[i].strip.split(" ").map{ |x| x.to_f}
    end
    data[:intenzity] = temp
    data[:maximum] = data[:intenzity].sum.to_f #vypocet celkove intenzity - jeste pred delenim delkou, tj. soucet integralnich intenzit
    data[:intenzity].each_with_index do |hodnota, index| #vypocet intenzit z integrálních hodnot
        data[:intenzity][index] = hodnota / data[:delky][index] 
    end
    predchozi = 0
    data[:delky].each_with_index do |sirka, index| #uprava delek pro gnuplot pro formu histogramu
        predchozi = data[:delky][index - 1] if index > 0
        data[:delky][index] = sirka + predchozi
    end
    data[:delky] = data[:delky].reverse.drop(1).reverse.unshift(0) #pro histogram - nutno se zbavit posledni hodnoty a zacit od nuly
    data
end

#zapis dat pro gnuplot - axialni profily inzenzity
def zapisDat(jmeno, data) 
    file = File.open("data_gnuplot/data_#{jmeno}.txt", "w")
    data[:intenzity].each_with_index do |intenzita, index|
        file.puts("#{data[:delky][index]} #{intenzita}")
    end
    file.close
end 

#tvorba souboru pro gnuplot a zaroven vykresleni grafu (axialni profily intenzity)
def souborGnuplot(jmeno, data)
    file = File.open("vstup_gnuplot/gnuplot_graf_#{jmeno}.gp", "w")
    file.puts("set terminal png")
    file.puts("set output \'vystupy_gnuplot/assembly_#{jmeno}.png\'")
    file.puts("set title \'Assembly ID #{data[:assembly]} \'") 
    file.puts("set ylabel \'Signal intensity [n/cm]\'")
    file.puts("set xlabel \'Axial coordinate [cm]\'")
    file.puts("y1 = NaN ")
    file.puts("plot \'data_gnuplot/data_#{jmeno}.txt' with steps notitle, \'\' u 1:2 w p pt 7 lc rgb \"blue\" notitle, \'\' u 1:(y0=y1,y1=$2,y0) w p pt 7 lc rgb \"blue\" notitle") #upravit plot, aby to vypadalo
    file.close
    system("gnuplot vstup_gnuplot/gnuplot_graf_#{jmeno}.gp")
end

#tvorba souboru a grafu pro vykresleni 5 profilu s maximalni celkovou aktivitou
def vykreslitmaxima(maximalni_intenzity)
    file = File.open("vstup_gnuplot\/maximum.gp", "w")
        file.puts("set terminal png")
        file.puts("set output \'vystupy_gnuplot/maximum.png\'")
        file.puts("set title \'Maximum\'")
        file.puts("set ylabel \'Signal intensity [n/cm]\'")
        file.puts("set xlabel \'Axial coordinate [cm]\'")
        file.puts("set key outside")
        file.puts("plot \'data_gnuplot/data_#{maximalni_intenzity[0][1]}.txt\' with steps title \"#{maximalni_intenzity[0][2]}\", \'data_gnuplot/data_#{maximalni_intenzity[1][1]}.txt\' with steps title \"#{maximalni_intenzity[1][2]}\",\'data_gnuplot/data_#{maximalni_intenzity[2][1]}.txt\' with steps title \"#{maximalni_intenzity[2][2]}\",\'data_gnuplot/data_#{maximalni_intenzity[3][1]}.txt\' with steps title \"#{maximalni_intenzity[3][2]}\",\'data_gnuplot/data_#{maximalni_intenzity[4][1]}.txt\' with steps title \"#{maximalni_intenzity[4][2]}\"")
    file.close
    system("gnuplot vstup_gnuplot/maximum.gp")
end

maximalni_intenzity = []
# samotny program 
Dir["data/*.csv"].each do |cesta| #cesta uzpusobena pro obdrzena data (slozka data)
    jmeno = cesta.split("_").last.split(".").first #zisk cisla oznacujici soubor
    data = cteniDat(jmeno) 
    zapisDat(jmeno, data)
    souborGnuplot(jmeno, data)
    maximalni_intenzity << [data[:maximum], jmeno, data[:assembly]] #zapis pro vyhodnoceni maximalni celkove aktivity, assembly z duvodu prehlednosti grafu (pro legendu)

end

maximalni_intenzity = maximalni_intenzity.sort.reverse[0...5] #zapis od nejvetsi po nejmensi a prvnich pet hodnot
vykreslitmaxima(maximalni_intenzity)


