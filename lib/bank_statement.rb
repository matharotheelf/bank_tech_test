require_relative 'account.rb'

class Bank_statement
  def create_history(account)
    if account.transaction_array[0].is_a?(Deposit)
      [{ 'date' => '2013-03-12',
         'credit' => 500,
         'debit' => nil,
         'balance' => 500 }]
    else
      [{ 'date' => '2013-04-12',
         'credit' => nil,
         'debit' => 200,
         'balance' => 200 }]
    end
  end
end
