a, b = 1, 1

20.times do
  c = a + b
  puts a
  a = b
  b = c
end