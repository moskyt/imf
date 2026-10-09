def rlen 
  (100000 + rand * 100000).to_i
end
  
def gen(f, len)
  d = 0
  (0...len).each do |j|
    t = j / 1e4
    y = Math::sin(t) + 10*d
    d += (rand - 0.5) * 0.001
    f.puts "%10.5e %10.5e" % [t, y]
  end
end

l = rlen
(1..9).each do |i|
  File.open("data#{i}.csv", 'w') { |f| gen(f, l) }
end