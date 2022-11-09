n = 0

File.foreach("../package/data/text_1.txt") do |line|
  n += 1
end
puts "Radku celkem:   #{n}"
