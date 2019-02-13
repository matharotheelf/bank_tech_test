require 'float'

describe Float do
  describe '#to_s' do
    it 'can convert float to string with two decimal places' do
      float = 5.to_f

      expect(float.to_twodec).to eq('5.00')
    end
  end
end
