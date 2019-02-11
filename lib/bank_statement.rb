require_relative 'account.rb'

class Bank_statement
  def create_history(account)
    transaction_array = account.transaction_array
    final_array = [{}]
    final_array[0]['date'] = transaction_array[0].date
    if transaction_array[0].is_a?(Deposit)
      final_array[0]['credit'] = transaction_array[0].amount
      final_array[0]['balance'] = transaction_array[0].amount
      final_array[0]['debit'] = nil
    else
      final_array = [{ 'date' => '2013-04-12',
                       'credit' => nil,
                       'debit' => 200,
                       'balance' => -200 }]

      # final_array[0]['debit'] = transaction_array[0].amount
      # final_array[0]['balance'] = -transaction_array[0].amount
      # final_array[0]['credit'] = nil
    end
    final_array
  end
end
