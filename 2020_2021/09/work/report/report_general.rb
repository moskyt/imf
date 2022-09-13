#require "erb_compiler.rb"
require_relative "../../package/ruby/erb_compiler.rb"

erb("report_general.tex.erb", "report_general.tex", {
  :cycles => [1,2,3,4,5],
  :variables => {
    bc: "Kritická koncentrace kyseliny borité",
    ao: "Axiální ofset",
  }
})
system("pdflatex -interaction=nonstopmode -halt-on-error report_general.tex 2>&1 > /dev/null")
system("pdflatex -interaction=nonstopmode -halt-on-error report_general.tex 2>&1 > /dev/null")
