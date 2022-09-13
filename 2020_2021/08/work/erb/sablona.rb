#require "erb_compiler.rb"
require_relative "./erb_compiler.rb"

erb("mocniny.txt.erb", "mocniny.txt", {:n => 5})
