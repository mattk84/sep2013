#!/usr/bin/env ruby
#

class Car
    attr_accessor :speed
    # this sets up the following methods:
    # def speed
    #     @speed
    # end
    #
    # def speed=(s)
    #     @speed = s
    # end

    def drive
        puts "#{self.class} is driving at #{speed}..."
    end
end

class Ford < Car; end
class Pontiac < Car; end

c = Car.new
c.speed = 10
c.drive

f = Ford.new
f.speed = 20
f.drive

p = Pontiac.new
p.speed = 30
p.drive
