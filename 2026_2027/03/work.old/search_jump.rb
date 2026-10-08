Dir["../package/data/search/*.csv"].each do |fn|
  y0, y1 = nil, nil
  ok = true
  File.foreach(fn) do |line|
    ary = line.strip.split
    x, y = ary[0].to_f, ary[1].to_f
    if y0 and y1
      delta1 = y1 - y0
      delta2 = y - y1
      if delta1 * delta2 < 0
        ok = false
      end
    end
    y0 = y1
    y1 = y
  end
  unless ok
    puts File.basename(fn)
  end
end