File.open("data1_soucet.csv", "w") do |f|
  File.foreach("../package/data/data_two_1.csv") do |line|
    a = line.split
    f.puts("%.5e" % (a[0].to_f + a[1].to_f))
  end
end