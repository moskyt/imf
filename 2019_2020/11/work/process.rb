require "open-uri"
require "json"
require "fileutils"
require_relative "../package/ruby/erb_compiler.rb"

def download(url, local_filename)
  if File.exist?(local_filename)
    # read data from file
    data = File.read(local_filename)
  else
    # read data from url
    data = open(url).read
    # write data to file
    File.write(local_filename, data)
  end
  data
end

FileUtils.mkdir_p("cache/oris")

(2015..2019).each do |year|
  url = "https://oris.orientacnisporty.cz/API/" + 
    "?format=json&method=getEventList&sport=3" + 
    "&datefrom=#{year}-01-01&dateto=#{year}-12-31"
  raw_data = download(url, "cache/oris/events_#{year}.json")
  data = JSON[raw_data]

  events = {}
  data["Data"].each do |_, event|
    puts event["Name"]
    puts event["Date"]
    puts event["Place"]
    puts
    lat, lng = event["GPSLat"].to_f, event["GPSLon"].to_f
    place = event["Place"]
    if lat > 0 
      events[place] ||= {
        lat: event["GPSLat"],
        lng: event["GPSLon"],
        events: {},
      }
      events[place][:events][event["ID"].to_i] = {
        name: event["Name"],
        date: event["Date"],
      }
    end
  end

  erb("mapa.html.erb", "mapa-#{year}.html", events_and_places: events)
end