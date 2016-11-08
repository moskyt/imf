(0..10).each do |i1|
  (0..10).each do |i2|
    print keff[[i1,i2]]
  end
end

keff.each do |i1i2, k|
  i1 = i1i2[0]
  i2 = i1i2[1]
end





(0...keff.length)



line = "outputs/c_0_0o 0.94800"

a = line.split
k = a[1].to_f
b = a[0].split("_")

r1i = b[1].to_i
r2i = b[2].to_i

puts "#{r1i} #{r2i} #{k}"
