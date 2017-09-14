module Pathfinder
  class Mapper
    def initialize(start, directions)
      @last_position = Position.new(start.xpos, start.ypos)
      @current_position = Position.new(start.xpos, start.ypos)
      @directions = directions
      @positions = Set.new
    end

    def destination
      movements.each do |movement|
        movement.apply(@current_position, @last_position, @positions)
      end
      @current_position
    end

    def movements
      @directions.map do |direction|
        Movement.new(direction[0], direction[1, direction.length].to_i)
      end
    end
  end
end
