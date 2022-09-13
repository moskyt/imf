require "csv"

class Compound

  def initialize(formula, elements)
    # "H3BO3"
    # {"H" => 3, "B" => 1, "O" => 3}
    @formula = formula
    @elements = elements
    @data = {}
    formula.scan(/([A-Z][a-z]*)(\d*)/).each do |match|
      element = match[0]
      count = match[1]
      if count.empty?
        @data[element] = 1
      else
        @data[element] = count.to_i
      end
    end
  end

  def size
    n = 0
    @data.values.each do |i|
      n += i
    end
    n
  end

  def as_text
    list = ""
    @data.each do |e, count|
      unless list.empty?
        list << " + "
      end
      list << "#{count} atom#{count > 1 ? "s" : ""} of #{@elements[e][:name].downcase}"
    end
    list
  end

  def mass
    m = 0.0
    @data.each do |e, count|
      m += count * @elements[e][:mass]
    end
    m
  end

  def inspect
    @data.inspect
  end

  def to_s
    @formula
  end

end

elements = {}
etable = CSV.read("elements.csv", col_sep: "\t")
etable.each do |edata|
  elements[edata[4]] = {
    name: edata[3],
    mass: edata[2].to_f,
    z: edata[0].to_i
  }
end

c = Compound.new("H3BO3", elements)
puts c.size
puts c.as_text
puts c
puts c.inspect
puts "M = #{c.mass}"
puts

c = Compound.new("NaCl", elements)
puts c.size
puts c.as_text
puts c
puts c.inspect
puts "M = #{c.mass}"
puts

