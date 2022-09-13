s = File.read("../package/text/cela-cisla.txt")
min = 1e99
max = -1e99
n = 0
s.scan(/\d+/) do |x|
  x = x.to_i
  n += 1
  max = x if x > max
  min = x if x < min
end
puts "N #{n} MIN #{min} MAX #{max}"




s = File.read("../package/text/cela-cisla.txt")
nums = s.scan(/\d+/).map(&:to_i)
puts "N #{nums.size} MIN #{nums.min} MAX #{nums.max}"
