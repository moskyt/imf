require "fileutils"

FileUtils.mkdir_p("doc")

list = []
Dir["data/*.csv"].each do |csv|
  c = File.basename(csv, ".csv")[5..-1]
  list << c
end
list.sort!

File.open("doc/report.tex", "w") do |f|

  f.puts(%{
    \\documentclass[a4paper,twoside,11pt]{article}

    \\usepackage[utf8]{inputenc}
    \\usepackage[OT1]{fontenc}
    \\usepackage[czech]{babel}
    \\usepackage{graphicx}
    \\usepackage[margin=2cm]{geometry}

    \\title{Provozní data JE Třeskoprsky}
    \\author{IMF}
    \\date{2020/2021}

    \\raggedbottom

    \\begin{document}
    \\maketitle
    \\tableofcontents
  })

  f.puts "\\section{Grafy}"

  f.puts "\\subsection{Koncentrace kyseliny borité}"

  list.each do |c|
    f.puts "\\subsubsection{Kampaň #{c}}"
    f.puts
    f.puts "\\includegraphics[width=0.7\\textwidth]{../plots/bc_#{c}}"
    f.puts
  end

  f.puts "\\subsection{Axiální ofset}"

  list.each do |c|
    f.puts "\\subsubsection{Kampaň #{c}}"
    f.puts
    f.puts "\\includegraphics[width=0.7\\textwidth]{../plots/ao_#{c}}"
    f.puts
  end

  f.puts "\\section{Tabulky}"

  f.puts "\\subsection{Koncentrace kyseliny borité}"

  list.each do |c|
    f.puts "\\subsubsection{Kampaň #{c}}"
    f.puts
    f.puts "\\input{../tables/bc_#{c}}"
    f.puts
  end

  f.puts "\\subsection{Axiální ofset}"

  list.each do |c|
    f.puts "\\subsubsection{Kampaň #{c}}"
    f.puts
    f.puts "\\input{../tables/ao_#{c}}"
    f.puts
  end

  f.puts(%{
    \\end{document}
  })

end

Dir.chdir("doc") do
  system("pdflatex report.tex")
  system("pdflatex report.tex")
end
