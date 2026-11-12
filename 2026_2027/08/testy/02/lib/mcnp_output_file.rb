class MCNPOutputFile

  attr_reader :keff, :keff_error
  
  def initialize(filename)
    @filename = filename
    read
  end
  
  def read
    File.foreach(@filename) do |line|
      if line.include?("the final estimated combined collision/absorption/track-length")
        a, b = line.split("=")
        ary = b.split
        @keff = ary[0].to_f
        @keff_error = ary[-2].to_f
        break
      end      
    end
  end
  
end
