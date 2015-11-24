def process(source, target, replacements)
  template = IO.read(source)

  replacements.each do |key, value|
    template.gsub!("%#{key}%", value)
  end

  File.write(target, template)
end

def generate(r1, r2)
  process("c1", "inputs/c1_%02d_%02d" % [r1, r2], {
    "r1" => "%7.4f" % (r1 + 37.6),
    "r2" => "%7.4f" % (r2 + 37.6),
    "r1_" => "%7.4f" % (r1 + 37.6 - 7.102),
    "r2_" => "%7.4f" % (r2 + 37.6 - 7.102),
  })
end

(0..10).each do |i1|
  (0..10).each do |i2|
    generate(5 * i1, 5 * i2)
  end
end