(1..10).each do |a|
  (1..10).each do |b|
    puts "%2d * %2d = %3d" % [b, a, a * b]
  end
end