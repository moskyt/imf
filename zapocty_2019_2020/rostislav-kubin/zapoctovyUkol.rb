# nejprve si načtu data ze složky a postupně je budu zpracovávat
#path = "data/assembly_003.csv"

#vytvořím složku na data
system("mkdir data_gnuplot")
system("mkdir skripty_gnuplot")
system("mkdir output")

# funkce pro nacteni souboru
def nactiSoubor(path)
    File.readlines(path).map { |str| str.split(" ")}        #nacitam si soubor a generuji 2D pole jeho obsahu
end

#funkce pro tvorbu gnuplot skriptu
def zapisGpFile(nazev, nactenySoubor)
    file = File.open("skripty_gnuplot\/generuj_obrazek_#{nazev}.gp", "w")
        file.puts("set terminal png")
        file.puts("set title \'Assembly ID #{nactenySoubor[0][1]}\'")
        file.puts("set key autotitle columnhead")
        file.puts("set xlabel \'axial coordinate [cm]\'")
        file.puts("set ylabel \'signal intensity [n/cm]\'")
        file.puts("set output \"output/assembly_#{nazev}.png\"")
        file.puts("y1=NaN")
        file.puts("plot  \'data_gnuplot/#{nazev}.txt\' with steps notitle, \'\' u 1:2 w p pt 7 lc rgb \"red\" notitle, \'\' u 1:(y0=y1,y1=$2,y0) w p pt 7 lc rgb \"red\" notitle")
    file.close
end

#zapis do souboru dat
def zapisData(nactenySoubor,nazev)
    pocetNodu = nactenySoubor[1].length - 1                     #pocet nodu je mensi o 1 právě kvůli tomu hashtagu
    delkaSouboru = nactenySoubor.length

    # nyní si potřebuji sesypat data ze zbytku nacteneho pole do úhledné formy pro intenzity
    vystupniDataHodnot = []
    index = 1

    for i in 2...delkaSouboru
        delkaRadku = nactenySoubor[i].length                    #delka nacteneho radku
            for j in 0...delkaRadku
                vystupniDataHodnot.push(nactenySoubor[i][j].to_f / nactenySoubor[1][index].to_f)   #tvorim si pole dat pro grafy a napocitavam si intenzity
                index += 1
            end
    end

    # nyní si připravím x souřadnice pro graf
    xAxis = []
    xAxis[0] = 0

    for i in 0...(pocetNodu - 1)
        xAxis[i+1] = nactenySoubor[1][i+1].to_i + xAxis[i].to_i
    end

    # zapis samotnéhop datového souboru o 2 sloupcích
    file = File.open("data_gnuplot/#{nazev}.txt", "w")
        file.puts "#{nactenySoubor[0][1]}"
        for i in 0...xAxis.length
            file.puts "#{xAxis[i]} #{vystupniDataHodnot[i]}"
        end
    file.close
end

def zjistiMaximum(nactenySoubor,nazev,maximalniIntenzity)
    delkaSouboru = nactenySoubor.length
    celkováIntenzita = 0

    #pocitam si maximální intenzity
    for i in 2...delkaSouboru
        delkaRadku = nactenySoubor[i].length                    #delka nacteneho radku
            for j in 0...delkaRadku
                celkováIntenzita = celkováIntenzita + nactenySoubor[i][j].to_f
            end
    end
    #zde si budu porovnávat poslední pozici v poli, které budu udržovat sestupně seřazené, takže nejmenší intenzita bude vždy na poslední pozici
    if(celkováIntenzita > maximalniIntenzity[4][1].to_f)
        maximalniIntenzity[4][0] = nazev
        maximalniIntenzity[4][1] = celkováIntenzita
        maximalniIntenzity = maximalniIntenzity.sort_by(&:last).reverse
    end
    maximalniIntenzity
end

def vykresli5Intenzit(maximalniIntenzity)
    file = File.open("skripty_gnuplot\/generuj_obrazek_maxima.gp", "w")
        file.puts("set terminal png")
        file.puts("set title \'Maximum\'")
        file.puts("set key outside")
        file.puts("set key autotitle columnhead")
        file.puts("set xlabel \'axial coordinate [cm]\'")
        file.puts("set ylabel \'signal intensity [n/cm]\'")
        file.puts("set output \"output/maximum.png\"")
        file.puts("plot \'data_gnuplot/#{maximalniIntenzity[0][0]}.txt\' with steps, \'data_gnuplot/#{maximalniIntenzity[1][0]}.txt\' with steps,\'data_gnuplot/#{maximalniIntenzity[2][0]}.txt\' with steps,\'data_gnuplot/#{maximalniIntenzity[3][0]}.txt\' with steps,\'data_gnuplot/#{maximalniIntenzity[4][0]}.txt\' with steps")
    file.close
    system("gnuplot skripty_gnuplot/generuj_obrazek_maxima.gp")
end


maximalniIntenzity = [[0,0],[0,0],[0,0],[0,0],[0,0]]                    #chceme 5 maxim, tak si vytvořím pole pro 5 hodnot, na první pozici bude ID a na druhé intenzita
Dir["data/assembly*.csv"].each do |path|
    nazev = path.split("\/")[1].split("_")[1].split(".")[0]
    nactenySoubor = nactiSoubor(path)
    maximalniIntenzity = zjistiMaximum(nactenySoubor,nazev,maximalniIntenzity)              #mám zde 2D pole 5 nejvetších intenzit s ID
    zapisData(nactenySoubor, nazev)
    zapisGpFile(nazev, nactenySoubor)
    system("gnuplot skripty_gnuplot/generuj_obrazek_#{nazev}.gp")
end

vykresli5Intenzit(maximalniIntenzity)
