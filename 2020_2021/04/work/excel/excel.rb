#require "bundler/setup"
require "rubyXL"

workbook = RubyXL::Workbook.new
worksheet = workbook[0]

worksheet.sheet_name = "skriptem"

row = 0
File.foreach("../../package/data/data_two_1.csv") do |line|
  ary = line.strip.split
  x, y = ary[0].to_f, ary[1].to_f
  worksheet.add_cell(row, 0, x)
  worksheet.add_cell(row, 1, y)
  worksheet.add_cell(row, 2, x+y)
  row += 1
end

worksheet = workbook.add_worksheet("vzorcem")

row = 0
File.foreach("../../package/data/data_two_1.csv") do |line|
  ary = line.strip.split
  x, y = ary[0].to_f, ary[1].to_f
  worksheet.add_cell(row, 0, x)
  worksheet.add_cell(row, 1, y)
  worksheet.add_cell(row, 2, "", "A#{row+1}+B#{row+1}")
  row += 1
end

workbook.write("data.xlsx")
puts "wrote excel file"

