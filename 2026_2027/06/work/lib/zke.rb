require "rubyXL"
require 'rubyXL/convenience_methods'

require_relative "./mcnp_output_file"

class ZKE
  
  STEP = 64.0
  
  def initialize(path)
    @path = path
    puts "Will load data from source directory #{@path}"
  end
  
  def plot(path)
    # @r1_.each_with_index do |r1, r1i|
    #   plot_keff_r2(r1, format("#{path}/r1_%03d.png", r1.round))
    # end
    plot_composite("#{path}/r1_all.png")
  end
  
  def plot_composite(fn)
    puts "Plotting composite to #{fn}"
    fn_gp = fn.sub(".png", ".gp")
    FileUtils.mkdir_p(File.dirname(fn))

    fn_csv = {}
    
    @r1_.each_with_index do |r1, r1i|
      fn_csv[r1i] = fn.sub(".png", "_#{r1i}.csv")
      File.open(fn_csv[r1i], "w") do |f|
        @r2_.each_with_index do |r2, r2i|
          f.puts "#{r2} #{@data[[r1, r2]]}"
        end
      end
    end
    
    File.open(fn_gp, "w") do |f|
      f.puts "set xlabel \"R2 [cm]\""
      f.puts "set ylabel \"keff [-]\""
      f.puts "set terminal png"
      f.puts "set key on"
      f.puts "set output \"#{fn}\""
      xx = []
      @r1_.each_with_index do |r1, r1i|
        xx << "\"#{fn_csv[r1i]}\" title \"R1=#{r1}\" with linespoints"
      end
      f.puts "plot #{xx * ","}"
    end
    
    puts "Calling gnuplot for #{fn_gp}"
    system("gnuplot #{fn_gp}")
  end
  
  def plot_keff_r2(r1, fn)
    puts "Plotting R1=#{r1} to #{fn}"
    fn_gp = fn.sub(".png", ".gp")
    fn_csv = fn.sub(".png", ".csv")
    FileUtils.mkdir_p(File.dirname(fn))
    
    File.open(fn_csv, "w") do |f|
      @r2_.each_with_index do |r2, r2i|
        f.puts "#{r2} #{@data[[r1, r2]]}"
      end
    end
    
    File.open(fn_gp, "w") do |f|
      f.puts "set title \"R1 = #{r1}\""
      f.puts "set xlabel \"R2 [cm]\""
      f.puts "set ylabel \"keff [-]\""
      f.puts "set terminal png"
      f.puts "set key off"
      f.puts "set output \"#{fn}\""
      f.puts "plot \"#{fn_csv}\" with linespoints"
    end
    
    puts "Calling gnuplot for #{fn_gp}"
    system("gnuplot #{fn_gp}")
  end
  
  def excel(fn)
    workbook = RubyXL::Workbook.new
    worksheet = workbook[0]
    
    worksheet.add_cell(0, 0, "")
    worksheet.sheet_data[0][0].change_fill('ffaa00')  
    @r2_.each_with_index do |r2, r2i|
      worksheet.add_cell(0, r2i+1, r2)
      worksheet.sheet_data[0][r2i+1].change_fill('00aaff')  
      worksheet.sheet_data[0][r2i+1].change_font_bold(true) 
    end
    puts
    @r1_.each_with_index do |r1, r1i|
      worksheet.add_cell(r1i+1, 0, r1)
      worksheet.sheet_data[r1i+1][0].change_fill('00aaff')  
      worksheet.sheet_data[r1i+1][0].change_font_bold(true) 
      @r2_.each_with_index do |r2, r2i|
        worksheet.add_cell(r1i+1, r2i+1, @data[[r1,r2]])
      end
    end
    
    FileUtils.mkdir_p(File.dirname(fn))
    workbook.write(fn)
    puts "Excel export written into #{fn}"
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
    build_indices
  end
  
  def build_indices
    @r1_, @r2_ = *@data.keys.transpose
    @r1_ = @r1_.uniq.sort
    @r2_ = @r2_.uniq.sort  
  end
  
  def print_2d
    @data or raise "Data not loaded, you forgot to call #read"

    print " " * 10
    @r2_.each do |r2|
      print format("%10.1f",r2)
    end
    puts
    @r1_.each do |r1|
      print format("%10.1f",r1)
      @r2_.each do |r2|
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