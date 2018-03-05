RSpec.describe Snakes::Game do
  let(:die_roll) { 1 }
  let(:starting_position) { 0 }
  let(:board) { Snakes::Board.new([], 10) }
  let(:die) { Snakes::Die.new(1) }
  let(:player1) { Snakes::Player.new('pants') }
  let(:player2) { Snakes::Player.new('shirt') }
  let(:new_player) { Snakes::Player.new('newbie') }
  let(:player1_state) { Snakes::PlayerState.new(player1) }
  let(:player2_state) { Snakes::PlayerState.new(player2) }
  let(:winning_player_state) do
    Snakes::PlayerState.new(player1, board.winning_index)
  end
  let(:initial_player_states) { [player1_state, player2_state] }
  let(:new_game) { Snakes::Game.new(board, initial_player_states, die) }
  let(:finished_game) { Snakes::Game.new(board, [winning_player_state], die) }

  describe '#initialize' do
    subject { new_game }
    it { is_expected.to be_a Snakes::Game }
  end

  describe '#add_player' do
    subject { new_game }
    before { new_game.add_player(new_player) }
    it 'adds a new player to the game' do
      expect(subject.previous_player).to match new_player
    end
  end

  describe '#move_next_player' do
    subject { new_game.position(player1) }
    before { new_game.move_next_player }
    it 'moves player to new position' do
      expect(subject).to equal(starting_position + die_roll)
    end
  end

  describe '#win_condition' do
    subject { finished_game.win_condition(player1) }
    it { is_expected.to be true }

    context 'player is not at end of board' do
      subject { new_game.win_condition(player1) }
      it 'return falses' do
        expect(subject).to equal false
      end
    end
  end

  describe '#position' do
    subject { new_game.position(player1) }
    it 'returns the position of the player' do
      expect(subject).to equal starting_position
    end
  end

  describe '#last_roll' do
    subject { new_game.last_roll(player1) }
    before { new_game.move_next_player }
    it 'returns the number last rolled by the player' do
      expect(subject).to equal die_roll
    end
  end

  describe '#previous_player' do
    subject { new_game.previous_player }
    before { new_game.move_next_player }
    it 'returns the player who just moved' do
      expect(subject).to equal player1
    end
  end

  describe '#next_player' do
    subject { new_game.next_player }
    it 'returns the player who is up next' do
      expect(subject).to equal player1
    end
  end

  describe '#players_at_index' do
    subject { new_game.players_at_index(position) }
    let(:position) { starting_position }

    it 'returns all players' do
      expect(subject).to match [player1, player2]
    end

    context 'no players at index' do
      let(:position) { starting_position + 1 }
      it 'returns an empty array' do
        expect(subject).to match []
      end
    end
  end

  describe '#players' do
    subject { new_game.players }
    it 'returns a list of all players' do
      expect(subject).to match [player1, player2]
    end
  end
end
