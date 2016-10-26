sums = []
File.foreach("data/data_multi_1.csv") do |line|  
  a = line.split
  (0...a.size).each do |i|
    unless sums[i]
      sums[i] = 0.0
    end
    sums[i] += a[i].to_f
  end
end
puts sums.inspect
exit

n = 0
sum_x, sum_y = 0, 0
File.foreach("data/data_two_1.csv") do |line|  
  a = line.split
  x = a[0].to_f 
  y = a[1].to_f
  sum_x += x
  sum_y += y
  n += 1
end
puts "%.2f, %.2f" % [sum_x, sum_y]
avg_x, avg_y = sum_x/n, sum_y/n
puts "%.2f, %.2f" % [avg_x, avg_y]

rms_x, rms_y = 0, 0
File.foreach("data/data_two_1.csv") do |line|  
  a = line.split
  x = a[0].to_f 
  y = a[1].to_f
  rms_x += (x - avg_x) ** 2
end
rms_x = (rms_x / n) ** 0.5
puts rms_x.round(3)

File.open("soucet.csv", "w") do |f|
  File.foreach("data/data_two_1.csv") do |line|  
    a = line.split
    x = a[0].to_f 
    y = a[1].to_f
    f.puts x+y
  end
end