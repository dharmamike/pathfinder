require 'spec_helper'

RSpec.describe Pathfinder do
  it 'has a version number' do
    expect(Pathfinder::VERSION).not_to be nil
  end

  describe '.find_shortest_distance' do
    it 'calculates the shortest distance' do
      expect(Pathfinder::find_shortest_distance(%q(R2, L3))).to eq 5
      expect(Pathfinder::find_shortest_distance(%q(R2, R2, R2))).to eq 2
      expect(Pathfinder::find_shortest_distance(%q(R5, L5, R5, R3))).to eq 12
    end

    it 'stops the first time a previous position is encountered' do
      expect(Pathfinder::find_shortest_distance(%q(R8, R4, R4, R8))).to eq 4
      expect(Pathfinder::find_shortest_distance(%q(R3, R4, R2, R8))).to eq 1
    end

    it 'raises an error when an empty string is passed' do
      expect{ Pathfinder::find_shortest_distance('') }.to raise_error('Please provide the document with directions')
    end

    it 'raises an error when no argument is passed' do
      expect{ Pathfinder::find_shortest_distance(nil) }.to raise_error('Please provide the document with directions')
    end
  end
end
