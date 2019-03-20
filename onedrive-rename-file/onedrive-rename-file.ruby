#!/usr/bin/ruby

$pathOrigine = ARGV[0]
$theEnd = false
$path = $pathOrigine

$charMap = ["~", "\"", "#", "%", "&", "*", ":", "<", ">", "?", "/", "\\", "{", "|", "}", "."]
$count = 0;

def renameFile
    puts "Allo"
    files = Dir.entries($path).select {|f| !File.directory? f}
    files.each do |file|
        name = File.basename(file,File.extname(file))
        if name =~ /[^a-zA-Z0-9\s]/
            newName = name
            $charMap.each do |char|
                newName = newName.sub(char, '')
            end
            puts "Move : #{name} --> #{newName}#{File.extname(file)}"
            $count+=1
            File.rename $path + "/" + name + File.extname(file), $path + "/" + newName + File.extname(file)
        end
    end 
end

while !$theEnd
    renameFile
     
    folder = Dir.entries($path).select {|entry| File.directory? File.join($path,entry) and !(entry =='.' || entry == '..') }
    oldpath = $path
    folder.each do |f|
        $path = oldpath + "/#{f}"
        puts "New path : #{$path}"
        renameFile
    end

    $theEnd = true
end
puts "Number of file change #{$count}"