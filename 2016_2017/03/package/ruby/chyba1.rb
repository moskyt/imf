# vypsat nasobilku (na kazdem radku deset soucinu)

(1..10).each do |i|
  (1..10).each do |j|
    print "#{i} * #{j} = #{i*j} "
  end
  puts
end
