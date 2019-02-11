require 'withdrawal'

describe Withdrawal do
  let(:amount) { double :amount }

  before do
    @withdrawal = Withdrawal.new(amount)
  end

  describe '#amount' do
    it 'can save an amount to it' do
      expect(@withdrawal.amount).to eq(amount)
    end
  end

  describe '#date' do
    it 'can save date to it' do
      expect(@withdrawal.date).to eq(Date.today)
    end
  end
end
