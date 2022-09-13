require "pp"
require "fileutils"

def read_data
  data = {}
  File.foreach("keff.csv") do |line|
    ary = line.strip.split
    r1, r2, k = ary[0].to_i / 64, ary[1].to_i / 64, ary[2].to_f
    data[[r1,r2]] = k
  end
  data
end

def print_data(data)
  print "%11s" % "keff"
  (0..10).each do |r2i|
    print "%11d" % (r2i * 64)
  end
  puts
  (0..10).each do |r1i|
    print "%11d" % (r1i * 64)
    (0..10).each do |r2i|
      print "%11.4f" % data[[r1i,r2i]]
    end
    puts
  end
end

def print_data_nicer(data)
  print "%11s | " % "keff"
  (0..10).each do |r2i|
    print "%11d" % (r2i * 64)
  end
  puts
  print "-" * 11
  print "-+-"
  print "-" * (11*11)
  puts
  (0..10).each do |r1i|
    print "%11d | " % (r1i * 64)
    (0..10).each do |r2i|
      print "%11.4f" % data[[r1i,r2i]]
    end
    puts
  end
end

def plot_single(r1i, data)
  File.open("plot_#{r1i}.csv", "w") do |f|
    (0..10).each do |r2i|
      f.puts "#{r2i * 64} #{data[[r1i, r2i]]}"
    end
  end
  File.open("plot_#{r1i}.gp", "w") do |f|
    f.puts %{
      set key off
      set terminal png
      set output "plots/plot_#{r1i}.png"
      set xlabel "poloha R2 [mm]"
      set ylabel "keff [-]"
      set title "Koeficient nasobeni pro R1 = #{r1i*64} mm"
      plot "plot_#{r1i}.csv" with linespoints
    }
  end
  puts "Running gnuplot..."
  system("gnuplot plot_#{r1i}.gp")
  puts "-> plot_#{r1i}.png"
  File.delete("plot_#{r1i}.csv")
  File.delete("plot_#{r1i}.gp")
end

def plot_all(data)
  (0..10).each do |r1i|
    File.open("plot_#{r1i}.csv", "w") do |f|
      (0..10).each do |r2i|
        f.puts "#{r2i * 64} #{data[[r1i, r2i]]}"
      end
    end
  end

  File.open("plot_all.gp", "w") do |f|
    f.puts %{
      set key outside
      set terminal png
      set output "plots/plot_all.png"
      set xlabel "poloha R2 [mm]"
      set ylabel "keff [-]"
    }
    f.print "plot "
    (0..10).each do |r1i|
      f.print %{"plot_#{r1i}.csv" with linespoints title "R1=#{r1i*64}" }
      if (r1i == 10)
        f.puts ""
      else
        f.print ", "
      end
    end
  end
  puts "Running gnuplot..."
  system("gnuplot plot_all.gp")
  puts "-> plot_all.png"
  (0..10).each do |r1i|
    File.delete("plot_#{r1i}.csv")
  end
  File.delete("plot_all.gp")
end
keff = read_data

# print_data(keff)
# puts
# print_data_nicer(keff)
# puts

FileUtils.mkdir_p("plots")
(0..10).each do |r1i|
  plot_single(r1i, keff)
end

plot_all(keff)
