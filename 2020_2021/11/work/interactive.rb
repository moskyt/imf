require "open-uri"
require "json"
require "pp"
require_relative "./erb_compiler"

url = "https://oris.orientacnisporty.cz/API/?format=json&method=getEventList&sport=3&datefrom=2019-01-01&dateto=2019-12-31"
raw_data = URI.open(url).read

data = JSON[raw_data]

markers = []
data["Data"].each do |event_id, event|
  puts "%-16s %s" % [ event["Date"], event["Name"] ]
  if event["GPSLat"].to_f > 0
    puts "%-16s %10s %10s" % [ "", event["GPSLat"], event["GPSLon"] ]
    markers << {
      lat: event["GPSLat"],
      lon: event["GPSLon"],
      date: event["Date"],
      name: event["Name"],
      place: event["Place"],
    }
  end
end

# [ [50,15], [51,16]... ]
# [ {lat: 50, lon: 15, name: "...", date: "..."} ]

erb("mapa.html.erb", "mapa.html", {markers: markers})