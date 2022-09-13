##READING
data_arr = []
File.foreach("data.txt") do |line|
  positions = line.strip.split(" ")
  data_arr << positions
end

##ADDITIONAL ARRAYS
initial_data_arr = data_arr.dup
names_list = data_arr.dup
names_list = names_list.flatten!
names_list = names_list.uniq
names_list.shift

##CREATING MAIN MATRIX
reverse = data_arr[0].reverse
data_arr[0].pop
medium = data_arr[0] + reverse

core = Array.new(2*data_arr.length-1)
core[7] = medium

(1...data_arr.length).each do |i|
  reverse = data_arr[i].reverse
  data_arr[i] = data_arr[i] + Array.new(i+1)
  data_arr[i] = data_arr[i] + reverse
  (0...i-1).each do |j|
    data_arr[i].unshift("*")
  end
  core[data_arr.length+i-1] = data_arr[i]
end

core[core.length-1].unshift("*")
core[core.length-1].unshift("*")

(2...initial_data_arr[0].length).each do |i|
  core[core.length-i][initial_data_arr.length-1] = initial_data_arr[0][i]
  core[core.length-i][core.length-i] = initial_data_arr[0][i]
end

(1...initial_data_arr.length-1).each do |k|
  (1...initial_data_arr[k].length).each do |i|
    if i == 1
      core[core.length-i][initial_data_arr.length+k] = initial_data_arr[k][i]
    else
      core[core.length-i][initial_data_arr.length+k-1] = initial_data_arr[k][i]
    end
  end
end

(0...7).each do |i|
  core[i] = core[14 - i]
end

(0...core.length).each do |i|
  core[i].delete(nil)
  core[i].delete("*")
end

##CREATING YML
require "yaml"

def random_color
  random_color = "%06x" % rand(256*256*256)
end

if(File.file?("config.yml"))
  puts ("config.yml with colors already exists... You can delete it to generate new random colors or change colors manually")
else
  File.open("config.yml","w") do |f|
    f.puts %{Names_FA:}
    (0...names_list.length).each do |i|
      f.puts %{ #{names_list[i].to_s}: #{random_color}}
    end
  end  
end

config = YAML.load(File.read("config.yml"))
config["Names_FA"]
config["text_color"]




##COUNTING SAME FA
amount_hash = {}
(0...names_list.length).each do |i|
  amount_hash[names_list[i]] = 0
  (0...core.length).each do |j|
    amount_hash[names_list[i]] += core[j].count(names_list[i])
  end
end

##DRAWING FUNCTION
def draw_hexagon(f, indent, w, h, config, core, amount_hash, i, j)
  color = config["Names_FA"][core[j][i]]
  f.puts %{<polygon points="#{indent+w*i} #{h/2+1.5*h*j}, #{indent+w*i+w/2} #{1.5*h*j}, #{indent+w*i+w} #{h/2+1.5*h*j}" fill="##{color}" onclick="alert('#{core[j][i]}: #{amount_hash[core[j][i]]} such FA in this core')"/>}
  f.puts %{<line x1="#{indent+w*i}" y1="#{h/2+1.5*h*j}" x2="#{indent+w*i+w/2}" y2="#{1.5*h*j}" stroke="black"/>}
  f.puts %{<line x1="#{indent+w*i+w/2}" y1="#{1.5*h*j}" x2="#{indent+w*i+w}" y2="#{h/2+1.5*h*j}" stroke="black"/>}
  f.puts %{<rect x="#{indent+w*i}" y="#{h/2+1.5*h*j}" width="#{w}" height="#{h}" fill="##{color}" onclick="alert('#{core[j][i]}: #{amount_hash[core[j][i]]} such FA in this core')"/>}
  f.puts %{<text x="#{indent+w*i+w/2}" y="#{h/2+1.5*h*j+0.7*h}" font-size="10" text-anchor="middle" fill="black">#{core[j][i]}</text>}
  f.puts %{<line x1="#{indent+w*i}" y1="#{h/2+1.5*h*j}" x2="#{indent+w*i}" y2="#{h/2+1.5*h*j+h}" stroke="black"/>}
  f.puts %{<line x1="#{indent+w*i+w}" y1="#{h/2+1.5*h*j}" x2="#{indent+w*i+w}" y2="#{h/2+1.5*h*j+h}" stroke="black"/>}
  f.puts %{<polygon points="#{indent+w*i} #{h/2+1.5*h*j+h}, #{indent+w*i+w/2} #{h/2+1.5*h*j+1.5*h}, #{indent+w*i+w} #{h/2+1.5*h*j+h}" fill="##{color}" onclick="alert('#{core[j][i]}: #{amount_hash[core[j][i]]} such FA in this core')" />}
  f.puts %{<line x1="#{indent+w*i}" y1="#{h/2+1.5*h*j+h}" x2="#{indent+w*i+w/2}" y2="#{h/2+1.5*h*j+1.5*h}" stroke="black"/>}
  f.puts %{<line x1="#{indent+w*i+w/2}" y1="#{h/2+1.5*h*j+1.5*h}" x2="#{indent+w*i+w}" y2="#{h/2+1.5*h*j+h}" stroke="black"/>}
end

##DRAWING PROCESS in HTML
w = 38
h = 22
indent_par = [2,7,9]
first_last_central = [0,14,7] 
File.open("VVER1000_cartogram.html","w") do |f|
  f.puts %{<!DOCTYPE html>}
  f.puts %{<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">}
  f.puts %{<body>}
  f.puts %{<br>}
  f.puts %{<svg width="580" height="580" xmlns="http://www.w3.org/2000/svg" version="1.1">}
  first_last_central.each do |j| ## First, Last and Cetnral Line of the Core Matrix
    if j != first_last_central[2]
      indent = indent_par[2]*w/2.to_f
    else
      indent = indent_par[0]*w/2.to_f
    end
    (0...core[j].length).each do |i|
      draw_hexagon(f, indent, w, h, config, core, amount_hash, i, j)
    end
  end
  (1...14).each do |j| ## Middle Part of Core Matrix
    (0...core[j].length).each do |i|
      if j < 7
        indent = (indent_par[1]-j)*w/2.to_f
      elsif j > 7
        indent = (j-indent_par[1])*w/2.to_f
      elsif j == 7
        next
      end
      draw_hexagon(f, indent, w, h, config, core, amount_hash, i, j)
    end
  end
  f.puts %{</svg>}
  f.puts %{</svg><br>}
  f.puts %{</body></html>}
end

if(File.file?("VVER1000_cartogram.html"))
  puts ("Cartogram VVER1000 is in the file VVER1000_cartogram.html in the working directory")
end