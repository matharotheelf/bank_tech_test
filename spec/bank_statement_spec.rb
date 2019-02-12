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

    it 'can convert the data of a different withdrawal object' do
      allow(account).to receive(:transaction_array) { [withdrawal] }
      allow(withdrawal).to receive(:is_a?).with(Deposit) { false }
      allow(withdrawal).to receive(:amount) { 13 }
      allow(withdrawal).to receive(:date) { '2013-11-12' }
      expect(@bank.create_history(account)).to eq(
        [{ 'date' => '2013-11-12',
           'credit' => nil,
           'debit' => 13,
           'balance' => -13 }]
      )
    end

    it 'can convert the data of two different objects in the same account' do
      allow(account).to receive(:transaction_array) { [deposit, withdrawal] }
      allow(withdrawal).to receive(:is_a?).with(Deposit) { false }
      allow(withdrawal).to receive(:amount) { 2 }
      allow(withdrawal).to receive(:date) { '2013-09-12' }
      allow(deposit).to receive(:is_a?).with(Deposit) { true }
      allow(deposit).to receive(:amount) { 5 }
      allow(deposit).to receive(:date) { '2013-05-12' }
      expect(@bank.create_history(account)).to eq(
        [{ 'date' => '2013-09-12',
           'credit' => nil,
           'debit' => 2,
           'balance' => 3 },
         { 'date' => '2013-05-12',
           'credit' => 5,
           'debit' => nil,
           'balance' => 5 }]
      )
    end

    it 'can convert the data of two different transactions not in date order' do
      allow(account).to receive(:transaction_array) { [withdrawal, deposit] }
      allow(withdrawal).to receive(:is_a?).with(Deposit) { false }
      allow(withdrawal).to receive(:amount) { 2 }
      allow(withdrawal).to receive(:date) { '2013-09-12' }
      allow(deposit).to receive(:is_a?).with(Deposit) { true }
      allow(deposit).to receive(:amount) { 5 }
      allow(deposit).to receive(:date) { '2013-05-12' }
      expect(@bank.create_history(account)).to eq(
        [{ 'date' => '2013-09-12',
           'credit' => nil,
           'debit' => 2,
           'balance' => 3 },
         { 'date' => '2013-05-12',
           'credit' => 5,
           'debit' => nil,
           'balance' => 5 }]
      )
    end
  end
end
