#!/usr/local/bin/ruby -w

require 'json'

#read file contents
if ARGV[0]
    file = File.read("./#{ARGV[0]}")
    data_hash = JSON.parse(file)
    puts data_hash
else
    puts "A data file is required"
    return
end