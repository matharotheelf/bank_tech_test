require_relative 'account.rb'
# BankStatement creates a hash for a statement from an account.
class BankStatement
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

def create_hash(transaction, balance)
  if a_deposit?(transaction)
    deposit_hash(transaction, add_balance(transaction, balance))
  else
    withdrawal_hash(transaction, subtract_balance(transaction, balance))
  end
end

def sort_by_date(array)
  array.sort_by { |s| Date.strptime(s.date, '%Y-%m-%d') }
end

def a_deposit?(transaction)
  transaction.is_a?(Deposit)
end

def deposit_hash(deposit, balance)
  { 'date' => deposit.date, 'credit' => deposit.amount,
    'balance' => balance, 'debit' => nil }
end

def withdrawal_hash(withdrawal, balance)
  { 'date' => withdrawal.date, 'credit' => nil,
    'balance' => balance, 'debit' => withdrawal.amount }
end

def add_balance(transaction, balance)
  balance + transaction.amount
end

def subtract_balance(transaction, balance)
  balance - transaction.amount
end
