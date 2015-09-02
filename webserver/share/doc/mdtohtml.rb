#!/usr/bin/env ruby

require "github/markdown"

CSS = 'assets/github-markdown.css'

if ARGV[0]
  file = ARGV[0]
  outfile = "#{File.basename(file, '.md')}.html"
  css = "<link rel=\"stylesheet\" href=\"#{CSS}\">"
  File.open(outfile, 'w') do |f|
    f.write("<html>\n<head>\n#{css}\n</head>\n<body>\n<div class=\"markdown-body\">\n")
    f.write(GitHub::Markdown.render(File.read(file)))
    f.write("</div>\n</body>\n</html>")
  end
else
  STDERR.puts "usage: #{__FILE__} <markdown-file>"
end
