a = 40

File.open("ctverecky.svg", "w") do |f|
  f.puts %{<svg width="#{a*8}" height="#{a*8}" xmlns="http://www.w3.org/2000/svg" version="1.1">"}
  (0...8).each do |i|
    (0...8).each do |j|
      x = i * a + 1
      y = j * a + 1
      tx = i * a + a/2
      ty = j * a + 3 * a / 4
      f.puts %{<rect x="#{x}" y="#{y}" width="#{a - 2}" height="#{a - 2}" fill="#{(i.odd? ^ j.odd?) ? "blue" : "red"}"/>}
      f.puts %{<text x="#{tx}" y="#{ty}" font-size="#{a/2}" text-anchor="middle" fill="white">#{i+1},#{j+1}</text>}
    end
  end
  f.puts "</svg>"
end