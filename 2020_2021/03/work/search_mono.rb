Dir["../package/data/search/*.csv"].each do |fn|
  sign = nil
  y0 = nil
  ok = true
  File.foreach(fn) do |line|
    ary = line.strip.split
    x, y = ary[0].to_f, ary[1].to_f
    if y0
      if y > y0
        this_sign = +1
      else
        this_sign = -1
      end
      if sign
        if sign != this_sign
          ok = false
        end
      end
      sign = this_sign
    end
    y0 = y
  end
  unless ok
    puts File.basename(fn)
  end
end