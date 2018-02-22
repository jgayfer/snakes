require_relative '../spec_helper'
require_relative '../../lib/snakes'

RSpec.describe Snakes::DefaultBoards::Standard10x10 do
  let(:board) { Snakes::DefaultBoards::Standard10x10.new }

  describe '.new' do
    subject { board }

    it { is_expected.to be_a Snakes::Board }

    it 'is the correct dimension' do
      expect(subject.dimension).to equal \
        Snakes::DefaultBoards::STANDARD_BOARD_DIMENSION
    end
  end
end
