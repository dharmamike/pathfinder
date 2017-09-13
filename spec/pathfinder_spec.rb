require "spec_helper"

RSpec.describe Pathfinder do
  it "has a version number" do
    expect(Pathfinder::VERSION).not_to be nil
  end

  it "calculates the shortest distance" do
    expect(Pathfinder::find_shortest_distance(%w(R2, L3))).to eq 5
    expect(Pathfinder::find_shortest_distance(%w(R2, R2, R2))).to eq 2
    expect(Pathfinder::find_shortest_distance(%w(R5, L5, R5, R3))).to eq 12
  end
end
