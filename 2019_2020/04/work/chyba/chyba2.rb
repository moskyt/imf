# vypsat soucet vsech cisel z prvniho sloupce souboru 'data.csv'

x = 0
IO.foreach("data.csv") do |line|
  ary = line.strip.split
  y = ary[1].to_f
  x += y
end
puts x