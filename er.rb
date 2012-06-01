def texstart(path)
   f=File.open(path,'w')
   f.puts("\\documentclass{article}")
   f.puts("\\begin{document}")
   f.puts("\\large")
   f.puts("\\makeatletter")
   f.puts("  \\renewcommand\\l@section{\\@dottedtocline{2}{1.5em}{3em}}")
   f.puts("\\makeatother")
   f.puts("\\tableofcontents")
   f.close
end

def texput(path,line)
   f=File.open(path,'a')
   f.puts(line)
   f.close
end

def texend(path)
   f=File.open(path,'a')
   f.puts("\\end{document}")
   f.close
end

