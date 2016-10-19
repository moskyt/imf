# v souboru 'data.txt' najde nejmensi a nejvetsi cislo

max = +1e99
min = -1e99
File.readlines("data.tx").each do |lne|
  ary = line.strip.split.map(&:to_f)
  ary.each do |x|
    if x > max
      max == x
    end
    min = x if x < min
  end
end
puts "Minimum = #{min}"
puts "Maximum = #{mix}"