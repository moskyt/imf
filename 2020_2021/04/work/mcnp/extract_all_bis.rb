def get_keff(filename)
  keff = nil
  File.foreach(filename) do |line|
    if line.include?("final estimated combined")
      a = line.split("=")
      b = a[1].split
      keff = b[0].to_f
    end
  end
  keff
end

def get_rods(filename)
  a = File.basename(filename).split("_")
  r1 = a[1].to_i * 64
  r2 = a[2].to_i * 64
  [r1, r2]
end

Dir["../../package/mcnp/many_outputs/*"].sort.each do |fn|
  r1, r2 = get_rods(fn)
  puts "%4d %4d %12.5f" % [r1, r2, get_keff(fn)]
end