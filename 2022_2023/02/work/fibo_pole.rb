N = 10

a = [1, 1]

(N - 2).times do
  a << (a[-2] + a[-1])
end

puts a.inspect
