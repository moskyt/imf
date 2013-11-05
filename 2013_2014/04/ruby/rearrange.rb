keff = {}
IO.foreach("keff.csv") do |line|
  ary = line.strip.split
  r1, r2, k = ary[0].to_i, ary[1].to_i, ary[2].to_f
  keff[[r1,r2]] = k
end

(0..10).each do |i|
  (0..10).each do |j|
    print "%8.5f" % keff[[i*10, j*10]]
  end
  puts
end