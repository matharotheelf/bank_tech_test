require_relative 'bank_statement.rb'

# PrintStatement creates the printout of bankstatement given history hash
class PrintStatement
  def print_statement(statement_array)
    str = "date || credit || debit || balance\n"
    statement_array.each do |i|
      str += "#{i['date']} || #{credit(i)} || #{debit(i)} || #{i['balance']}\n"
    end
    p str
  end

  private

  def credit(hash)
    if hash['credit'].nil?
      ''
    else
      hash['credit']
    end
  end

  def debit(hash)
    if hash['debit'].nil?
      ''
    else
      hash['debit']
    end
  end
end
