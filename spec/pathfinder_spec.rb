require 'spec_helper'

RSpec.describe Pathfinder do
  it 'has a version number' do
    expect(Pathfinder::VERSION).not_to be nil
  end

  it 'calculates the shortest distance' do
    expect(Pathfinder::find_shortest_distance(%w(R2, L3))).to eq 5
    expect(Pathfinder::find_shortest_distance(%w(R2, R2, R2))).to eq 2
    expect(Pathfinder::find_shortest_distance(%w(R5, L5, R5, R3))).to eq 12
  end

  it 'stops the first time a previous position is encountered' do
    expect(Pathfinder::find_shortest_distance(%w(R8, R4, R4, R8))).to eq 4
    expect(Pathfinder::find_shortest_distance(%w(R3, R4, R2, R8))).to eq 1
  end
end
