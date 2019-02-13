require 'print_statement'

describe PrintStatement do
  describe '#print_statement' do
    let(:integer1) { double(:integer1) }
    let(:integer2) { double(:integer2) }
    let(:integer3) { double(:integer3) }
    let(:integer4) { double(:integer4) }
    let(:float1) { double(:float1) }
    let(:float2) { double(:float2) }
    let(:float3) { double(:float3) }
    let(:float4) { double(:float4) }
    it 'can create statement string' do
      statement_array = [{ 'date' => '2013-09-12',
                           'credit' => nil,
                           'debit' => integer1,
                           'balance' => integer2 },
                         { 'date' => '2013-05-12',
                           'credit' => integer3,
                           'debit' => nil,
                           'balance' => integer4 }]
      allow(integer1).to receive(:to_f) { float1 }
      allow(integer2).to receive(:to_f) { float2 }
      allow(integer3).to receive(:to_f) { float3 }
      allow(integer4).to receive(:to_f) { float4 }
      allow(float1).to receive(:to_twodec) { '2.00' }
      allow(float2).to receive(:to_twodec) { '3.00' }
      allow(float3).to receive(:to_twodec) { '5.00' }
      allow(float4).to receive(:to_twodec) { '5.00' }
      expect(subject.print_statement(statement_array)).to eq(
        "date || credit || debit || balance\n" \
        "2013-09-12 ||  || 2.00 || 3.00\n" \
        "2013-05-12 || 5.00 ||  || 5.00\n"
      )
    end
  end
end
