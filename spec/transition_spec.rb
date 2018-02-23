RSpec.describe Snakes::Transition do
  let(:start_num) { 24 }
  let(:end_num) { 42 }
  let(:transition) { Snakes::Transition.new(start_num, end_num) }

  describe '#initialize' do
    subject { transition }
    it { is_expected.to be_a Snakes::Transition }
  end
end
