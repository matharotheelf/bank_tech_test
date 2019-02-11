require 'deposit'

describe Deposit do
  describe '#amount' do
    let(:amount) { double :amount }

    it 'Can save an amount to it' do
      deposit = Deposit.new(amount)
      expect(deposit.amount).to eq(amount)
    end
  end
end
