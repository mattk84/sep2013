#!/usr/bin/env ruby
module StringMethods
    def self.with_bang(str)
        str + "!"
    end

    def self.with_question(str)
        str + "?"
    end
end

puts StringMethods.with_bang("Smashing")
puts StringMethods.with_question("Success")

puts Math.sqrt(9)
