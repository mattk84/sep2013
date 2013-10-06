#!/usr/bin/env ruby
#
argument_string = ARGV.size == 1 ? '1 argument' : "#{ARGV.size} arguments"

puts "You ran me as #{$0} with #{argument_string}:"
p ARGV
