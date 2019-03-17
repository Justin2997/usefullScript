#!/usr/bin/ruby

pathOrigine = ARGV[0]
pathTransfert = ARGV[1]
theEnd = false

while !theEnd
    files = Dir.entries(pathOrigine).select {|f| !File.directory? f}
    files.each do |file|
        if file =~ /[^a-zA-Z0-9\s]/
            puts file
        end
    end  
    theEnd = true
end