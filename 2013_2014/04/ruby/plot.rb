keff = {}
IO.foreach("keff.csv") do |line|
  ary = line.strip.split
  r1, r2, k = ary[0].to_i, ary[1].to_i, ary[2].to_f
  keff[[r1,r2]] = k
end

(0..10).each do |i|
  File.open("r1_#{i*10}.csv", 'w') do |f|
    (0..10).each do |j|
      f.puts "#{j*10} #{keff[[i*10, j*10]]}"
    end
  end
  File.open("r1_#{i*10}.p", 'w') do |f|
    f.puts "set terminal png"
    f.puts "set output \"r1_#{i*10}.png\""
    f.puts "plot \"r1_#{i*10}.csv\" with linespoints"
  end
  system("gnuplot r1_#{i*10}.p")
end