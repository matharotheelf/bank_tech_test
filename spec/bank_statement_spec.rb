require 'bank_statement'

describe Bank_statement do
  before do
    @bank = Bank_statement.new
  end

  let(:account) { double :account }

  describe '#create_history' do
    let(:deposit) { double :deposit }
    let(:withdrawal) { double :withdrawal }
    it 'can convert the data of a deposit object' do
      allow(account).to receive(:transaction_array) { [deposit] }
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

    it 'can convert the data of a withdrawal object' do
      allow(account).to receive(:transaction_array) { [withdrawal] }
      allow(withdrawal).to receive(:is_a?).with(Deposit) { false }
      allow(withdrawal).to receive(:amount) { 200 }
      allow(withdrawal).to receive(:date) { '2013-04-12' }
      expect(@bank.create_history(account)).to eq(
        [{ 'date' => '2013-04-12',
           'credit' => nil,
           'debit' => 200,
           'balance' => -200 }]
      )
    end

    it 'can convert the data of a different deposit object' do
      allow(account).to receive(:transaction_array) { [deposit] }
      allow(deposit).to receive(:is_a?).with(Deposit) { true }
      allow(deposit).to receive(:amount) { 8 }
      allow(deposit).to receive(:date) { '2013-08-12' }
      expect(@bank.create_history(account)).to eq(
        [{ 'date' => '2013-08-12',
           'credit' => 8,
           'debit' => nil,
           'balance' => 8 }]
      )
    end
  end
end
