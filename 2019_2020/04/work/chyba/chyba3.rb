# v souboru 'data.txt' najde nejmensi a nejvetsi cislo

min, max = 1e99, -1e99

File.readlines("data.txt").each do |line|
  ary = line.strip.split
  ary.each do |x|
    x = x.to_f
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