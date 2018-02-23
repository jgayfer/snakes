RSpec.describe Snakes do
  let(:player_names) { %w['James Sebastian'] }
  let(:die_sides) { 1 }

  describe '.standard_game' do
    context 'without die sides' do
      subject { Snakes.standard_game(player_names) }
      it { is_expected.to be_a Snakes::Game }
    end

    context 'with die sides' do
      subject { Snakes.standard_game(player_names, die_sides) }
      it { is_expected.to be_a Snakes::Game }
    end
  end
end
