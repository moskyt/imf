require 'fileutils'

FileUtils.mkdir_p("plots")
FileUtils.mkdir_p("plots")

Dir["search/*.csv"].each do |fn|
  bfn = File.basename(fn, ".csv")
  File.open(bfn+".p", 'w') do |f|
    f.puts "set terminal png"
    f.puts "set output \"plots/#{bfn}.png\""
    f.puts "plot \"#{fn}\" using 1:2 with linespoints"
  end
  `gnuplot #{bfn}.p`
end