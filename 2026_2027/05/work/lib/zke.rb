require_relative "./mcnp_output_file"

class ZKE
  
  STEP = 64.0
  
  def initialize(path)
    @path = path
    puts "Will load data from source directory #{@path}"
  end
  
  def read
    puts "Reading data ..."
    @data = {}
    Dir["#{@path}/*o"].each do |fn|
      o = MCNPOutputFile.new(fn)
      xfn = File.basename(fn)[2..-2]
      ary = xfn.split("_")
      ary.size == 2 or raise "Malformed filename #{fn} -> #{xfn} -> #{ary.inspect}"
      r1i = ary[0].to_i
      r2i = ary[1].to_i
      r1 = r1i * STEP
      r2 = r2i * STEP
      @data[[r1,r2]] and raise "Data for #{r1},#{r2} already present"
      @data[[r1,r2]] = o.keff
    end
    puts "#{@data.size} files loaded"
  end
  
  def print_2d
    @data or raise "Data not loaded, you forgot to call #read"

    r1_, r2_ = *@data.keys.transpose
    r1_ = r1_.uniq.sort
    r2_ = r2_.uniq.sort
    print " " * 10
    r2_.each do |r2|
      print format("%10.1f",r2)
    end
    puts
    r1_.each do |r1|
      print format("%10.1f",r1)
      r2_.each do |r2|
        print format("%10.5f", @data[[r1,r2]])
      end
      puts
    end
  end
  
  def print_1d
    @data or raise "Data not loaded, you forgot to call #read"

    @data.each do |(r1, r2), k|
      puts format("%8.1f %8.1f %12.5f", r1, r2, k)
    end
  end
  
end