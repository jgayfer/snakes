require_relative 'spec_helper.rb'
require_relative '../lib/snakes'

RSpec.describe Snakes::PlayerState do
  let(:player) { Snakes::Player.new('Jimbo') }
  let(:player_state) { Snakes::PlayerState.new(player) }

  describe '#initialize' do
    subject { player_state }
    it { is_expected.to be_a Snakes::PlayerState }
  end
end
