#!/usr/bin/env ruby

module Flyable
    attr_accessor :airspeed

    def fly
        puts "#{self.class} is flying at #{airspeed}..."
        # ...
    end
end

module Drivable
    attr_accessor :speed

    def drive
        puts "#{self.class} is driving at #{speed}..."
        # ...
    end
end

class Car
    include Drivable
end

class Plane
    include Flyable
end

class PlaneCar
    include Drivable
    include Flyable
end

c = Car.new
c.speed = 10
c.drive

p = Plane.new
p.airspeed = 250
p.fly

pc = PlaneCar.new
pc.speed = 50
pc.airspeed = 180
pc.drive
pc.fly
