require "open-uri"
require "json"
require "pp"

def get_event_winner(event_id)
  url = "https://oris.orientacnisporty.cz/API/?format=json&method=getEventResults&eventid=#{event_id}"
  raw_data = URI.open(url).read
  data = JSON[raw_data]
  if data["Data"].empty?
    #puts "(no results found for event #{event_id})"
    return nil
  end
  data["Data"].each do |result_id, r|
    if r["ClassDesc"] == "W21E" and r["Place"] == "1."
      return r
    end
  end
  #puts "(did not find winner for event #{event_id})"
  return nil
end

def print_event_list(year)
  url = "https://oris.orientacnisporty.cz/API/?format=json&method=getEventList&sport=3&datefrom=#{year}-01-01&dateto=#{year}-12-31"
  raw_data = URI.open(url).read
  data = JSON[raw_data]

  data["Data"].each do |_id, event|
    if event["GPSLat"].to_f > 0
      if winner = get_event_winner(event["ID"])
        puts "%-16s %50s %8s" % [ event["Date"], event["Name"], event["ID"] ]
        if winner["Name"].strip.empty?
          puts "  (#{winner["RegNo"]})"
        else
          puts "  #{winner["Name"]}"
        end
      end
    end
  end
end

(2015..2019).each do |y|
  puts
  puts y
  puts
  print_event_list(y)
  puts
end