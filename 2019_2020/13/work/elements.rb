require 'csv'

class Table

  def initialize(filename)
    @elements = {}
    data = CSV.read(filename, col_sep: "\t")
    data.each do |table_row|
      z = table_row[0].to_i
      mass = table_row[2].to_f
      name = table_row[3]
      code = table_row[4]
      @elements[code] = {
       z: z,
       mass: mass,
       name: name
      }
    end
  end

  def mass(code)
    @elements[code][:mass]
  end

  def name(code)
    @elements[code][:name]
  end

end

class Compound

  def initialize(formula, table)
    @formula = formula
    @table = table
    r = /([A-Z][a-z]*)([0-9]*)/
    @elements = {}
    formula.scan(r) do |m|
      code = m[0]
      if m[1].empty?
        n = 1
      else
        n = m[1].to_i
      end
      @elements[code] ||= 0
      @elements[code] += n
    end
  end

  def inspect
    "Compound:#{@elements.inspect}"
  end

  def as_text
    list = []
    @elements.each do |code, n|
      list << "#{n} atom#{n > 1 ? "s" : ""} of #{@table.name(code).downcase}"
    end
    list * " + "
  end

  def mass
    m = 0.0
    @elements.each do |code, n|
      m += n * @table.mass(code)
    end
    m.round(4)
  end

  def size
    m = 0
    @elements.each do |code, n|
      m += n
    end
    m
  end

  def to_s
    @formula
  end

end

t = Table.new("../package/elements.csv")

File.foreach("data.txt") do |line|
  formula = line.strip
  c = Compound.new(formula, t)
  puts c
  puts c.size
  puts c.as_text
  puts "M = #{c.mass}"
  puts
end

# puts data[0].inspect
# ["1", nil, "1.008", "Hydrogen", "H", "-259", "-253", "0.09", "0.14", "1776", "1", "1s1", "13.60"]

