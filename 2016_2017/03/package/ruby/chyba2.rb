# vypsat soucet vsech cisel z prvniho sloupce souboru 'data.csv'

x = 0.0
File.foreach("data.csv") do |row|
  ary = row.strip.split
  y = ary[0].to_f
  x = x + y
end
puts x