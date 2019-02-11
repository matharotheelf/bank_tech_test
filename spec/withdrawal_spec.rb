require 'withdrawal'

describe Withdrawal do
  describe '#amount' do
    let(:amount) { double :amount }

    it 'Can save an amount to it' do
      withdrawal = Withdrawal.new(amount)
      expect(withdrawal.amount).to eq(amount)
    end
  end
end
