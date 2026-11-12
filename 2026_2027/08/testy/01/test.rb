require_relative "lib/mcnp_output_file"

fn = "./c1_1o"

o = MCNPOutputFile.new(fn)

actual = o.keff
expected = 1.00353

if (actual - expected).abs < 1e-7
  puts "OK"
else
  puts "ERROR"
end
