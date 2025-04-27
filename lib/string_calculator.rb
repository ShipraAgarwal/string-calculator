class StringCalculator
  def add(str_of_numbers)
    return 0 if str_of_numbers.empty?

    return str_of_numbers.gsub('\n', ',').split(',').map(&:to_i).sum
  end
end