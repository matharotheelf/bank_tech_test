# Withdrawal class stores the information of one withdrawal
class Withdrawal
  attr_reader :amount, :date
  def initialize(amount, date = Date.today)
    @amount = amount
    @date = date
  end
end
