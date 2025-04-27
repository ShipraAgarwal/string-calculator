require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    context 'handle upto 2 comma separated numbers' do
      it 'returns 0 for empty string' do
        expect(subject.add(str: '')).to eq(0)
      end

      it 'returns the same number for a single number string' do
        expect(subject.add(str: '2')).to eq(2)
      end

      it 'returns the sum of numbers for a two numbers string' do
        expect(subject.add(str: '2,3')).to eq(5)
      end
    end

    context 'handle any amount of comma separated numbers' do
      it 'returns sum of all the numbers' do
        expect(subject.add(str: '2,3,4,5')).to eq(14)

        expect(subject.add(str: '200, 5, 10, 15, 120')).to eq(350)
      end
    end

    context 'handle new line as delimiter' do
      it 'returns sum of all the numbers' do
        expect(subject.add(str: '2\n3,4\n5')).to eq(14)
      end
    end

    context 'support different delimiters' do
      it 'returns sum of all the numbers' do
        expect(subject.add(str: '//;\n1;2')).to eq(3)

        expect(subject.add(str: '//*\n1*2\n5')).to eq(8)
      end
    end

    context 'handle negative numbers' do
      it 'throws error with negative numbers in it' do
        expect { subject.add(str: '3, -4, 6') }.to raise_error('negatives not allowed: -4')

        expect { subject.add(str: '//*\n1*-2\n5*-7') }.to raise_error('negatives not allowed: -2, -7')
      end
    end

    context 'checks out of range numbers' do
      it 'ignores numbers greater than 1000' do
        expect(subject.add(str: '6, 8, 1002, 5, 2000, 4')).to eq(23)
      end
    end

    it 'supports delimiters of any length' do
      expect(subject.add(str: '//[***]\n1***2***3')).to eq(6)

      expect(subject.add(str: '//[abc]\n4abc5abc6')).to eq(15)
    end
  end
end
