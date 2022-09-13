headers = %w{bup kinf ab ab sf sf sf u235}
puts headers.inspect

(0...headers.size).each do |i|
  n = headers[i+1..-1].count(headers[i])
  if n > 0
    base = headers[i]
    g = 0
    (i...headers.size).each do |j|
      if headers[j] == base
        g += 1
        headers[j] = "#{base}^#{g}"
      end
    end
  end
end

puts headers.inspect