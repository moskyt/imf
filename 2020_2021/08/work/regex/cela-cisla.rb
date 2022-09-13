s = File.read("../../package/text/cela-cisla.txt")
ary = s.scan(/\d+/)

# numbers = ary.map do |x|
#   x.to_i
# end

numbers = ary.map(&:to_i)

puts "Pocet cisel: #{numbers.size}"
puts "Nejmensi:    #{numbers.min}"
puts "Nejvetsi:    #{numbers.max}"

