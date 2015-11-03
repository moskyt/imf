def average(data)
  data.inject(:+)/data.size
end

def ok?(filename)
  y = []
  IO.foreach(filename) do |line|
    y << line.strip.split[1].to_f
  end
  dy = (0...y.size-2).map do |i|
    (y[i+1] - y[i]).abs
  end
  dy.max < average(dy) * 3
end

puts ok?("search/data1.csv")
puts ok?("search/data2.csv")
