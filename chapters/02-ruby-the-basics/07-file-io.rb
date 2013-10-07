#!/usr/bin/env ruby
#
def usage
    puts "usage: #{$0} read|write filename [contents_to_write]"
    exit 1
end

usage if ARGV.size < 2
action = ARGV[0]
filename = ARGV[1]

case action.downcase
when 'read'
    contents = File.read(filename)
    puts contents
when 'write'
    raise "File #{filename} exists!" if File.exists?(filename)

    contents = ARGV[2]
    File.open(filename, 'a+') do |f|
        f << contents
    end
end

exit 0
