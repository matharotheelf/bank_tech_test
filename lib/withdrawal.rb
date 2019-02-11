class Withdrawal
  attr_reader :amount, :date
  def initialize(amount)
    @amount = amount
    @date = Date.today
  end
end
