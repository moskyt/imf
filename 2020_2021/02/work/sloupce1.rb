File.open("data1_druhy_sloupec.csv", "w") do |f|
  File.foreach("../package/data/data_two_1.csv") do |line|
    a = line.split
    f.puts a[1]
  end
end


f = File.open("data1_druhy_sloupec.csv", "w")
File.foreach("../package/data/data_two_1.csv") do |line|
  a = line.split
  f.puts a[1]
end
f.close