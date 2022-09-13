#require "erb_compiler.rb"
require_relative "../../package/ruby/erb_compiler.rb"

erb("report_simple.tex.erb", "report_simple.tex", {:cycles => [1,2,3,4,5]})
system("pdflatex -interaction=nonstopmode -halt-on-error report_simple.tex 2>&1 > /dev/null")
system("pdflatex -interaction=nonstopmode -halt-on-error report_simple.tex 2>&1 > /dev/null")
