table = {}
File.open("helios1.out") do |f|
  line = ""
  line = f.gets until line.strip.start_with?("List name")
  # mam zacatek bloku
  ary = line.strip.split(":")
  list_name = ary[1].strip
  puts list_name
  # hledam konec zahlavi
  line = f.gets until line.strip.empty?
  # nactu hlavicku
  line = f.gets
  headers = line.strip.split
  puts headers.inspect

  headers.each do |h|
    table[h] = []
  end
  puts table.inspect

  line = f.gets
  until line.strip.empty?
    row = line.strip.split
    (0...headers.size).each do |i|
      table[headers[i]] << row[i+1].to_f
    end
    puts table.inspect
    line = f.gets
  end
end

puts table["ab"].inspect






