filename = "../package/helios1.out"

File.open(filename) do |f|
  
  line = ""
  until line.include?("List name")
    line = f.gets 
    unless line
      puts "End of file!!!"
      exit
    end
  end
  
  list_name = line.split(":").last.strip
  
  puts " => LIST NAME IS [#{list_name}]"
  
  title = ""
  until line.strip.empty?
    line = f.gets
    title += line.split(")")[-1].strip
    title += " "
  end
  title = title.strip
  
  puts " => LIST TITLE IS [#{title}]"
  
  line = f.gets
  columns = line.split
  
  puts " => LIST HAS #{columns.size} COLUMNS: #{columns.join(", ")}"

  data = []
  (0...columns.size).each do |i|
    data[i] = []
  end

  n = 0
  until line.strip.empty?
    line = f.gets
    unless line.strip.empty?
      n += 1
      row = line.split
      (0...columns.size).each do |i|
        data[i] << row[i+1]
      end
    end
  end
  
  puts " => LIST HAS #{n} ROWS"
  
  (0...columns.size).each do |i|
    puts "#{columns[i]}: #{data[i].join(", ")}"
  end
  
end

# LIST TITLE IS [This is a table of some data in many columns and has a long title!]
# LIST HAS 10 COLUMNS: bup, kinf, ab ...
# LIST HAS 23 ROWS
# DATA:
#  bup: 0.00E+00, 0.00E+00, 1.00E+01, 5.00E+01, 1.00E+02, 1.50E+02, 2.50E+02, 5.00E+02, 1.00E+03, 2.00E+03, 3.00E+03, 4.00E+03, 6.00E+03, 8.00E+03, 1.00E+04, 1.20E+04, 1.60E+04, 2.00E+04, 
#  kinf: ......

