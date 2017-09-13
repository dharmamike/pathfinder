module Pathfinder
  class Movement
    attr_accessor :direction, :distance

    def initialize(direction, distance)
      @direction = direction
      @distance = distance
    end
  end
end
