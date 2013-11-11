require 'date'

l  = (1..5).map{|x| 300 + (rand-0.5)*30}
b0 = (1..5).map{|x| 6.5 + (rand-0.5)*0.5}
aolin = (1..5).map{|x| 0.001 + (rand-0.5)*0.005}
ao0 =   (1..5).map{|x| -4.0 + (rand-0.5)*0.5}
d  = (1..5).map{|x| (35 + (rand-0.5)*10).to_i}

date = Date.civil(1991,5,4)
%w{01 02 03 04 05}.each do |c|
  ci = c.to_i-1
  File.open("data_c#{c}.csv", 'w') do |f|
    (0...l[ci]).each do |n|
      bc = (1 - n/l[ci])*b0[ci] * (1 + (rand-0.5)*0.01)
      ao = (ao0[ci] + n * aolin[ci] + n ** 0.5 * 0.2) * (1 + (rand-0.5)*0.05)
      f.puts "%s %.3f %.3f" % [date.strftime("%m/%d/%Y"), bc, ao]
      date += 1
    end
    date += d[ci]
  end
end