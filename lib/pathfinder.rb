require 'pathfinder/version'
require 'pathfinder/position'
require 'pathfinder/mapper'
require 'pathfinder/movement'

module Pathfinder
  def self.find_shortest_distance(directions)
    raise 'Please provide the document with directions' if directions.nil? || directions.empty?

    directions = directions.strip.split(', ')
    start = Position.new(0, 0)
    mapper = Mapper.new(start, directions)
    finish = mapper.destination
    (start.xpos - finish.xpos).abs + (start.ypos - finish.ypos).abs
  end
end
