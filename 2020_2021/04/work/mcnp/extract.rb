keff = nil
File.foreach("../../package/mcnp/c1_1o") do |line|
  if line.include?("final estimated combined")
    a = line.split("=")
    b = a[1].split
    keff = b[0].to_f
  end
end
puts keff