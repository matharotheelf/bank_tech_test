require_relative 'deposit.rb'
require_relative 'withdrawal.rb'

# Account saves the list of withdrawals and deposits
class Account
  attr_reader :transaction_array

  def initialize
    @transaction_array = []
  end

  def create_withdrawal(amount, date = Date.new,
                        withdrawal = Withdrawal.new(amount, date))
    @transaction_array.push(withdrawal)
  end

  def create_deposit(amount, date = Date.new,
                     withdrawal = Deposit.new(amount, date))
    @transaction_array.push(withdrawal)
  end
end
