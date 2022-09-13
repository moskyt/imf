require 'fileutils'

FileUtils.mkdir_p("search")

nfaults = 5

(1..100).each do |i|
  File.open("search/data#{i}.csv", 'w') do |f|
    m = (300 + rand(300))
    a, b = rand - 0.5, rand - 0.5
    (0...m).each do |i|
      x = i + rand * 0.1
      y = a * x + b
      if nfaults > 0 and rand < 0.0001
        nfaults -= 1
        y *= 2 + rand
      end
      f.puts "%12.4e %12.4e" % [x, y]
    end
  end
end
puts nfaults