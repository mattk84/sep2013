#!/usr/bin/env ruby
module GroupedMethods
    def self.with_bang(str)
        str + "!"
    end

    def self.with_question(str)
        str + "?"
    end
end

puts GroupedMethods.with_bang("Smashing")
puts GroupedMethods.with_question("Success")

puts Math.sqrt(9)
