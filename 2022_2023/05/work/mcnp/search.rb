require "pp"
require "fileutils"

def read_data
  data = {}
  File.foreach("keff.csv") do |line|
    ary = line.strip.split
    r1, r2, k = ary[0].to_i / 64, ary[1].to_i / 64, ary[2].to_f
    data[[r1,r2]] = k
  end
  data
end

def search(r1i, target, data)
  (0...10).each do |r2ia|
    r2ib = r2ia + 1
    r2a, r2b = r2ia * 64, r2ib * 64
    ka = data[[r1i, r2ia]]
    kb = data[[r1i, r2ib]]
    if ka <= target and target <= kb
      return (target - ka) / (kb - ka) * (r2b - r2a) + r2a
    end
  end
  return nil
end

keff = read_data
(0..10).each do |r1i|
  r1 = r1i * 64
  if r2 = search(r1i, 0.97, keff)
    puts "%4d %8.1f" % [r1, r2]
  else
    puts "#{r1} - not found"
  end
end

