require_relative 'deposit.rb'
require_relative 'withdrawal.rb'

class Account
  attr_reader :transaction_array

  def initialize
    @transaction_array = []
  end

  def create_withdrawal(amount, withdrawal = Withdrawal.new(amount))
    @transaction_array.push(withdrawal)
  end

  def create_deposit(amount, withdrawal = Deposit.new(amount))
    @transaction_array.push(withdrawal)
  end
end
