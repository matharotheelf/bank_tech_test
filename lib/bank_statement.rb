require_relative 'account.rb'

class Bank_statement
  def create_history(account)
    final_array = []
    balance = 0
    sort_by_date(account.transaction_array).each do |element|
      final_array.unshift(create_hash(element, balance))
      balance = create_hash(element, balance)['balance']
    end
    final_array
  end
end

private

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

def sort_by_date(array)
  sorted = array.sort_by { |s| Date.strptime(s.date, '%Y-%m-%d') }
end
