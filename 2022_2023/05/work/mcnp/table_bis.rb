require "pp"

def read_data
  data = {}
  File.foreach("keff.csv") do |line|
    ary = line.strip.split
    r1, r2, k = ary[0].to_i / 64, ary[1].to_i / 64, ary[2].to_f
    data[[r1,r2]] = k
  end
  data
end

keff = read_data

puts keff[[0,0]]
puts keff[[0,10]]
puts keff[[0,1]]