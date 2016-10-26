n = 100

(1..n).each do |i|
  prime = true
  
  (2..(i ** 0.5).round).each do |j|
    if i % j == 0
      prime = false
      break
    end
  end
    
  puts i if prime
  
end

