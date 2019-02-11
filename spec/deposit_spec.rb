require 'deposit'

describe Deposit do
  let(:amount) { double :amount }

  before do
    @deposit = Deposit.new(amount)
  end

  describe '#amount' do
    it 'can save an amount to it' do
      expect(@deposit.amount).to eq(amount)
    end
  end

  describe '#date' do
    it 'can save date to it' do
      expect(@deposit.date).to eq(Date.today)
    end
  end
end
