lips = "Lorem ipsum dolor sit amet, orci nihil pulvinar eu ac ac. Donec leo euismod dui porttitor elementum vestibulum, nulla commodo mauris amet suspendisse tincidunt. Lorem donec aenean elit integer, lacus fringilla malesuada sagittis vehicula porta imperdiet, in in, dui sagittis ac vel in aliquam. Vel odio cras nibh nam, praesent sit laoreet, vitae augue, pharetra mollis, id justo urna vestibulum. Sed lacus metus sollicitudin curabitur condimentum tellus, habitasse sagittis. Pretium eu volutpat lorem eu et sollicitudin, mauris commodo suspendisse purus quis lobortis.
Consequat adipiscing imperdiet proin commodo, montes sociis adipiscing ultricies, arcu maecenas luctus, augue torquent quisque elit vestibulum. Libero metus, ut mus eget, lorem eget, pellentesque dignissim fusce mauris non et eros. Vitae netus, congue blandit fusce odio, sem et faucibus vehicula. In turpis ullamcorper, ut rutrum, pellentesque diam in morbi, urna tincidunt porttitor pede velit praesentium suspendisse. Amet in donec ullamcorper adipiscing erat. Lacus tellus neque in, sed in nulla sed, ac lacinia, leo lacus nunc. Mauris maecenas sociosqu quis vitae dolor pellentesque, dui ut est, placerat integer wisi semper purus mauris. Ut diam odio libero ipsum, luctus sapien mauris semper, erat non sed placeat. Quam arcu convallis lacus pretium enim, erat ac vehicula neque donec, a nunc, posuere et in eros duis. Posuere eros rhoncus sem, quis mollis quis nec et odio.
Ut dolor. Etiam curae curabitur hendrerit dui duis, est maecenas, dolor luctus nascetur arcu adipiscing eget erat, pellentesque facilisi lacinia eget. Morbi hac fermentum odio, blandit ut sit dictum fusce auctor donec, et tempus non tellus et. In et id nulla vivamus scelerisque mi. Risus euismod eget sollicitudin lectus, nisl quam curabitur. Quam molestie, volutpat leo elit quis risus quisque, blandit arcu non suspendisse mollis eget in, metus risus velit luctus iaculis nisl praesent, tellus sit in enim ad quam faucibus. Interdum enim sed aliquet at sociis. Odio amet morbi suspendisse, non sed vel, velit erat cursus aliquam et et vel.
Magna lectus lorem consectetuer sollicitudin, natoque vehicula metus ac nulla diam, mi eu sapien libero, rhoncus erat in nibh. Dolor sed assumenda nec consectetuer pellentesque posuere, est ullamcorper cursus vitae vulputate mi at, placerat nisl magna suspendisse curabitur, tellus tortor a leo elementum sociis, nulla quam quisque nam et elementum lobortis. Pellentesque aenean rerum, ante mattis, aliquam nunc at augue nunc, a ipsum erat proin molestie. Sed nam porta. Lacus malesuada consequat suspendisse dolor, ultrices eu mattis ad scelerisque in orci, a magna auctor ullamcorper phasellus, vel pretium, justo amet dui diam orci. " * 20


File.write("cela-cisla.txt", lips.gsub(" ") do
  if rand < 0.3
    " #{rand(10000)} "
  else
    " "
  end
end)

File.write("desetinna-cisla.txt", lips.gsub(" ") do
  if rand < 0.3
    " #{rand(10000)}.#{rand(10000)} "
  else
    " "
  end
end)


File.write("emaily.txt", lips.gsub(" ") do
  if rand < 0.3
    " #{%w{adam info service eshop filip}.sample}@#{%w{google linux fjfi troja pivo}.sample}.#{%w{cz com org ee de co.uk}.sample} "
  else
    " "
  end
end)