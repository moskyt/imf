s = File.read("../package/text/emaily.txt")

emails = {}
s.scan(/([a-z0-9\.]+@([a-z0-9\.]+\.[a-z]{2,10}))/) do |eml|
  email, domain = *eml
  emails[domain] ||= []
  emails[domain] << email
end

File.open("emails_output.txt", "w") do |f|
  emails.keys.sort.each do |domain|
    f.puts domain
    emails[domain].uniq.sort.each do |eml|
      f.puts "  #{eml}"
    end
    f.puts
  end
end









a = [1, 2]
x, y = *a



s = File.read("../package/text/emaily.txt")

emails = {}
s.scan(/([a-z0-9\.]+@([a-z0-9\.]+\.[a-z]{2,10}))/) do |eml|
  email, domain = *eml
  email = eml[0]
  domain = eml[1]
  tld = domain.split(".").last
  emails[tld] ||= {}
  emails[tld][domain] ||= []
  emails[tld][domain] << email
end

File.open("emails_output_tld.txt", "w") do |f|
  emails.keys.sort.each do |tld|
    f.puts "#{tld}"
    emails[tld].keys.sort.each do |domain|
      f.puts "  #{domain}"
      emails[tld][domain].uniq.sort.each do |eml|
        f.puts "    #{eml}"
      end
      f.puts
    end
  end
end
