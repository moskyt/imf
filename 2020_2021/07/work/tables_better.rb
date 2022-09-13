require "fileutils"

def table(csv_fn, tex_fn, col)
  data = []
  File.foreach(csv_fn) do |line|
    ary = line.strip.split
    data << [ary[0], ary[col]]
  end
  n_lines = (data.size / 3.0).ceil
  File.open(tex_fn, "w") do |f|
    f.puts "\\begin{tabular}{|l|l|l|l|l|l|}"
    f.puts "\\hline"
    (0...n_lines).each do |r|
      (0..2).each do |c|
        index = c * n_lines + r
        if index < data.size
          f.print "#{data[index][0]} & #{data[index][1]} "
        else
          f.print " & "
        end
        if c == 2
          f.puts " \\\\"
          f.puts "\\hline"
        else
          f.print " & "
        end
      end
    end
    f.puts "\\end{tabular}"
  end
end

FileUtils.mkdir_p("plots")
Dir["data/*.csv"].each do |csv|
  c = File.basename(csv, ".csv")[5..-1]
  table(csv, "tables/bc_#{c}.tex", 1)
  table(csv, "tables/ao_#{c}.tex", 2)
end