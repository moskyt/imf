




File.open("helios2.out") do |f|
  line = ""
  until line.include?("List name")
    line = f.gets
  end
  list_name = line.split(":").last.strip
  puts "List name is <#{list_name}>"
  
  line = f.gets until line.strip.empty?
  
  data = {}
  
  loop do
    headers = f.gets.strip.split
    break if headers.empty?

    headers.each do |h|
      data[h] = []
    end

    line = f.gets
    until line.strip.empty?
      array = line.strip.split
      headers.each_with_index do |header, i|
        data[header] << array[i+1].to_f
      end
      line = f.gets
    end
    puts line.inspect
  end

  
  puts data['kinf'].inspect
  puts data['ab'].inspect
  puts data.keys.inspect
end