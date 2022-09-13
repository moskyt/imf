require "date"
require "fileutils"
require "yaml"
require_relative "./erb_compiler"

class SampleDatabase

  def initialize(filename)
    @data = {}
    @config = YAML.load(File.read("config.yml")) # setting of units and graphs by using config file
    n = 0
    File.foreach(filename) do |line|
      n += 1
      search_date = line.scan(/\b\d+[-\/]\d+[-\/]\d+|\d+\.\s*\d+\.\s*\d+\b/)[0] # find considered date formats
      id = line.scan(/\b[0-9a-z]{6}\b/)[0]
      pde = line.scan(/\d+\.\d+e[+-]\d+|\d+\.\d+$/)[0]
      # transform date format to YYYY-MM-DD
      if line.scan(/\b\d+\.\s*\d+\.\s*\d+\b/)[0]
        date = Date.parse(search_date).to_s
      elsif line.scan(/\b\d+-\d+-\d+\b/)[0]
        date = Date.strptime(search_date, "%Y-%m-%d").to_s
      elsif line.scan(/\b\d+\/\d+\/\d+\b/)[0]
        date = Date.strptime(search_date, "%m\/%d\/%Y").to_s
      else
         puts "Bad date format for sample #{id}! Line #{n} in #{filename}"
      end
      @data[id] = {} unless @data.has_key?(id)
      @data[id][date] = pde.to_f
    end
    # simply control of data
    @data = sort_by_date(@data)
    @data = check_data_structur(@data)
    @data = check_data_values(@data)
    # calculation of stay duration in lab and total dose
    @data.each do |id, values|
      date = values.keys
      ddays = (Date.parse(date[1]) - Date.parse(date[0])).to_i
      @data[id]["ddays"] = (ddays == 0) ? 1 : ddays # if sample is returned in same day, is considered 1 day in the dose analysis
      dtime = @data[id]["ddays"]
      pde1, pde2 = @data[id][date[0]], @data[id][date[1]]
      @data[id]["sum_dose"] = get_integrate(t1 = 0.0, pde1, dtime, pde2) # total dose -- integration PDE function f(t) from 0 to dtime
    end
  end

  def sort_by_date(data)
    data.each do |id, values|
      data[id] = values.sort_by{|date, pde| date}.to_h
    end
    data
  end

  # control of data records, e.g. sample left store more times or not returned to store
  # print warnings in terminal
  def check_data_structur(data)
    data.each do |id, values|
      count = values.size
      if count.odd? or count > 2
        puts "+%s+" % ["-" * 57]
        puts "|%32s%26s" % ["WARNING", "|"]
        puts "+%s+" % ["-" * 57]
      end
      if count.odd?
        last = values.keys.last
        puts "%s%17s" % ["| Sample #{id} was not returned to store!", "|"]
        puts "%s%30s%8s" % ["| Measured output PDE", "#{dose_unit_text(values[last])}/day in #{last}.", "|"]
        values.delete(last)
        data.delete(id) if values.empty?
        puts "+%s+" % ["-" * 57]
        count = values.size
      end
      # if sample left store more times -- new data record is created for data pair
      # due to using get_integrate method
      correction = {}
      if count > 2
        puts "%s%6s%16s" % ["| Sample #{id} left store more times", "(#{count / 2})!", "|"]
        print "| Original sample name #{id} was renamed to:"
        n = 0
        values.each_slice(2) do |pair|
          n += 1
          correction[id + "_m#{n}"] = pair.to_h
          if n == 1
            puts "%10s%4s " % ["#{id}_m#{n}", "|"]
          else
            puts "|%54s%4s " % ["#{id}_m#{n}", "|"]
          end
        end
        puts "+%s+" % ["-" * 57]
        data = data.merge(correction)
        data.delete(id)
      end
    end
    data
  end

  # PDE of sample should be greater when exiting store
  def check_data_values(data)
    data.each do |id, values|
      out, back = values[values.keys[0]], values[values.keys[1]]
      if back > out
        puts "+%s+" % ["-" * 57]
        puts "|%32s%26s" % ["WARNING", "|"]
        puts "+%s+" % ["-" * 57]
        puts "%s%21s" % ["| Bad data record! -- sample #{id}", "|"]
        puts "%s%15s%22s" % ["| PDE in #{values.keys[0]} --", "#{dose_unit_text(values[values.keys[0]])}/day,", "|"]
        puts "%s%15s%22s" % ["| PDE in #{values.keys[1]} --", "#{dose_unit_text(values[values.keys[1]])}/day.", "|"]
        puts "%s%7s" % ["| Sample #{id} will not include in the analysis!", "|"]
        puts "+%s+" % ["-" * 57]
        data.delete(id)
      end
    end
    data
  end

  # exponential decrease of PDE -- f(t) = a*exp(-b*t)
  # find coeficients a, b and integrate from t1 to t2
  def get_integrate(t1, pde1, t2, pde2)
    b = (Math.log(pde1) - Math.log(pde2)) / (t2 - t1)
    a = (pde1 - pde2) / (Math.exp(-b * t1) - Math.exp(-b * t2))
    (-a / b) * ((Math.exp(-b * t2) - Math.exp(-b * t1)))
  end

  def dose_unit_text(value)
      if @config["dose_unit"] == "mSv"
        return "#{(value).round(0)} mSv"
      elsif @config["dose_unit"] == "Sv"
        return "#{(value / 1000).round(2)} Sv"
       elsif @config["dose_unit"] == nil
         return "#{(value / 1000).round(2)} Sv"
      else
        puts "+%s+" % ["-" * 57]
        puts "%s%19s" % ["| Ivalid unit! Please check config file!", "|"]
        puts "%s%34s" % ["| Dose unit is set to Sv!", "|"]
        puts "+%s+" % ["-" * 57]
        return "#{(value / 1000).round(2)} Sv"
      end
  end

  def dose_unit(value)
    if @config["dose_unit"] == "mSv"
      return value
    else
      return value / 1000
    end
  end

  def min
    minimum = @data.min_by{|key,value| value["sum_dose"]}
    puts "+%s+" % ["-" * 57]
    puts "%s%12s%9s" % ["| Minimum total dose: sample #{minimum[0]} --", "#{dose_unit_text(minimum[1]["sum_dose"])}.", "|"]
    puts "+%s+" % ["-" * 57]
  end

  def max
    maximum = @data.max_by{|key,value| value["sum_dose"]}
    puts "+%s+" % ["-" * 57]
    puts "%s%12s%9s" % ["| Maximum total dose: sample #{maximum[0]} --", "#{dose_unit_text(maximum[1]["sum_dose"])}.", "|"]
    puts "+%s+" % ["-" * 57]
  end

  # print results to csv for gnuplot
  # columns -- 1 sample id; 2 -- stay duration in lab; 3 -- total dose
  def print_csv_results
    FileUtils.mkdir_p("data")
    File.open("data/results.csv", "w") do |f|
      @data.sort_by{|id, values| values["sum_dose"]}.each do |id, values|
        f.puts "%s\t%d\t%.4f" % [id, values["ddays"], dose_unit(values["sum_dose"])]
      end
    end
  end

  # draw a scatter plot by using erb template
  def scatter_plot
    print_csv_results
    FileUtils.mkdir_p(%w(gnuplot plots))
    erb("templates/scatter_plot.gp.erb", "gnuplot/scatter_plot.gp", {:config => @config})
    system("#{@config["path_gnuplot"] || "gnuplot"} gnuplot/scatter_plot.gp")
    puts "Draw a scatter_plot.#{@config["output_format"] || "png"} in plots!"
    FileUtils.rm_rf(%w(gnuplot data))
  end

  # draw a histogram by using erb template
  # histogram types -- histogram_stay; histogram_dose
  # data_column -- 2 -- stay duration in lab; 3 -- total dose
  def histogram(htype, data_column)
    print_csv_results
    if data_column == 2
      var = "ddays"
      unit  = 1
    elsif data_column == 3
      var = "sum_dose"
      if @config["dose_unit"] == "mSv"
        unit = 1
      else
        unit = 1000
      end
    end
    # min_value -- where binning starts; max_value -- where binning ends
    min_value = @data.min_by{|key, values| values[var]}[1][var] / unit
    max_value = @data.max_by{|key, values| values[var]}[1][var] / unit
    FileUtils.mkdir_p(%w(gnuplot plots))
    erb("templates/histogram.gp.erb", "gnuplot/#{htype}.gp", {:config => @config, :column => data_column, :htype => htype, :min => min_value, :max => max_value})
    system("#{@config["path_gnuplot"] || "gnuplot"} gnuplot/#{htype}.gp")
    puts "Draw a #{htype}.#{@config["output_format"] || "png"} in plots!"
    FileUtils.rm_rf(%w(gnuplot data))
  end

end

d = SampleDatabase.new("data.csv")
d.min
d.max
d.scatter_plot
d.histogram("histogram_stay", 2)
d.histogram("histogram_dose", 3)
