# v souboru 'data.txt' najde nejmensi a nejvetsi cislo

max = -1e99
min = +1e99
File.foreach("data.txt") do |line|
  ary = line.strip.split
  ary.each do |a|
    x = a.to_f
    if x > max
      max = x
    end
    if x < min
      min = x
    end
  end
end
puts "Minimum = #{min}"
puts "Maximum = #{max}"