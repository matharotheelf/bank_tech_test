require 'bank_statement'

describe Bank_statement do
  before do
    @bank = Bank_statement.new
  end

  let(:account) { double :account }

  describe '#create_history' do
    let(:deposit) { double :deposit }
    it 'can convert the data of a deposit object' do
      allow(account).to receive(:transaction_array[0]) { deposit }
      allow(deposit).to receive(:is_a?).with(Deposit) { true }
      allow(deposit).to receive(:amount) { 500 }
      allow(deposit).to receive(:date) { '2013-03-12' }
      expect(@bank.create_history(account)).to eq(
        [{ 'date' => '2013-03-12',
           'credit' => 500,
           'debit' => nil,
           'balance' => 500 }]
      )
    end
  end
end
