require_relative 'account.rb'

class Bank_statement
  def create_history(account)
    account.transaction_array
    final_array = []
    balance = 0
    account.transaction_array.each do |element|
      hash = {}
      hash['date'] = element.date
      if element.is_a?(Deposit)
        hash['credit'] = element.amount
        balance += element.amount
        hash['balance'] = balance
        hash['debit'] = nil
      else
        hash['debit'] = element.amount
        balance -= element.amount
        hash['balance'] = balance
        hash['credit'] = nil
      end
      final_array.unshift(hash)
    end
    final_array
  end
end
