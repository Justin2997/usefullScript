#!/usr/bin/ruby

pathOrigine = ARGV[0]
theEnd = false
path = pathOrigine

charMap = ["~", "\"", "#", "%", "&", "*", ":", "<", ">", "?", "/", "\\", "{", "|", "}", "."]

while !theEnd
    files = Dir.entries(path).select {|f| !File.directory? f}
    files.each do |file|
        name = File.basename(file,File.extname(file))
        if name =~ /[^a-zA-Z0-9\s]/
            newName = name
            charMap.each do |char|
                newName = newName.sub(char, '') 
            end

            File.rename path + "/" + name + File.extname(file), path + "/" + newName + File.extname(file)
        end
    end  

    directory = Dir.entries(path).select {|f| File.file? f}
    puts directory

    theEnd = true
end