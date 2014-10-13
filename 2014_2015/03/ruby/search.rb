X = 0.4

Dir["../package/search/*.csv"].each do |fn|
  x, y = [], []
  IO.foreach(fn) do |line|
    x << line.strip.split[ 0].to_f
    y << line.strip.split[-1].to_f
  end
  dy = (1...y.size).map{|i| (y[i]-y[i-1]) / (x[i]-x[i-1])}
  
  delta1 = (dy.max-dy.min) / dy.min
  delta2 = (dy[-1]-dy[0]) / dy[0]
  
  if delta1.abs > X or delta2.abs > X
    puts "#{File.basename fn} #{dy.min} #{dy.max} #{delta1} #{delta2}"
  end
end

puts " ----"

Dir["../package/search/*.csv"].each do |fn|
  xx, yy = [], []
  IO.foreach(fn) do |line|
    ary = line.strip.split.map(&:to_f)
    xx << ary[0]
    yy << ary[1]    
  end
  n = xx.size / 2
  
  xnum1, ynum1, den1 = 0, 0, 0
  (0...n).each do |i|
    xnum1 += xx[i]
    ynum1 += yy[i]
    den1 += 1
  end
  xnum2, ynum2, den2 = 0, 0, 0
  (n...xx.size).each do |i|
    xnum2 += xx[i]
    ynum2 += yy[i]
    den2 += 1
  end
  
  xavg1 = xnum1/den1
  yavg1 = ynum1/den1
  xavg2 = xnum2/den2
  yavg2 = ynum2/den2
  
  a = (yavg2 - yavg1) / (xavg2 - xavg1)
  
  y2 = []
  (0...xx.size).each do |i|
    y2 << yy[i] - a*xx[i]
  end

  puts File::basename(fn) if y2.max - y2.min > 1.0
  
end