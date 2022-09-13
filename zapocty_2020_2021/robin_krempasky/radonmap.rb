data_file = './inputdata/data.csv'


require 'csv'
require 'open-uri'
require 'rexml/document'
include REXML
require_relative './ruby/erb_compiler'
require 'fileutils'


class RadonMap
  def initialize(data_file)
    @data = {}

    #Reading data
    print "%-50s" % ["Reading data from file #{data_file}..."]
    CSV.foreach(data_file, col_sep: ";") do |row|
      town = row[0]
      ac = row[1].to_f

      if @data.keys.include?(town)
        @data[town] = {
          activity: @data[town][:activity] << ac
        }
      else
        @data[town] = {
          activity: [ac]
        }
      end
    end
    puts "done"

    #Calc average activities
    print "%-50s" % ["Calculating average activities..."]
    @data.each do |key, val|
      sum, n = 0, 0

      @data[key][:activity].each do |ac|
        sum = sum + ac
        n = n + 1
      end
      avg = sum/n
      @data[key][:average] = avg
    end
    puts "done"

    #Donload map data
    print "%-50s" % ["Downloading map data..."]
    @data.each do |key, val|
      url = "http://api.mapy.cz/geocode?query="+URI.encode_www_form_component(key)

      raw_mapdata = URI.open(url).read

      mapdata = Document.new(raw_mapdata)

      @data[key][:lat] = mapdata.root.elements[1].elements[1].attributes["y"]
      @data[key][:lon] = mapdata.root.elements[1].elements[1].attributes["x"]

    end
    puts "done"
    puts "Data initialization done."
  end

  def print_data
    puts "%20s  %-10s %-10s %-10s  %-10s" % ["Town", "Latitude", "Longitude","Avg activity", "Activities"]
    @data.each do |key, val|
      print "%20s: %-10.3f %-10.3f %-14.3f" % [key, @data[key][:lat], @data[key][:lon], @data[key][:average]]

      @data[key][:activity].each do |ac|
        print "%-13s" % [ac]
      end
      puts " "
    end
  end

  def create_markers
    print "%-50s" % ["Creating map markers..."]

    FileUtils.rm_f("img/*")

    max = 0.0
    min = 10000.0
    @data.each do |key, val|
      if @data[key][:average] > max
        max = @data[key][:average]
      end
      if @data[key][:average] < min
        min = @data[key][:average]
      end
    end

    @data.each do |key,val|
      avg = @data[key][:average]
      name = avg.truncate()
      avg_norm = 255*(avg-min)/(max-min)
      erb("ruby/markers.svg.erb", "./img/#{name}.svg", {avg_norm: avg_norm})
    end
    puts "done"
  end

  def create_map
    print "%-50s" % ["Creating map..."]
    erb("ruby/mapa.html.erb", "./output/map.html", {data: @data})
    puts "done"
    puts "Map created: ./output/map.html"
  end

end

map = RadonMap.new(data_file)
#map.print_data
map.create_markers
map.create_map
