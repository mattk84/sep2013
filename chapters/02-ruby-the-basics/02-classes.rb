#!/usr/bin/env ruby
#
# This is not a very idiomatic implementation of a class system.
# It has a lot of defects, which we'll identify and remedy together.
# We'll also fill out the classes for Stick, Fire, etc. so that the code can
# actually run.
#
# set up a Mock module that will respond to any method
module Mock
    def method_missing(*args)
    end
end

# use this module to create some empty classes, just enough methods
# so that the code doesn't bomb out
class Stick
    include Mock
end

class Fire
    include Mock
end

class Graham
    include Mock
end

class Chocolate
    include Mock
end

class Marshmallow
    include Mock

    def state
        0
    end
end

class Smore
    NOT_QUITE_BURNED = 0.9

    def initialize(graham=nil, chocolate=nil, marshmallow=nil)
        @graham = graham
        @chocolate = chocolate
        @marshmallow = marshmallow

        @fire = Fire.new
        @desired_state = NOT_QUITE_BURNED
    end

    def set_graham(graham)
        @graham = graham
    end

    def set_chocolate(chocolate)
        @chocolate = chocolate
    end

    def set_marshmallow(marshmallow)
        @marshmallow = marshmallow
    end

    def set_fire(fire)
        @fire = fire
    end

    def set_desired_state(state)
        @desired_state = state
    end

    def cook
        if ! (@graham and @chocolate and @marshmallow and @fire)
            raise "Cannot cook an incomplete Smore!"
        end

        s = Stick.new
        s.add @marshmallow

        s.insert @fire
        while (m = @marshmallow.state) < @desired_state do
          puts "marshmallow state = #{m}"

          sleep 1
          @fire.burn
        end
        s.remove @fire

        @chocolate.top_with @marshmallow
        @graham.top_with @chocolate
    end
end

# usage:
if (__FILE__ == $0)
    s = Smore.new
    s.set_graham(Graham.new)
    s.set_chocolate(Chocolate.new)
    s.set_marshmallow(Marshmallow.new)
    s.set_fire(Fire.new)
    s.cook
end
