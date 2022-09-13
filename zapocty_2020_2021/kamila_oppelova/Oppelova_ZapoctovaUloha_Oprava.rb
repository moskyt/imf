require 'date'

def nactiCSV(path)
    dataHash = {}
    rawData = File.open(path, "r").read.split("\n")
    dataHash["nazev"] = rawData[0].split(",").first.strip.gsub("#","")
    dataHash["unit"]  = rawData[0].split(",").last.strip
    keys = rawData[1].split(";")
    keys[0] = keys[0].gsub("#","")
    rawData = rawData.drop(2)

    date, ary1, ary2, ary3 = [], [], [], []

    dateType = true
    rawData.each do |line|
        d = DateTime.parse(line.split(";")[0]) rescue dateType = false
    end
    rawData.each do |line|

        if dateType
            d = DateTime.parse(line.split(";")[0])
        else
           d = DateTime.strptime(line.split(";")[0], "%m/%d/%Y")
        end
        date << d.strftime('%d.%m.%Y')  
        ary1 << line.split(";")[1].to_f
        ary2 << line.split(";")[2].to_f
        ary3 << line.split(";")[3].to_f
    end
    dataHash[keys[0]] = date
    dataHash[keys[1]] = ary1
    dataHash[keys[2]] = ary2
    dataHash[keys[3]] = ary3
    dataHash
end

def plotGraf(nazev, data)
    file = File.open("grafy/data/#{nazev}.gp", "w")
    file.puts "set terminal png"
    file.puts "set xdata time"
    file.puts "set grid"
    file.puts "set xtics rotate by 45 right"
    file.puts "set timefmt \"%d.%m.%Y\""
    file.puts "set xlabel \'Datum\'"
    file.puts "set ylabel \'Hodnoty\'"
    file.puts "set title \"#{data["nazev"]}, #{data["unit"]}\""
    file.puts "set output \"grafy/#{data["nazev"].split.first + data["unit"].split.last.rjust(2, '0').to_s}.png\""
    file.puts "plot  \'grafy/data/#{nazev}.txt\' using 1:2 title \"Boritá [g/kg]\", \'grafy/data/#{nazev}.txt\' using 1:3 title \"AO [\%]\" , \'grafy/data/#{nazev}.txt\' using 1:4 title \"fha [\%]\""

    #

    file.close
end

def pripravData(nazev, data)
    file = File.open("grafy/data/#{nazev}.txt", "w")
    for i in 0...data["date"].length
        file.puts "#{data["date"][i]} #{data["bc"][i]} #{data["ao"][i]} #{data["fha"][i]}"
    end
    file.close
end

def vytvorPDF()
    last = ""

    file = File.open("doc/vsechno.tex", "w")
    file.puts "\\documentclass{article}"
    file.puts "\\usepackage[utf8]{inputenc}"
    file.puts "\\usepackage{graphicx}"
    file.puts "\\begin{document}"
    Dir["./grafy/*.png"].sort.each do |graf|
        nazev = graf.split("/").last.split(".").first.split(/(\d+)/)
        file.puts "\\section*{#{nazev.first}}" if nazev.first != last
        file.puts "\\subsection*{Unit #{nazev.last}}"
        file.puts "\\begin{figure}[h!]"
        file.puts "\\centering"
        file.puts "\\includegraphics[width=14cm]{#{graf}}"
        file.puts "\\end{figure}"
        file.puts "\\clearpage"
        last = nazev.first
    end
    file.puts "\\end{document}"
    file.close

    system("pdflatex -halt-on-error -quiet -output-directory doc doc/vsechno.tex")
end

Dir.mkdir("grafy") unless Dir.exist?("grafy")
Dir.mkdir("grafy/data") unless Dir.exist?("grafy/data")
Dir.mkdir("doc") unless Dir.exist?("doc")

Dir["./data/*"].each do |path|
    data = nactiCSV(path)
    nazev = path.split("/").last.gsub(".csv","")
    pripravData(nazev, data)
    plotGraf(nazev, data)
    system("gnuplot grafy/data/#{nazev}.gp")
end

vytvorPDF()
