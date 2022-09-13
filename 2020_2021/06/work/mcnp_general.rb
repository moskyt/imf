require "fileutils"

def extend_control_rods(rods)
  output = {}
  rods.each do |key, value|
    output[key] = value
    output["#{key}x"] = (value - 7.102).round(3)
  end
  output
end

def process(template_fn, output_fn, parameters)
    data = File.read(template_fn)
    parameters.each do |key, value|
      data = data.gsub("%#{key}%", value.to_s)
    end
    File.write(output_fn, data)
end

def build(r1i, r2i)
  r1, r2 = r1i * 6.4, r2i * 6.4
  process(
    "c1.template",
    "inputs/c1_#{r1i}_#{r2i}",
    extend_control_rods({
      "r1" => r1,
      "r2" => r2,
    })
  )
end

FileUtils.mkdir_p("inputs")

(0..10).each do |r1i|
  (0..10).each do |r2i|
    build(r1i, r2i)
  end
end
































# process("c1.template", "c1_test", {"r1" => 99.99})
#
# rods = {"r1" => 10.0, "r2" => 60.0}
# puts rods.inspect
# puts extend_control_rods(rods).inspect
