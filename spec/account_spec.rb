require 'account'

describe Account do
  before do
    @account = Account.new
  end

  describe '#create_withdrawal' do
    let (:withdrawal) { double :withdrawal }
    it 'adds to transaction_array' do
      expect { @account.create_withdrawal(nil, withdrawal) }.to(
        change { @account.transaction_array.length }.by(1)
      )
    end
  end

  describe '#create_deposit' do
    let (:deposit) { double :deposit }
    it 'adds to transaction_array' do
      expect { @account.create_withdrawal(nil, deposit) }.to(
        change { @account.transaction_array.length }.by(1)
      )
    end
  end
end
