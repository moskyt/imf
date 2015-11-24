require 'fileutils'

def gnuplot(cycle, variable, y_title, column)
  template = IO.read("template.gp")

  template.gsub!("{cycle}", cycle.to_s)
  template.gsub!("{variable}", variable.to_s)
  template.gsub!("{y_title}", y_title.to_s)
  template.gsub!("{column}", column.to_s)

  FileUtils.mkdir_p("gp")
  File.write("gp/#{variable}_#{cycle}.gp", template)
  
  system("gnuplot gp/#{variable}_#{cycle}.gp")  
end

def plot(cycle)
  gnuplot(cycle, "bc", "boric acid", 2)
  gnuplot(cycle, "ao", "axial offset", 3)
end

Dir["*.csv"].each do |filename|
  cycle = filename.split(".")[0].split("_")[1]
  plot(cycle)
end
