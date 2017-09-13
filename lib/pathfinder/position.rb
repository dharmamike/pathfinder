module Pathfinder
  class Position
    attr_accessor :xpos, :ypos

    def initialize(x, y)
      @xpos = x
      @ypos = y
    end

    def update(position)
      @xpos = position.xpos
      @ypos = position.ypos
    end

    def to_s
      "(#{@xpos}, #{@ypos})"
    end
  end
end
