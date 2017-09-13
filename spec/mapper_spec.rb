require 'spec_helper'

RSpec.describe Pathfinder::Mapper do
  let (:start) { Pathfinder::Position.new(0, 0) }
  let (:directions) { ['R2', 'L3'] }

  subject { Pathfinder::Mapper.new(start, directions) }

  it 'returns the destination as a Position' do
    expect(subject.destination).to be_a Pathfinder::Position
  end

  it 'calculates the destination x position' do
    expect(subject.destination.xpos).to eq 2
  end

  it 'calculates the destination y position' do
    expect(subject.destination.ypos).to eq 3
  end
end
