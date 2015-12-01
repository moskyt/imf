
list = Dir["csv/*.csv"].map do |filename|
  filename.split("_")[1].split(".")[0]
end

list = []
Dir["csv/*.csv"].each do |filename|
  list << filename.split("_")[1].split(".")[0]
end


puts list.inspect




list.each do |cycle|
  lines = IO.readlines("csv/data_#{cycle}.csv")

  data = []
  lines.each do |line|
    data << line.strip.split
  end

  n = (data.size / 3.0).ceil

  [ ["bc", 1], ["ao", 2] ].each do |name, column|

    File.open("#{name}_#{cycle}.tex", "w") do |f|
      (0...n).each do |i|
        (0..2).each do |j|
          row = data[i+j*n]
          if row
            f.print "#{row[0]} & #{row[column]} "
          else
            f.print " -- & -- "
          end
          if j == 2
            f.print "\\\\"
          else
            f.print "& "
          end
        end
        f.puts
      end
    end
  end
end