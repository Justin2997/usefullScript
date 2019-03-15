#!/usr/bin/ruby

path = ARGV[0]

# Get file
files = Dir.entries(path).select {|f| !File.directory? f}
directories = Dir.entries(path).select {|d| File.directory? d}

puts files
puts directories