require_relative '../lib/snakes'

RSpec.describe Snakes::Player do
  let(:player_name) { 'Jimbo' }
  let(:player) { Snakes::Player.new(player_name) }

  describe '#initialize' do
    subject { player }
    it { is_expected.to be_a Snakes::Player }
  end

  describe '#to_s' do
    subject { player.to_s }
    it 'returns the player name' do
      is_expected.to equal player_name
    end
  end
end
