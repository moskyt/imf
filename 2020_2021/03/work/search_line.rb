Dir["../package/data/search/*.csv"].each do |fn|
  data = []
  File.foreach(fn) do |line|
    ary = line.strip.split
    x, y = ary[0].to_f, ary[1].to_f
    data << [x, y]
  end

  # y = a*x + b
  a = (data[-1][1] - data[0][1]) / (data[-1][0] - data[0][0])
  b = data[0][1] - a * data[0][0]

  dy = []
  data.each do |x, y|
    dy << (y - (a * x + b))
  end
  dmax = dy.max - dy.min
  davg = 0
  dy.each do |w|
    davg += w.abs
  end
  davg /= dy.size
  if dmax > davg * 100
    puts File.basename(fn)
  end
  # puts "Dmax = #{"%.3f" % dmax} / Davg = #{"%.3f" % davg}"
end