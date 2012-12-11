keffs = {}
Dir["outputs/*o"].each do |filename|
  keff = nil

  IO.foreach(filename) do |line|
    if line.include?("final estimated combined")
      a = line.split("=")
      b = a[1].split
      keff = b[0]
    end
  end

  s = filename.split("_")
  keffs[[s[1].to_i, s[2].to_i]] = keff
end

(0..10).each do |r2|
  print "#{r2*50} "
  (0..10).each do |r1|
    print " #{keffs[[r1,r2]]}"
  end
  puts
end

Dir["outputs/*o"].each do |filename|
  keff = nil

  IO.foreach(filename) do |line|
    if line.include?("final estimated combined")
      a = line.split("=")
      b = a[1].split
      keff = b[0]
    end
  end

  puts "#{filename} #{keff}"
end

Dir["outputs/*o"].each do |filename|
  keff = nil

  IO.foreach(filename) do |line|
    if line.include?("final estimated combined")
      a = line.split("=")
      b = a[1].split
      keff = b[0]
    end
  end

  s = filename.split("_")
  puts "#{s[1].to_i} #{s[2].to_i} #{keff}"
end