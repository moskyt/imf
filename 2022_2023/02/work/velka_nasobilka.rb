(1..10).each do |y|
  (1..20).each do |x|
    # puts "#{x} * #{y} = #{x*y}"
    print "%2d * %2d = %3d" % [x, y, x*y]
    if x % 5 == 0
      puts
    elsif x < 20
      print " | "
    end
  end
  puts
end