sum1, sum2 = 0.0, 0.0
n = 0
File.foreach("../package/data/data_two_1.csv") do |line|
  ary = line.strip.split
  x1, x2 = ary[0].to_f, ary[1].to_f
  sum1 += x1
  sum2 += x2
  n += 1
end
puts "Soucet prvniho sloupce: #{"%.3f" % sum1}"
puts "Soucet druheho sloupce: #{"%.3f" % sum2}"
puts "Prumer druheho sloupce: #{"%.3f" % (sum2 / n)}"

avg2 = sum2 / n
acc = 0
File.foreach("../package/data/data_two_1.csv") do |line|
  ary = line.strip.split
  x1, x2 = ary[0].to_f, ary[1].to_f
  acc += (x2 - avg2) ** 2
end

puts "stredni hodnota (x2 - avg2)^2 :#{"%.3f" % (acc / n)}"

puts "RMS druheho sloupce:    #{"%.3f" % ((acc / n) ** 0.5)}"
