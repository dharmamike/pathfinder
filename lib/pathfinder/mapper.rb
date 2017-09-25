require 'set'

module Pathfinder
  class Mapper
    def initialize(start, directions)
      @last_position = Position.new(start.xpos, start.ypos)
      @current_position = Position.new(start.xpos, start.ypos)
      @directions = directions
      @positions = Set.new
    end

    def destination
      movements.each { |movement| movement.apply(@current_position, @last_position, @positions) }
      @current_position
    end

    def movements
      @directions.map { |direction| Movement.new(hashify_direction(direction)) }
    end

    def hashify_direction(direction)
      { direction: direction[0], distance: direction[1, direction.length].to_i }
    end
  end
end
