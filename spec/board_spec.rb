require_relative 'spec_helper.rb'
require_relative '../lib/snakes'

RSpec.describe Snakes::Board do
  let(:dimension) { 10 }
  let(:empty_space) { 5 }
  let(:ladder_start) { 24 }
  let(:ladder_end) { 42 }
  let(:snake_start) { 84 }
  let(:snake_end) { 48 }
  let(:ladder) { Snakes::Transition.new(snake_start, snake_end) }
  let(:snake) { Snakes::Transition.new(ladder_start, ladder_end) }
  let(:board) { Snakes::Board.new([ladder, snake], dimension) }

  describe '#initialize' do
    subject { board }
    it { is_expected.to be_a Snakes::Board }
  end

  describe '#compute_destination' do
    subject { board.compute_destination(space) }

    context 'space is a ladder' do
      let(:space) { ladder_start }
      it 'goes to end of ladder' do
        expect(subject).to eq ladder_end
      end
    end

    context 'space is a snake' do
      let(:space) { snake_start }
      it 'goes to end of ladder' do
        expect(subject).to eq snake_end
      end
    end

    context 'space is neither a snake or ladder' do
      let(:space) { empty_space }
      it 'stays on the same space' do
        expect(subject).to eq empty_space
      end
    end
  end
end
