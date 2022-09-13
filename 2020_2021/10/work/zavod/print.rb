require "json"

entries = JSON[File.read("entries.json")]

entries.each do |e|
  puts "%-40s (%4d) %10s" % [e["name"], e["year"], e["time"]]
end