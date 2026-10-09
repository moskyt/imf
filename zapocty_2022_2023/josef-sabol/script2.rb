require 'open-uri'
require "json"

# hash, do kterého se mi uloží vše z CSV tabulky
data = {}

# definice pomocných proměnných
pom = {}
url = "https://nominatim.openstreetmap.org/search?"
pom["format"] = "json"

# načtu všechna data postupně z CSVéčka do hashe
File.foreach("data.csv") do |line|
  row = line.strip.split(";")
  name = row[0]
  # postupně vytvářím nové sloty do hashe podle jména města
  data[name] = data[name] || []
  # k městu si přiřadím pole a do prvního slotu uložím dvojpole se souřadnicemi, které načtu z API endpointu
  # aby se mi souřadnice nedublovali, ošetřím podmínkou, že se souřadnice přidají pouze ve chvíli, kdy k městu nemám nic přiřazeno, tj. size == 0
  if data[name].size == 0
    pom["q"] = name.downcase
    file = URI.open(url+URI.encode_www_form(pom)).read
    parsed_file = JSON.parse(file)[0]
    # teď tedy do prvního slotu přidám dvojpole se souřadnicemi
    data[name] << [
      parsed_file['lon'].to_s,
      parsed_file['lat'].to_s
    ]
  end

  date = row[2].strip.split("-")
  # Nyní si do druhého slotu přidám aktivitu radonu a datum měření
  # nejdřív pouze pro případ, že město ještě žádné měření neobsahuje, tj. size == 1 (obsahuje pouze souřadnice)
  if data[name].size == 1
    data[name] << [
      row[1].to_f.round(2),
      date[2].to_i.to_s + ". " + date[1].to_i.to_s + ". " + date[0].to_i.to_s, # trošku si pohraju s formátem datumu :)
      1 # pomocná veličina, která mi určuje počet měření
    ]
  # teď pro případy, že město už nějaké měření obsahuje
  # pouze zaktualizuju stávající hodnoty
  # celé by to mělo fungovat pro neomezený počet měření v libovolném městě, snad :)
  else
    # zaktualizuju pomocnou veličinu určující počet měření
    data[name][1][2] += 1
    # vytvořím novou aktivitu postupným průměrováním
    # na první pohled dlouhý, ale nedělám nic jiného než že si s pomocnou veličinou roznásobuju a dělím předešlé hodnoty
    data[name][1][0] = (((data[name][1][2] - 1) * data[name][1][0] + row[1].to_f) / data[name][1][2]).round(2)
    # zaktualizuju datum měření
    # ponechám původní datum a přidám nové
    data[name][1][1] += ", " + date[2].to_i.to_s + ". " + date[1].to_i.to_s + ". " + date[0].to_i.to_s
  end
end

# tím by byl vstupní hash hotový, ještě si vytvořím hranici nejnižší a nejvyšší aktivity
# stačí mi pouze značky, markery k nim přiřadím až na mapce
# mohl jsem to sice dělat průběžně, ale zase jsem to nechtěl komplikovat kvůli tomu postupnému průměrování v případě vícero měření
minimax = [data.first[1][1][0].to_f, data.first[1][1][0].to_f]
data.each do |town|
  if town[1][1][0].to_f < minimax[0]
    minimax[0] = town[1][1][0].to_f
  elsif town[1][1][0].to_f > minimax[1]
    minimax[1] = town[1][1][0].to_f
  end
end

require_relative "erb_compiler.rb"
erb("mapa.html.erb", "mapa.html", {data: data, minimax: minimax})
