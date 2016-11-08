
ktable = {}
File.open("table.csv", "w") do |f|
  fn, k = *line.split
  a = fn.split("_")
  i1, i2 = a[1].to_i, a[2].to_i
  ktable[[i1,i2]] = k
end

File.open("table2d.csv", "w") do |f|
  (0...10).each do |i2|
    (0...10).each do |i1|
      f.print " %10.4f" % ktable[[i1,i2]]
    end
    f.puts
  end
end

File.open("table2d.csv", "w") do |f|
  f.print "%10s" % ""
  (0...10).each do |i1|
    r1 = i1 * 6.4
    f.print ";%10.1f" % r1
  end
  f.puts
  (0...10).each do |i2|
    r2 = i2 * 6.4
    f.print "%10.1f" % r2
    (0...10).each do |i1|
      r1 = i1 * 6.4
      f.print ";%10.4f" % ktable[[i1,i2]]
    end
    f.puts
  end
end