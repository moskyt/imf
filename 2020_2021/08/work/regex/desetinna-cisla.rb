s = File.read("../../package/text/desetinna-cisla.txt")
s_ = s.gsub(/(\d+)\.(\d+)/, "\\1,\\2")
File.write("s_carkou.txt", s_)