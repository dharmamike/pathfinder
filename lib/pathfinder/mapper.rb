module Pathfinder
  class Mapper
    def initialize(start, directions)
      @last_position = Position.new(start.xpos, start.ypos)
      @current_position = Position.new(start.xpos, start.ypos)
      @directions = directions
      @dx = 0
      @dy = 0
    end

    def destination
      movements.each do |movement|
        move(movement)
      end
      @current_position
    end

    def movements
      @directions.map do |direction|
        Movement.new(direction[0], direction[1, direction.length].to_i)
      end
    end

    def move(movement)
      @last_position.update(@current_position)
      @current_position.update(new_position(movement))
      @dx = @current_position.xpos - @last_position.xpos
      @dy = @current_position.ypos - @last_position.ypos
    end

    def new_position(movement)
      xpos = @current_position.xpos
      ypos = @current_position.ypos

      if @dy > 0
        # TODO: remove this because it's same as default
        xpos = movement.direction == 'R' ? xpos + movement.distance : xpos - movement.distance
      elsif @dy < 0
        xpos = movement.direction == 'R' ? xpos - movement.distance : xpos + movement.distance
      elsif @dx > 0
        ypos = movement.direction == 'R' ? ypos - movement.distance: ypos + movement.distance
      elsif @dx < 0
        ypos = movement.direction == 'R' ? ypos + movement.distance : ypos - movement.distance
      else
        xpos = movement.direction == 'R' ? xpos + movement.distance : xpos - movement.distance
      end

      Position.new(xpos, ypos)
    end

  end
end
