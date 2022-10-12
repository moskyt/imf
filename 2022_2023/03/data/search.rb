require 'fileutils'

FileUtils.mkdir_p("search")

nfaults = (1..100).to_a.sample(5)

(1..100).each do |fi|
  File.open("search/data#{fi}.csv", 'w') do |f|
    m = (300 + rand(300))
    a, b = rand - 0.5, rand - 0.5
    ifault = (0...m).to_a.sample
    (0...m).each do |i|
      x = i + rand * 0.1
      y = a * x + b
      if nfaults.include?(fi) and i == ifault
        y *= 2 + rand
      end
      f.puts "%12.4e %12.4e" % [x, y]
    end
  end
end

FileUtils.mkdir_p("search2")

nfaults = (1..100).to_a.sample(5)

(1..100).each do |fi|
  File.open("search2/data%03d.csv" % fi, 'w') do |f|
    m = (300 + rand(300))
    a, b = rand - 0.5, rand - 0.5
    a *= 3 + rand(10)
    b *= 3 + rand(10)
    s = a * m * 1e-2
    ifault = (0...m).to_a.sample
    (0...m).each do |i|
      x = i + rand * 0.1
      y = a * x + b
      if nfaults.include?(fi) and i == ifault
        y *= 2 + rand
      else
        y += s * (rand - 0.5)
      end
      f.puts "%12.4e %12.4e" % [x, y]
    end
  end
end
