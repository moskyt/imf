require "fileutils"

def table(csv_fn, tex_fn, col)
  File.open(tex_fn, "w") do |f|
    f.puts "\\begin{tabular}{|l|l|l|l|l|l|}"
    f.puts "\\hline"
    i = 0
    File.foreach(csv_fn) do |line|
      i += 1
      ary = line.strip.split
      f.print "#{ary[0]} & #{ary[col]} "
      if i % 3 == 0
        f.puts " \\\\"
        f.puts "\\hline"
      else
        f.print " & "
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