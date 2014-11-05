Dir["*.csv"].each do |fn|
  s = "<table>\n"
  IO.foreach(fn) do |line|
    ary = line.strip.split
    s << "<tr><td>#{ary[0]}</td><td>#{ary[1]}</td></tr>\n"
  end
  s += "</table>\n"
  File.open(fn.gsub(".csv", ".html"), 'w') do |f|
    f.puts s
  end
end