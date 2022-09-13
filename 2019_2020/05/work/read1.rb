def fix_headers(headers)
  fixed_headers = headers.dup
  headers.each do |h|
    n = headers.count(h)
    if n > 1
      k = 0
      (0...headers.size).each do |i|
        if headers[i] == h
          k += 1
          fixed_headers[i] = "#{h}^#{k}"
        end
      end
    end
  end
  
  fixed_headers
end

def read_title(f)
  title = ""
  line = f.gets
  title += line
  loop do
    line = f.gets
    break if line.strip.empty?
    title += line
  end
  title
end

def read_block(f)
  data = {}
  line = nil
  
  line = f.gets
  puts line.inspect
  return {} if line.strip.empty?
  headers = line.strip.split
  puts headers.inspect
  fixed_headers = fix_headers(headers)
  puts fixed_headers.inspect
    
  headers.each do |h|
    data[h] = []
  end
  
  loop do
    line = f.gets
    break if line.strip.empty?
    row = line.strip.split
    (0...headers.size).each do |i|
      h = headers[i]
      data[h] << row[i+1].to_f
    end
  end
  
  data
end

File.open("../package/helios/helios3.out") do |f|
  superdata = {}
  loop do
    line = f.gets
    until !line or line.strip.start_with?("List name") do
      line = f.gets
    end
    break unless line
    list_name = line.split(":")[1].strip
    puts "List name", list_name.inspect
    list_title = read_title(f)
    puts "List title", list_title.inspect
  
    data = {}
  
    loop do 
      puts "NEW BLOCK"
      data_block = read_block(f)  
      break if data_block.empty?
      data = data.merge(data_block)
    end

    puts data["kinf"].inspect
    puts data["b10"].inspect
    puts
    puts
    
    superdata[list_name] = data
  end
end