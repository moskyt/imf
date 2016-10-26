n = 10

p = [1, 1]
n.times do
  p << p[-2] + p[-1]
end

puts p.inspect