N = 10

i, j = 1, 1
puts i
puts j

(N - 2).times do
  k = i + j
  puts "#{i} + #{j} = #{k}"
  i, j = j, k
end
