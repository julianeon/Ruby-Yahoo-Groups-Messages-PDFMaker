require_relative "er.rb"

abort "Arguments are required" if ARGV.empty?

book=ARGV.first.dup

arr = File.open(book, 'r'){|file| file.readlines.collect{|line| line}}

prefix=book.sub(/.txt/,'')
book.sub!(/txt/,'tex')

page=""
title=""

arr.each do |x|
   if x.match("Subject:")
      title=x.sub(/Subject:/,'')
      title.sub!(/^[' ']/,'')
      title.capitalize!
      title = '\\section{' + title.chomp + '}'
   end   
   unless x.match(/X-Yahoo-Message-Num:/)
      x.gsub!(/\S{20,}/,'')
      x.gsub!(/=\s/,'')
      x.gsub!(/\[Non-text portions of this message have been removed\]/,'')

      #x.gsub!(/<|>/,'\\vspace*{1.2mm} ')
      x.gsub!(/=[A-Z0-9]+\s/,'')
      x.gsub!(/=[A-Z0-9]+/,'')

      page+=x
   else
      num = x.match(/[0-9]+/).to_s
      (page.split(/From/)[0].nil?)? rage: page=page.split(/From/)[0]
      (page.split(/Do you Yahoo/)[0].nil?)? page: page=page.split(/Do you Yahoo/)[0]
      (page.split(/Do You Yahoo/)[0].nil?)? page: page=page.split(/Do You Yahoo/)[0]
      (page.split(/Yahoo! Groups/)[0].nil?)? page: page=page.split(/Yahoo! Groups/)[0]
      page.gsub!(/<>/,'')
      page.gsub!(/<(.+)>/,'\\textit{'+$1+'}') unless page.match(/<.+>/).nil?
      page.gsub!(/<+|>+/,'') unless page.match(/<+|>+/).nil?

      puts fn=prefix+num+".tex"
      f=File.open(fn, 'w')
      f.puts(title) 
      f.puts(page)
      f.puts("\\newpage")
      f.close
      page=""
   end
end

#system("ruby mtex.rb " + book)
#system("latex " + book)
#system("pdflatex " + book)
#system("open " + prefix + ".pdf")

