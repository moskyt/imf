require "yaml"

cfg = YAML.load(File.read("az.yml"))

puts cfg.inspect

colors = cfg["colors"]
a = cfg["pitch"]
extra_colors = cfg["extra_colors"]

def tcolor(x)
  r = x[1..2].to_i(16)
  g = x[3..4].to_i(16)
  b = x[5..6].to_i(16)
  if (r*0.299 + g*0.587 + b*0.114) > 150
    "#000000"
  else
    "#ffffff"
  end
end

Dir["../../package/az/??"].each do |cfg|
  base = File.basename(cfg)

  data = []
  File.open(cfg) do |f|
    8.times do
      data << f.gets.strip.split
    end
  end

  puts
  puts base
  puts data.inspect

  File.open("#{base}.svg", "w") do |f|
    f.puts %{<svg width="#{a*8}" height="#{a*8}" xmlns="http://www.w3.org/2000/svg" version="1.1">"}
    (0...8).each do |i|
      (0...8).each do |j|
        e = data[j][i]
        x = i * a + 1
        y = j * a + 1
        tx = i * a + a/2
        ty = j * a + 3 * a / 4

        c = colors[e]
        unless c
          c = extra_colors.shift
          # c = extra_colors[0]
          # extra_colors.delete(c)
          puts "Assigning new color #{c} to element #{e}"
          colors[e] = c
          puts "Updating color hash to #{colors.inspect}"
        end

        f.puts %{<rect x="#{x}" y="#{y}" width="#{a - 2}" height="#{a - 2}" fill="#{c}"/>}
        f.puts %{<text x="#{tx}" y="#{ty}" font-size="20" text-anchor="middle" fill="#{tcolor(c)}">#{e}</text>}
      end
    end
    f.puts "</svg>"
  end
end