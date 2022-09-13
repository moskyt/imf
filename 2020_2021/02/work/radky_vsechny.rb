(1..4).each do |i|
  n, n_s_kaprem, n_kapri = 0, 0, 0

  fn = "text_#{i}.txt"
  puts "Soubor #{fn}"
  File.foreach("../package/data/#{fn}") do |line|
    n += 1
    if line.include?("kapr")
      n_s_kaprem += 1
    end
    n_kapri += line.scan("kapr").size
  end
  n_kapri_bis = File.read("../package/data/#{fn}").scan("kapr").size
  puts "Radku celkem:   #{n}"
  puts "Radku s kaprem: #{n_s_kaprem}"
  puts "Kapri:          #{n_kapri}"
  puts "                #{n_kapri_bis}"
  puts
end