File.open("druhy_sloupec.csv", 'w') do |f|
  IO.foreach("../data/data_two_1.csv") do |line|
    f.puts line.strip.split[1]
  end
end

File.open("sectene_sloupce.csv", 'w') do |f|
  IO.foreach("../data/data_two_1.csv") do |line|
    f.puts line.strip.split[0].to_f + line.strip.split[1].to_f
  end
end

x0 = 0
x1 = 0
n = 0
IO.foreach("../data/data_two_1.csv") do |line|
  x0 += line.strip.split[0].to_f
  x1 += line.strip.split[1].to_f
  n += 1
end
puts "Prvni sloupec: soucet #{x0}"
puts "Druhy sloupec: soucet #{x1}"

a0 = x0 / n
a1 = x1 / n

rms0 = 0
rms1 = 1
IO.foreach("../data/data_two_1.csv") do |line|
  rms0 += (line.strip.split[0].to_f - a0) ** 2
  rms1 += (line.strip.split[1].to_f - a1) ** 2
  n += 1
end
rms0 = (rms0 / n) ** 0.5
rms1 = (rms1 / n) ** 0.5
puts "Prvni sloupec: RMS #{rms0}"
puts "Druhy sloupec: RMS #{rms1}"
