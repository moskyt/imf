require "erb"
require "ostruct"

def erb(template, filename, locals)
  erb = ERB.new(File.read(template))
  File.open(filename, "w") {|f| f.write erb.result(ErbBinding.new(locals).get_binding)}
end

class ErbBinding < OpenStruct
  def get_binding
    return binding()
  end
end

