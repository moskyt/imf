require 'fileutils'

FileUtils.mkdir_p("plots")

def checkAZ(az, nazev)
    # do some check
    firstLine = az[0].length
    az.each do |line|
        puts "Chybný vstup pro AZ s nazvem #{nazev}!" if line.length != firstLine
        return false if line.length != firstLine
    end
    true
end

def plotAZ(az, nazev)

    colorHash = {"F4" => "#8DEEEE", "F6" => "#007FFF", "F8" => "#4c4cff",
                 "R1" => "#00FF00", "R2" => "#008000",
                 "B1" => "#FFFF99", "B2" => "#FFFF00", "B3" => "#999900"
    }

    elementNumber = {"F4" => 0, "F6" => 0, "F8" => 0,
                "R1" => 0, "R2" => 0,
                "B1" => 0, "B2" => 0, "B3" => 0
    }

    file = File.open("plots/#{nazev}.svg", 'w')
    file.puts "<svg width=\"#{az[0].length*80.0 + 100}\" height=\"#{az.length*80.0}\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\">"
    az.each_with_index do |line, yval|
        line.each_with_index do |ps, xval|
            next if ps == "*"

            hashBool = !colorHash.keys.include?(ps)
            colorHash.store(ps,"rgb(#{rand 255},0,#{rand 255})") if hashBool
            elementNumber.store(ps,0) if hashBool

            elementNumber[ps] += 1
            file.puts "<g>"
            file.puts "<rect x=\"#{xval * 80.0}\" y=\"#{yval * 80.0}\" width=\"80.0\" height=\"80.0\" fill=\"#{colorHash[ps]}\" />"
            file.puts "<text x=\"#{xval * 80.0 + 40.0}\" y=\"#{yval * 80.0 + 40.0}\"  text-anchor=\"middle\" font-family=\"Verdana\" font-size=\"20\" fill=\"black\">#{ps}</text>"
            file.puts "<text x=\"#{xval * 80.0 + 40.0}\" y=\"#{yval * 80.0 + 60.0}\"  text-anchor=\"middle\" font-family=\"Verdana\" font-size=\"15\" fill=\"black\">#{elementNumber[ps].to_s.rjust(2, '0')}</text>"
            file.puts "</g>"
        end
    end
    elementNumber.each_with_index do |elem, index|
        file.puts "<text x=\"#{az[0].length*80.0 + 20}\" y=\"#{az.length*80.0 - (elementNumber.length*22 - 22) + index*22}\"  text-anchor=\"left\" font-family=\"Verdana\" font-size=\"20\" fill=\"black\">#{elem[0]}: #{elem[1]}</text>"
    end
       file.puts "</svg>"
    file.close
end

Dir["data/*"].each do |path|
    kartogramAZ = []
    File.open(path, "r").each do |line|
        kartogramAZ << line.strip.split
    end
    checkBool = checkAZ(kartogramAZ, path.split("/").last)
    plotAZ(kartogramAZ, path.split("/").last) if checkBool
end