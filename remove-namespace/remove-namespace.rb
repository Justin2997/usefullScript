#!/usr/bin/ruby
# This script remove namespace from yaml
path = ARGV[0]
namespace = ARGV[1]
newFile = ""
numberFind = 0;

# Pass in the file
File.open(path) do |file|
    file.each do |line|
        if (line.include? "namespace: #{namespace}")
            numberFind += 1
        else
            newFile << line
        end
    end
end

puts "Remove #{numberFind} namespace: #{namespace}"

# Change the file
File.open(path, 'w') { |file| file.write(newFile) }