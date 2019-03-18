#!/usr/bin/ruby

pathOrigine = ARGV[0]
theEnd = false
path = pathOrigine

while !theEnd
    files = Dir.entries(path).select {|f| !File.directory? f}
    files.each do |file|
        if file =~ /[^a-zA-Z0-9\s]/
            # Remove extention
            name = File.basename(file,File.extname(file)
            puts name
            File.rename(file, "test>#.txt") 
            puts file
        end
    end  
    theEnd = true
end