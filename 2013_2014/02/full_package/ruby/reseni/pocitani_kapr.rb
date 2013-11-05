n = 0
n_kapr = 0
nn_kapr = 0
IO.foreach("../data/text_1.txt") do |line|
  n += 1
  n_kapr += 1 if line.include?("kapr")
  nn_kapr += line.count("kapr")
end

nn_kapr_bis = IO.read("../data/text_1.txt").count("kapr")

puts "Celkem radku: #{n}"
puts "Radku s kaprem: #{n_kapr}"
puts "Celkem kapru: #{nn_kapr} == #{nn_kapr_bis}"
