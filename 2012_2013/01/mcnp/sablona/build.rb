`mkdir -p inputs`
`mkdir -p outputs`

DELTA = 44.8000 - 37.6980

template = IO.read('template')
(0..10).each do |i1|
  (0..10).each do |i2|
    r1 = i1 * 50
    r2 = i2 * 50
    File.open("inputs/c_#{i1}_#{i2}", "w") do |f|
      s = template.sub("%r1%", r1.to_s)
      s = s.sub("%r1_%", (r1 - DELTA).to_s)
      s = s.sub("%r2%", r2.to_s)
      s = s.sub("%r2_%", (r2 - DELTA).to_s)
      f.puts template
    end
  end
end

template = IO.read('template_o')
(0..10).each do |i1|
  (0..10).each do |i2|
    r1 = i1 * 50.0
    r2 = i2 * 50.0
    keff = 0.948 + (r1 * 100 + r2 * r2) / 5000000
    File.open("outputs/c_#{i1}_#{i2}o", "w") do |f|
      f.puts template.sub("%keff%", "%.5f" % keff)
    end
  end
end