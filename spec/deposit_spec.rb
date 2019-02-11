require 'deposit'

describe Deposit do
  describe '#amount' do
    let(:amount) { double :amount }

    before do
      @deposit = Deposit.new(amount)
    end

    it 'can save an amount to it' do
      expect(@deposit.amount).to eq(amount)
    end

    it 'can save date to it' do
      expect(@deposit.date).to eq(Date.today)
    end
  end
end
