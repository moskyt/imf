def rlen(b = 10000)
  (b + rand * b).to_i
end

def gen(f, len, timey, n)
  d = 0
  m = 0.1 + rand*2
  (0...len).each do |j|
    t = j / 1e4
    f.print "%12.5e" % t if timey
    n.times do
      y = m + Math::sin(t) + 10*d
      d += (rand - 0.5) * 0.001
      f.print " %12.5e" % y
    end
    f.puts
  end
end

l = rlen
(1..4).each do |i|
  File.open("data_two_#{i}.csv", 'w') { |f| gen(f, l, false, 2) }
  File.open("data_multi_#{i}.csv", 'w') { |f| gen(f, l, true, (3 + rand * 6).to_i) }
end

slova = %w{kapr tykev hruska letadlo strom posed auto degu moloch proutek mrak mlok doudleby mix}
(1..4).each do |i|
  File.open("text_#{i}.txt", 'w') do |f|
    rlen(1000).times do
      rlen(10).times do
        f.print slova.sample
        f.print " "
      end
      f.puts
    end
  end
end
