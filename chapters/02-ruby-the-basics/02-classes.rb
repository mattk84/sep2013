#!/usr/bin/env ruby

class Car
    def initialize(speed)
        @speed = speed
    end

    def drive
        puts "#{self.class} is driving at #{@speed}..."
    end
end

class Ford < Car; end
class Pontiac < Car; end

c = Car.new 10
c.drive

f = Ford.new 20 
f.drive

p = Pontiac.new 30
p.drive
