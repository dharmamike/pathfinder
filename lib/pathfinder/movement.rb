module Pathfinder
  class Movement
    attr_accessor :direction, :distance

    def initialize(direction:, distance:)
      @direction = direction
      @distance = distance
    end

    def apply(current_position, last_position, previous_positions)
      calculate_deltas(current_position, last_position)

      last_position.update(current_position)
      next_position = step(current_position, @distance)

      until current_position == next_position || previous_positions.add?(current_position).nil? do
        current_position.update(step(current_position))
      end
    end

    def calculate_deltas(current_position, last_position)
      @dx = current_position.xpos - last_position.xpos
      @dy = current_position.ypos - last_position.ypos
    end

    def step(current_position, blocks = 1)
      xpos = current_position.xpos
      ypos = current_position.ypos

      if @dy > 0
        xpos = @direction == 'R' ? xpos + blocks : xpos - blocks
      elsif @dy < 0
        xpos = @direction == 'R' ? xpos - blocks : xpos + blocks
      elsif @dx > 0
        ypos = @direction == 'R' ? ypos - blocks : ypos + blocks
      elsif @dx < 0
        ypos = @direction == 'R' ? ypos + blocks : ypos - blocks
      else
        xpos = @direction == 'R' ? xpos + blocks : xpos - blocks
      end

      Position.new(xpos, ypos)
    end
  end
end
