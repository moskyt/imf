(1..10).each do |a|
  (1..10).each do |b|
    print " %2d * %2d = %3d" % [a, b, a*b]
    if b == 5
      puts
    end
  end
  puts
end