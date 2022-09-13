require 'fileutils'

#Parameters
plt_size = [800,600]
plt_type = "png"
plt_key = "top right"

input_dir = "data"
output_dir = "out"
#

error = 0
begin

plt = File.open('plot.gp', 'w')
plt.puts "set terminal #{plt_type} size #{plt_size[0]},#{plt_size[1]}"
plt.puts "set key #{plt_key}"
plt.puts "set title noenhanced"
files_number = 0
Dir["#{input_dir}/*"].each do |file|
    files_number += 1
    name = file.split(/[\/.]/)[1]
    heading = []
    data = File.open(file,'r')
    line = data.readline
    while(line[0] == "#") do
      heading << line
      line = data.readline
    end
    data.close()
    (label,xdesc,ydesc)=[name,"",""]
    column_desc=""
    heading.each do |text|
      if (text.include? ":")
        (variable, value) = text.split(':')
        value = value.strip
        if (variable.strip == "x")
          xdesc = value
        elsif (variable.strip == "y")
          ydesc = value
        else
          label = value
        end
      else
        column_desc=text[1..-1].strip
      end
    end
    columns = column_desc.split(" ")
    time = columns.index('time')+1
    plt.puts "set output \"#{output_dir}/#{name}.png\""
    plt.puts "set title \"#{label}\""
    plt.puts "set xlabel \"#{xdesc}\"" 
    plt.puts "set ylabel \"#{ydesc}\""
    command = "plot"
    second=0
    (1..columns.count).each do |column|
      if column != time
        if second ==1
          command += ","
        end
        command += " '#{file}' using #{time}:#{column} title '#{columns[column-1]}'"
        second =1
      end
    end
    plt.puts command

end
plt.close()
puts "#{files_number} files opened and sent to be plotted"
FileUtils.mkdir_p output_dir

system('gnuplot "plot.gp"')
plots_number = Dir[File.join(output_dir, '**', '*')].count { |file| File.file?(file) }
puts "#{plots_number} plots created into directory \"#{output_dir}\"."
if not plots_number == files_number
  error = 1
end
File.delete("plot.gp")

rescue
  error = 1
end

if error ==0
  if files_number ==0
    puts "No files found in directory \"#{input_dir}\". Are you sure it is \n -not empty \n -with necessary rights \n -not named improperly?"
  else
  puts "Program executed normally."
  end
else
  puts "An error occured."
end
