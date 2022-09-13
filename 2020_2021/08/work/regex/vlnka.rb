s = File.read("../../package/text/vlnka.txt")
s_ = s.gsub(/\b([A-Za-z]) /, "\\1~")
File.write("s_vlnkou.txt", s_)