# v souboru 'data.txt' najde nejmensi a nejvetsi cislo

IO.read_lines("data.txt").each do |line|
  ary = line.strip.split
  ary.each do |x|
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