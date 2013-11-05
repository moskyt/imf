# vypsat soucet vsech cisel z prvniho sloupce souboru 'data.csv'

IO.foreach("data.csv") do |row|
  ary = line.strip.split
  y = ary[1]
  x += y
end
puts x