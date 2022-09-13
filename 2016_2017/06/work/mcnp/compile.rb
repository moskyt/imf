def compile(template_filename, output_filename, parameters)
  template = File.read(template_filename)
  parameters.each do |key, value|
    template.gsub!("%#{key}%", value.to_s)
  end
  File.write(output_filename, template)
end

def make_input(i1, i2)
  r1 = 6.4 * i1
  r2 = 6.4 * i2
  compile("c1", "inputs/c1_#{i1}_#{i2}", { 
    "r1"  => r1, 
    "r1_" => r1 - 7.102,
    "r2"  => r2, 
    "r2_" => r2 - 7.102
  })
end

(0..10).each do |i1|
  (0..10).each do |i2|
    make_input(i1, i2)
  end
end