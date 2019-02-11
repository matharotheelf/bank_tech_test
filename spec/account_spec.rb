require 'account'

describe Account do
  describe '#create_withdrawal' do
    let (:withdrawal) { double :withdrawal }
    account = Account.new
    it 'adds to transaction_array' do
      expect { account.create_withdrawal(nil, withdrawal) }.to(
        change { account.transaction_array.length }.by(1)
      )
    end
  end
end
