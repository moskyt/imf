class McnpOutputFile

  def initialize(filename)

    @keff = nil
    File.foreach(filename) do |line|
      if line.include?("final estimated combined")
        a = line.split("=")
        b = a[1].split
        @keff = b[0].to_f
        ... @keff_sigma ..
      end
    end
    @keff

  end

  def keff
    @keff
  end

  def keff_sigma
  end

end

f = McnpOutputFile.new("c1_o")
puts f.keff
puts f.keff_sigma
