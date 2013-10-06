#!/usr/bin/env ruby

a = [1, 2, 3]
puts "a.size is: ", a.size
puts "elements: "
a.each do |i|
    puts i
end

puts "\n"

h = {
    'key_one' => 'value_one',
    'key_two' => 'value_two'
}

puts "h.size is: ", h.size
puts "elements: "
h.each do |k, v|
    puts "#{k}=#{v}"
end
