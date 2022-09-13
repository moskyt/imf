s = File.read("../package/text/vlnka.txt")
sx = s.gsub(/\b([kszv]) /, "\\1~")
File.write("vlnka_output.txt", sx)

s = File.read("../package/text/desetinna-cisla.txt")
sx = s.gsub(/(\d+)\.(\d+)/) do |m|
  "#{Regexp.last_match[1]},#{Regexp.last_match[2]}"
end
File.write("float_output.txt", sx)
