require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    context 'handle upto 2 comma separated numbers' do
      it 'returns 0 for empty string' do
        expect(subject.add('')).to eq(0)
      end

      it 'returns the same number for a single number string' do
        expect(subject.add('2')).to eq(2)
      end

      it 'returns the sum of numbers for a two numbers string' do
        expect(subject.add('2,3')).to eq(5)
      end
    end

    context 'handle any amount of comma separated numbers' do
      it 'returns sum of all the numbers' do
        expect(subject.add('2,3,4,5')).to eq(14)

        expect(subject.add('200, 5, 10, 15, 120')).to eq(350)
      end
    end

    context 'handle new line as delimiter' do
      it 'returns sum of all the numbers' do
        expect(subject.add('2\n3,4\n5')).to eq(14)
      end
    end
  end
end