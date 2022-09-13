require "ostruct"
require_relative "./erb_compiler.rb"
system('mkdir out')
erb("template.gp.erb", "template.gp",{})

system('gnuplot "template.gp"')
