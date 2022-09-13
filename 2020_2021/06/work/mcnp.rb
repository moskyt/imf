require "fileutils"

def process(template_fn, output_fn, parameters)
  ...

  parameters.each do |key, value|
    ...
  end

end

def extend_control_rods(parameters)
  output = {}
  parameters.each do |key, value|
    ...
    output["#{key}x"] = value.....
  end
  output
end

def build(r1i, r2i)
  r1, r2 = r1i * 6.4, r2i * 6.4
  process(
    "c1.template",
    "inputs/c1_#{r1i}_#{r2i}",
    extend_control_rods({
      "r1"  => r1,
      "r2"  => r2,
    })
  )
end

FileUtils.mkdir_p("inputs")

(0..10).each do |r1i|
  (0..10).each do |r2i|
    build(r1i, r2i)
  end
end