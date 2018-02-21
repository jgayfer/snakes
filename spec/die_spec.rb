require_relative 'spec_helper.rb'
require_relative '../lib/snakes'

RSpec.describe Snakes::Die do
  let(:die_sides) { 6 }
  let(:die) { Snakes::Die.new(die_sides) }

  describe '#initialize' do
    subject { die }
    it { is_expected.to be_a Snakes::Die }
  end

  describe '#roll' do
    subject { die.roll }
    it 'returns an int within range' do
      is_expected.to be_between(1, die_sides)
    end
  end
end
