require 'print_statement'

describe Print_statement do
  describe '#print_statement' do
    statement_array = [{ 'date' => '2013-09-12',
                         'credit' => nil,
                         'debit' => 2,
                         'balance' => 3 },
                       { 'date' => '2013-05-12',
                         'credit' => 5,
                         'debit' => nil,
                         'balance' => 5 }]
    it 'can create statement string' do
      expect(subject.print_statement(statement_array)).to eq(
        "date || credit || debit || balance\n" \
        "2013-09-12 ||  || 2 || 3\n" \
        "2013-05-12 || 5 ||  || 5\n"
      )
    end
  end
end
