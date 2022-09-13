File.open("./sloupce_soucet.csv", "w") do |f|
  File.foreach("../package/data/data_two_1.csv") do |line|
    ary = line.strip.split
    f.puts("%.5e" % (ary[0].to_f + ary[1].to_f))
  end
end

puts "Press Enter to continue"
gets