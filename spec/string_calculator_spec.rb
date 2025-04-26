require 'string_calculator'

RSpec.describe StringCalculator do
  subject { StringCalculator.new }

  describe '#add' do
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
end