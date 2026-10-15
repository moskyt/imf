require "bundler/setup"
require "rubyXL"

puts "Bundler and rubyXL loaded"

workbook = RubyXL::Workbook.new
worksheet = workbook[0]
worksheet.sheet_name = "Data test"
worksheet.add_cell(0, 0, "A1")
workbook.write("data.xlsx")

puts "XLSX table created"