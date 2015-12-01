require './ruby/erb_compiler'

list = Dir["csv/*.csv"].map do |filename|
  filename.split("_")[1].split(".")[0]
end

erb("document.tex.erb", "document.tex", {:cycles => list})