#require "erb_compiler.rb"
require_relative "./erb_compiler.rb"

[5, 7, 9].each do |velikost|
  erb("nasobilka.txt.erb", "nasobilka_#{velikost}x#{velikost}.txt", {:n => velikost})
end