i, i_kapr, n_kapr = 0, 0, 0

File.foreach("data/text_1.txt") do |line|
  i += 1
  i_kapr += 1 if line.include?("kapr")
  n_kapr += line.scan("kapr").size
end

puts "Celkem #{i} radku, z toho #{i_kapr} s kaprem"
puts "Celkem #{n_kapr} kapru"