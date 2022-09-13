require "open-uri"
require "json"
require "pp"

url = "https://oris.orientacnisporty.cz/API/?format=json&method=getEventList&sport=3&datefrom=2019-01-01&dateto=2019-12-31"
raw_data = URI.open(url).read

data = JSON[raw_data]

image_url = "https://maps.googleapis.com/maps/api/staticmap?center=50.1,15.4&zoom=7&size=800x600&maptype=roadmap&key=AIzaSyDD3K0yUjHswlPn0PMSjjuuuyJdHph2JDY&markers=color:blue"

data["Data"].each do |event_id, event|
  puts "%-16s %s" % [ event["Date"], event["Name"] ]
  if event["GPSLat"].to_f > 0
    puts "%-16s %10s %10s" % [ "", event["GPSLat"], event["GPSLon"] ]
    image_url << "|#{event["GPSLat"]},#{event["GPSLon"]}"
  end
end

puts
puts image_url