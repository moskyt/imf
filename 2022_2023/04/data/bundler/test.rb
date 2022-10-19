require "bundler/setup"
require "rubyXL"

workbook = RubyXL::Workbook.new
worksheet = workbook[0]
worksheet.sheet_name = "Data test"
worksheet.add_cell(0, 0, "A1")
workbook.write("data.xlsx")