(1..10).each do |y|
  (1..10).each do |x|
    # puts "#{x} * #{y} = #{x*y}"
    print "%2d * %2d = %3d" % [x, y, x*y]
    if x == 5
      puts
    elsif x == 10
      puts
      puts
    else
      print " | "
    end
  end
end