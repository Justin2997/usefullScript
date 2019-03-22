#!/usr/bin/ruby

$pathOrigine = ARGV[0]
$theEnd = false
$path = $pathOrigine

$charMap = ["~", "\"", "#", "%", "&", "*", ":", "<", ">", "?", "/", "\\", "{", "|", "}", "."]
$count = 0;

def renameFile(p)
    puts "Path #{p}"
    files = Dir.entries(p).select {|f| !File.directory? f}
    files.each do |file|
        name = File.basename(file,File.extname(file))
        puts "Filename #{name}"
        if name =~ /[^a-zA-Z0-9\s]/
            newName = name

            # Do mutiple time to be sure that we remove every things
            $charMap.each do |char|
                newName = newName.sub(char, '')
            end
            $charMap.each do |char|
                newName = newName.sub(char, '')
            end
            $charMap.each do |char|
                newName = newName.sub(char, '')
            end

            puts "Move : #{name} --> #{newName}#{File.extname(file)}"
            $count+=1
            File.rename p + "/" + name + File.extname(file), p + "/" + newName + File.extname(file)
        end
    end 
end

def movePath(p)
    folder = Dir.entries(p).select {|entry| File.directory? File.join(p,entry) and !(entry =='.' || entry == '..') }

    if folder.length == 0
        return
    else
        folder.each do |f|
            puts "Going into folder : #{p}/#{f}"
            renameFile(p + "/#{f}")
            movePath(p + "/#{f}")
        end
    end
end

renameFile($path)
movePath($path)

puts "Number of file change #{$count}"