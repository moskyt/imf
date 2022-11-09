N = 10

i = 1
j = 1
puts i
puts j

(N - 2).times do
  k = i + j
  puts k
  i = j
  j = k
end
