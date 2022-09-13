s = File.read("../../package/text/emaily.txt")
list = s.scan(/(\w+@\w+(\.\w+)+)/).uniq

puts "Nalezeno adres: #{list.size}"

db = {}
list.each do |email|
  user, domain = email[0].split("@")
  db[domain] ||= []
  # db[domain] = db[domain] || []
  db[domain] << user
end

db.keys.sort.each do |domain|
  users = db[domain].uniq.sort
  puts "#{domain} [#{users.size}]"
  users.each do |user|
    puts "  #{user}"
  end
end