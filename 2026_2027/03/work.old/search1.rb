Dir["../package/data/search/*.csv"].each do |fn|

  yy = []
  ok = true
  File.foreach(fn) do |line|
    ary = line.strip.split
    x, y = ary[0].to_f, ary[1].to_f
    yy << y
    if yy.size > 2
      delta1 = yy[-2] - yy[-3]
      delta2 = yy[-1] - yy[-2]
      #puts "%10.2f %10.4f %10.4f" % [y, delta1, delta2]
      if delta2.abs > 10 * delta1.abs
        ok = false
      end
    end
  end
  if ok
    puts "DOBRE"
  else
    puts "SPATNE"
  end
end