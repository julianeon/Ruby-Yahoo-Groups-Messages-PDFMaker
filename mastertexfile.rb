require_relative "er.rb"

abort "Arguments are required" if ARGV.empty?

name=ARGV.first

texstart(name)

prefix=name.sub(/.tex/,'')

ar= Dir.entries(".").grep(/#{prefix}[0-9]/)

#puts fn=prefix+num+".tex"
f=File.open(name, 'a')

h=Hash.new
ar.each_with_index { |x,y| h[x]=y}

j=0
cnt=1
#puts h.length
while cnt<= h.length
   line=prefix+j.to_s+".tex"
   #puts line
   if h[line]
      inputname="\\input{" + line + "}"
      f.puts(inputname)
      cnt+=1
      #puts cnt
   end
   j+=1
end

f.puts("\\end{document}")
f.close
