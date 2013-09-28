#!/usr/bin/env ruby

# print the String 'hello, world'
puts 'hello, world'

# create a method to print 'Hello, World.'
def h
    puts 'Hello, World.'
end

h()
h

# create a method to print a customizable message (pass in name)
def hello(name)
    puts "Hello, #{name}!"
end

hello("World")
hello "dog"

def hello_c(name='World')
    puts "Hello, #{name.capitalize}!"
end

hello_c
hello_c "dude"
