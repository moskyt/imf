require 'date'

PATH = "./data.csv" # define your path to data file
GNUPLOT_PATH = "\"gnuplot\"" # define your path to Gnuplot

# ----------BEGIN OF FUNCTIONS----------

def read_date(date)
  case date
  when /(\d{2})\.\s{0,}(\d{2})\.\s{0,}(\d{4})/ # format DD.MM.YYYY nebo DD. MM. YYYY
    date.scan(/(\d{2})\.\s{0,}(\d{2})\.\s{0,}(\d{4})/) do |sep|
      new_date = "#{sep[2]}-#{sep[1]}-#{sep[0]}"
      return new_date
    end
  when /(\d{2})\/(\d{2})\/(\d{4})/
    date.scan(/(\d{2})\/(\d{2})\/(\d{4})/) do |sep|
      new_date = "#{sep[2]}-#{sep[0]}-#{sep[1]}"
      return new_date
    end
  when /(\d{4})\-(\d{2})\-(\d{2})/ # format YYYY-MM-DD
      return date
  else
    puts "ERROR! Neplatny format \"#{date}\" (prijejte format do funkce \"read_date\")"
  end
end # for uniform date format YYYY-MM-DD

def load_data(file)
  data_hash = {}
  File.foreach(file) do |line|
    row = line.scan(/(^\d*.\s*\d*.\s*\d*)\W*(\w{6})\W*(\d*.\w*.\d*)/) do |col|
      unless data_hash.include?(col[1])
        date = []
        dose = []
        date << read_date(col[0])
        dose << col[2].to_f
        data_hash[col[1]] = {dates: date, doses: dose}
      else
        if  Date.parse(read_date(col[0])).mjd < Date.parse(data_hash[col[1]][:dates][0]).mjd
          data_hash[col[1]][:dates].unshift(read_date(col[0]))
          data_hash[col[1]][:doses].unshift(col[2].to_f)
        else
          data_hash[col[1]][:dates] << read_date(col[0])
          data_hash[col[1]][:doses] << col[2].to_f
        end
      end
    end
  end
  return data_hash
end # load data from "data.csv" into "hash" with uniform date format and sort by date

def remove_id(data_hash)
  data = load_data(PATH)
  data.each_key do |id|
    case
    when data[id][:dates].size < 2
      puts "ERROR! Chybejici zapis ID : \"#{id}\" (ID odstraneno!!! - zkontrolujte vstupni soubor \"#{PATH}\")"
      data.delete(id)
    when data[id][:dates].size > 2
      puts "ERROR! Duplicitni ID : \"#{id}\" (ID odstraneno!!! - zkontrolujte vstupni soubor \"#{PATH}\")"
      data.delete(id)
    end
  end
end # remove duplicite or missing ID record from data_hash

def prepare_data(id, day_out, day_back, dose_out, dose_back)
  total_dose_in_lab = 0
  days_in_lab = Date.parse(day_back).mjd - Date.parse(day_out).mjd
  (0...days_in_lab).each do |step|
    day_dose = dose_out * Math.exp( step.to_f / days_in_lab * Math.log( dose_back / dose_out))
    total_dose_in_lab += day_dose
  end
  return [id, days_in_lab, total_dose_in_lab]
end # prepare data for Gnuplot


# -----------END OF FUNCTIONS-----------

# --------------BEGIN MAIN--------------
data_array = []

data = load_data(PATH)
data_new = remove_id(data)

Dir.mkdir('gnuplot') unless Dir.exist?('gnuplot')
Dir.mkdir('graphs') unless Dir.exist?('graphs')
Dir.mkdir('tables') unless Dir.exist?('tables')

data_new.each_key do |id|
  collector = prepare_data(id, data_new[id][:dates][0], data_new[id][:dates][1], data_new[id][:doses][0], data_new[id][:doses][1])
  data_array << collector
end

data_array = data_array.sort_by{|x| x[0]} # make order in ID tag (remove if do not want to have order in histograms)

File.open("./tables/table.csv","w") do |f|
  (0...data_array.size).each do |p|
    f.puts "%-8s %6.1f %24.12f" % [data_array[p][0], data_array[p][1], data_array[p][2]]
  end
end

max_dose = data_array.max_by{|x| x[2]}
min_dose = data_array.min_by{|x| x[2]}
puts "*******************************************************************************************************"
puts "Nejvyssi davka: #{max_dose[2]} mSv, vzorek s ID: #{max_dose[0]}, pocet dni v laboratori: #{max_dose[1]}"
puts "Nejnizsi davka: #{min_dose[2]} mSv, vzorek s ID: #{min_dose[0]}, pocet dni v laboratori: #{min_dose[1]}"
puts "*******************************************************************************************************"

File.open("./gnuplot/doses_gnu.gp","w") do |f|
  f.puts "reset"
  f.puts "set encoding utf8"
  f.puts "set terminal pdfcairo solid size 48cm,12cm font \"Arial,12\" enhanced color"
  f.puts "set key outside center top horizontal"
  f.puts "set format y \"\%2.0t{/Symbol \\264}10^{\%L}\""
  f.puts "set decimalsign \',\'"
  f.puts "set xlabel \"ID vzorku\""
  f.puts "set ylabel \"Celková dávka [mSv]\""
  f.puts "set output \"./graphs/doses_histogram.pdf\""
  f.puts "unset xtics"
  f.puts "set style histogram clustered gap 0"
  f.puts "set style data histogram"
  f.puts "set style fill solid border"
  f.puts "plot \"./tables/table.csv\" using 3 t \"Rozložení celkových dávek\""
end

File.open("./gnuplot/dates_gnu.gp","w") do |f|
  f.puts "reset"
  f.puts "set encoding utf8"
  f.puts "set terminal pdfcairo solid size 48cm,12cm font \"Arial,12\" enhanced color"
  f.puts "set key outside center top horizontal"
  f.puts "set decimalsign \',\'"
  f.puts "set xlabel \"ID vzorku\""
  f.puts "set ylabel \"Počet dní v laboratoři [den]\""
  f.puts "set output \"./graphs/dates_histogram.pdf\""
  f.puts "unset xtics"
  # f.puts "set style histogram clustered gap 0"
  f.puts "set style data histogram"
  f.puts "set style fill solid border"
  f.puts "plot \"./tables/table.csv\" using 2 t \"Rozložení délky pobytu v laboratoři\""
end

File.open("./gnuplot/scatter_plot.gp","w") do |f|
  f.puts "reset"
  f.puts "set encoding utf8"
  f.puts "set terminal pdfcairo solid size 24cm,12cm font \"Arial,12\" enhanced color"
  f.puts "set key outside center top horizontal"
  f.puts "set format y \"\%2.0t{/Symbol \\264}10^{\%L}\""
  f.puts "set decimalsign \',\'"
  f.puts "set xrange [#{data_array.min_by{|x| x[1]}[1] - 1}:#{data_array.max_by{|x| x[1]}[1] + 1}]"
  f.puts "set grid"
  f.puts "set xlabel \"Počet dní v laboratoři [den]\""
  f.puts "set ylabel \"Celková dávka [mSv]\""
  f.puts "set output \"./graphs/scatter_plot.pdf\""
  f.puts "plot \"./tables/table.csv\" using 2:3 t \"Celková dávka jako funkce délky pobytu\""
  f.close
end

Dir["./gnuplot/*.gp"].each do |filename|
    system("#{GNUPLOT_PATH} #{filename}")
end

# ---------------END MAIN---------------
