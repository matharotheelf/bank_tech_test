require 'print_statement'

describe 'User journey' do
  it 'can save withdraw money and see statement' do
    account = Account.new
    banker = BankStatement.new
    printer = PrintStatement.new
    account.create_deposit(1000, '2012-01-10')
    account.create_deposit(2000, '2012-01-13')
    account.create_withdrawal(500, '2012-01-14')
    statement = banker.create_history(account)
    expect(printer.print_statement(statement)).to eq(
      "date || credit || debit || balance\n" \
      "2012-01-14 ||  || 500.00 || 2500.00\n" \
      "2012-01-13 || 2000.00 ||  || 3000.00\n" \
      "2012-01-10 || 1000.00 ||  || 1000.00\n"
    )
  end
end
