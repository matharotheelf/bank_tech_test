# Deposit class stores the information of one deposit
class Deposit
  attr_reader :amount, :date
  def initialize(amount, date = Date.today)
    @amount = amount
    @date = date
  end
end
