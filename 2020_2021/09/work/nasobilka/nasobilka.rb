#require "erb_compiler.rb"
require_relative "./erb_compiler.rb"

[5, 7, 9].each do |velikost|
  puts "Building table #{velikost}"
  fn = "nasobilka_#{velikost}x#{velikost}"
  erb("nasobilka.tex.erb", "#{fn}.tex", {:n => velikost})
  puts "Running LaTeX twice"
  system("pdflatex -halt-on-error #{fn}.tex 2>&1 > /dev/null")
  system("pdflatex -halt-on-error #{fn}.tex 2>&1 > /dev/null")
  if File.exist?("#{fn}.pdf")
    puts " -> PDF file #{fn}.pdf generated"
  else
    puts " !!! LaTeX failed, check #{fn}.log for errors."
  end
end