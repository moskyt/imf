require "bundler/setup"
require "rubyXL"

workbook = RubyXL::Workbook.new
worksheet = workbook[0]
worksheet.add_cell(0, 0, "A1")
workbook.write("data.xlsx")
puts "Vytvorena tabulka"