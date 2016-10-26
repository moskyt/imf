Dir["search/*.csv"].each do |filename|
  
  y0 = nil
  dy0 = nil
  bad = false
  
  File.foreach(filename) do |line|
    ary = line.split
    x, y = ary[0].to_f, ary[1].to_f
    if y0
      dy = (y - y0).abs
      if dy0
        if dy > dy0 * 10 or dy < dy0 / 10
          bad = true
        end
      end
    end
    
    dy0 = dy    
    y0 = y
  end
  
  if bad
    puts "#{filename} is bad"
  end
  
end