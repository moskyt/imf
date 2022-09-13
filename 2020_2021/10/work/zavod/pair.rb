require "csv"
require "json"

ages = {}
CSV.read("../../package/json/ages.csv", col_sep: ",").each do |name, age|
  ages[name] = age.to_i
end
puts ages.inspect

times = {}
CSV.read("../../package/json/times.csv", col_sep: ",").each do |name, time|
  mm, ss = time.split(":").map(&:to_i)
  seconds = mm * 60 + ss
  times[name] = [
    time,
    seconds
  ]
end
puts times.inspect

puts

entries = []
ages.keys.each do |name|
  entries << {
    "name" => name,
    "age" => ages[name],
    "year" => 2020 - ages[name],
    "time" => times[name][0],
    "seconds" => times[name][1]
  }
end

entries = entries.sort_by{|e| e["seconds"]}

puts entries.inspect

File.write("entries.json", entries.to_json)