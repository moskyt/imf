# vypsat soucet vsech cisel z prvniho sloupce souboru 'data.csv'

File.foreach("data.csv") do |row|
  ary = row.split.strip
  y = ary[1].to_f
  x = x + y
end
puts x