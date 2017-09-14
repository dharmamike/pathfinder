require 'spec_helper'

RSpec.describe Pathfinder::Position do
  let (:position1) { Pathfinder::Position.new(1, 1) }
  let (:position2) { Pathfinder::Position.new(1, 1) }
  let (:position3) { Pathfinder::Position.new(0, 0) }

  it 'can be relocated to new coordinates' do
    position1.update(position3)
    expect(position1.xpos).to eq 0
    expect(position1.ypos).to eq 0
  end

  it 'can determine equality' do
    expect(position1).to eq position2
    expect(position1.eql?(position2)).to be_truthy
  end

  describe 'Set operations' do
    let (:position_set) { Set.new }

    it 'returns nil when an identical Position is added' do
      position_set.add?(position1)
      position_set.add?(position3)
      expect(position_set.count).to eq 2
      expect(position_set.add?(position2)).to be_nil
    end
  end
end
