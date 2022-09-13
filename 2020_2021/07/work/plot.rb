require "fileutils"

def plot(csv_fn, png_fn, col, title, ylabel)
  gp_fn = "plot.gp"
  File.write(gp_fn, %{
    set terminal png
    set output "#{png_fn}"
    set nokey
    set title "#{title}"
    set xlabel "datum"
    set ylabel "#{ylabel}"
    set xdata time
    set timefmt "%m/%d/%Y"
    plot "#{csv_fn}" using 1:#{col}
  })
  puts "Running gnuplot #{gp_fn} (#{csv_fn} -> #{png_fn})"
  system("gnuplot #{gp_fn}")
  File.delete(gp_fn)
end

FileUtils.mkdir_p("plots")
Dir["data/*.csv"].each do |csv|
  c = File.basename(csv, ".csv")[5..-1]
  plot(csv, "plots/bc_#{c}.png", 2, "Kriticka koncentrace kyseliny borite pro #{c}", "H3BO3 [g/kg]")
  plot(csv, "plots/ao_#{c}.png", 3, "Axialni ofset pro #{c}", "AO [%]")
end