require 'erb'

def erb(template, filename, locals = {})
  erb = ERB.new(File.read(template))
  File.open(filename, 'w') {|f| f.write erb.result(ErbBinding.new(locals).get_binding)}
end

class ErbBinding
  def initialize(locals)
    @locals = locals.dup
  end
  def method_missing(x, *args)
    if args.empty? 
      if @locals.has_key?(x)
        @locals[x]
      else
        raise NoMethodError, "Unknown local variable #{x} in the template -- defined locals are #{@locals.keys.inspect}"
      end
    else
      super
    end 
  end
  def get_binding
    return binding()
  end
end  