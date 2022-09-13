n, n_s_kaprem, n_kapri = 0, 0, 0

File.foreach("../package/data/text_1.txt") do |line|
  n += 1
  if line.include?("kapr")
    n_s_kaprem += 1
  end
  n_kapri += line.scan("kapr").size
end
puts "Radku celkem:   #{n}"
puts "Radku s kaprem: #{n_s_kaprem}"
puts "Kapri:          #{n_kapri}"