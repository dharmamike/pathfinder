module Pathfinder
  class Movement
    attr_accessor :direction, :distance

    def initialize(direction, distance)
      @direction = direction
      @distance = distance
    end

    def apply(current_position, last_position, previous_positions)
      @dx = current_position.xpos - last_position.xpos
      @dy = current_position.ypos - last_position.ypos

      last_position.update(current_position)
      current_position.update(new_position_from(current_position, last_position))
    end

    def new_position_from(current_position, last_position)
      xpos = current_position.xpos
      ypos = current_position.ypos


      if @dy > 0
        # TODO: remove this because it's same as default
        xpos = @direction == 'R' ? xpos + @distance : xpos - @distance
      elsif @dy < 0
        xpos = @direction == 'R' ? xpos - @distance : xpos + @distance
      elsif @dx > 0
        ypos = @direction == 'R' ? ypos - @distance: ypos + @distance
      elsif @dx < 0
        ypos = @direction == 'R' ? ypos + @distance : ypos - @distance
      else
        xpos = @direction == 'R' ? xpos + @distance : xpos - @distance
      end

      Position.new(xpos, ypos)
    end
  end
end
