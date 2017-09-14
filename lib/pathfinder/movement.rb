module Pathfinder
  class Movement
    def initialize(direction:, distance:)
      @direction = direction
      @distance = distance
    end

    def apply(current_position, last_position, previous_positions)
      @current_position = current_position
      @last_position = last_position
      @previous_positions = previous_positions

      calculate_deltas
      @last_position.update(@current_position)
      @next_position = step(@distance)

      @current_position.update(step) until done?
    end

    def calculate_deltas
      @dx = @current_position.xpos - @last_position.xpos
      @dy = @current_position.ypos - @last_position.ypos
    end

    def step(blocks = 1)
      xpos = @current_position.xpos
      ypos = @current_position.ypos

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

    def done?
      @current_position == @next_position || intersected?
    end

    def intersected?
      @previous_positions.add?(@current_position).nil?
    end
  end
end
