require_relative 'account.rb'

class Bank_statement
  def create_history(_account)
    [{ 'date' => '2013-03-12',
       'credit' => 500,
       'debit' => nil,
       'balance' => 500 }]
  end
end
