(1..10).each do |y|
  (1..10).each do |x|
    print "%2d * %2d = %3d   " % [x, y, x*y]
  end
  puts
end