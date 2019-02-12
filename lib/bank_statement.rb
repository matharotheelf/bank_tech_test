require_relative 'account.rb'

class Bank_statement
  def create_history(account)
    transactions = account.transaction_array
    final_array = []
    balance = 0
    sorted = transactions.sort_by { |s| Date.strptime(s.date, '%Y-%m-%d') }
    sorted.each do |element|
      final_array.unshift(create_hash(element, balance))
      balance = create_hash(element, balance)['balance']
    end
    final_array
  end
end

def create_hash(element, balance)
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
  hash
end
