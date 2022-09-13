require "ostruct"
require_relative "./erb_compiler.rb"
Encoding.default_internal = Encoding::UTF_8
Encoding.default_external = Encoding::UTF_8

require "open-uri"
require 'net/http'
require 'active_support/core_ext/hash'
require "json"
require "fileutils"

class Array
  def sum
    inject(0.0) { |result, el| result + el }
  end

  def mean 
    sum / size
  end
end

def download(url, local_filename)
  if File.exist?(local_filename)
    raw_data = File.read(local_filename)
	u = JSON[raw_data]
  else
    raw_data_xml = Net::HTTP.get_response(URI.parse(url)).body
	raw_data = Hash.from_xml(raw_data_xml).to_json
	u = JSON[raw_data]
	File.write(local_filename, JSON.pretty_generate(u))
  end
  u
end

time = Time.new.strftime("%d.%m.%Y")	

dirs = ["cache", "processed_data"]
dirs.each do |dir_name|
  FileUtils.mkdir_p(dir_name)
end

activity = {}
max = 0
min = 1e30
range = 0

File.foreach("data.csv") do |line|
	town = line.strip.split(";")[0]
	measurement = line.strip.split(";")[1].to_f
	
	if activity[town] == nil
		activity[town] = {}	
		activity[town]["values"] = []	
		activity[town]["val_av"] = 0	
		activity[town]["date"] = time	
		activity[town]["lat"] = ""	
		activity[town]["lng"] = ""	
		activity[town]["color"] = ""
		activity[town]["simplified"] = town.downcase.encode("ASCII", "UTF-8", fallback: {
			"á" => "a", 
			"é" => "e", 
			"í" => "i", 
			"ý" => "y", 
			"ó" => "o", 
			"ú" => "u", 
			"ů" => "u", 
			"ř" => "r", 
			"ě" => "e", 
			"š" => "s", 
			"č" => "c", 
			"ď" => "d", 
			"ň" => "n", 
			"ť" => "t", 
			"ž" => "z"})
	end
	
	activity[town]["values"] << measurement
	activity[town]["val_av"] = activity[town]["values"].mean.round(3)
	
	val = activity[town]["val_av"]
	
	if val > max
		max = val
	end
	
	if val < min
		min = val
	end
end

range = max-min
end_blue = min + range/3
start_red = max - range/3

data = {}
activity.each do |town, value|
	url = "http://api.mapy.cz/geocode?query=" + value["simplified"] + "&count=1"
	data = download(url, "cache/gps_#{value["simplified"]}.json")
	
	activity[town]["lng"] = data["result"]["point"]["item"]["x"]
	activity[town]["lat"] = data["result"]["point"]["item"]["y"]
	val = activity[town]["val_av"]
	
	if (val < end_blue)
			activity[town]["color"] = "modra"
	elsif (val > start_red)
			activity[town]["color"] = "cervena"
	else 
			activity[town]["color"] = "zluta"
	end
 end
 
 File.write("processed_data/data", JSON.pretty_generate(activity))
 erb("map.html.erb", "map_of_radon.html", {activity: activity})
 

