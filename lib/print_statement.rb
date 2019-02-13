require_relative 'bank_statement.rb'
require_relative 'float.rb'

# PrintStatement creates the printout of bankstatement given history hash
class PrintStatement
  def print_statement(statement_array)
    str = "date || credit || debit || balance\n"
    statement_array.each do |i|
      str += "#{i['date']} || #{credit(i)} || #{debit(i)} || #{balance(i)}\n"
    end
    p str
  end

  private

  def credit(hash)
    if hash['credit'].nil?
      ''
    else
      hash['credit'].to_f.to_twodec
    end
  end

  def debit(hash)
    if hash['debit'].nil?
      ''
    else
      hash['debit'].to_f.to_twodec
    end
  end

  def balance(hash)
    hash['balance'].to_f.to_twodec
  end
end
