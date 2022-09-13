"alpha beta gamma".gsub(/([^\s])([^\s]+)/) do |m|
  puts m.inspect
  m
end