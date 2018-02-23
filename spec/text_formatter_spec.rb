RSpec.describe Snakes::TextFormatter do
  let(:die) { Snakes::Die.new(1) }
  let(:snake) { Snakes::Transition.new(40, 65) }
  let(:ladder) { Snakes::Transition.new(87, 20) }
  let(:board) { Snakes::Board.new([snake, ladder], 10) }
  let(:player1) { Snakes::Player.new('pants') }
  let(:player2) { Snakes::Player.new('shirts') }
  let(:player3) { Snakes::Player.new('gloves') }
  let(:player1_state) { Snakes::PlayerState.new(player1) }
  let(:player2_state) { Snakes::PlayerState.new(player2) }
  let(:player3_state) { Snakes::PlayerState.new(player3, 1) }
  let(:player_states) { [player1_state, player2_state, player3_state] }
  let(:game) { Snakes::Game.new(board, player_states, die) }
  let(:formatter) { Snakes::TextFormatter.new(game) }

  describe '#initialize' do
    subject { formatter }
    it { is_expected.to be_a Snakes::TextFormatter }
  end

  describe '#board_text' do
    subject { formatter.board_text }
    it 'returns the textual representation of the game' do
      expect(subject).to eq(fixture('board.txt').chomp)
    end
  end
end
