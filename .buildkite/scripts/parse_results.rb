#!/usr/local/bin/ruby -w

require 'json'

def check_results(data)
  failed_tests = data['numFailedTests']
  return puts '\33[32;37mTests Passed\33[0m' unless data['numFailedTests'].to_i > 0

  puts "Number of failed tests: #{failed_tests}"
  exit(1)
end

#read file contents
if ARGV[0]
    file = File.read("./#{ARGV[0]}")
    check_results(JSON.parse(file))
else
    puts 'A data file is required'
end