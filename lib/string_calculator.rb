class StringCalculator
  def add(str_of_numbers:, delimiter: ',')
    return 0 if str_of_numbers.empty?

    if str_of_numbers.start_with?('//')
      parts = str_of_numbers.split('\n', 2)
      delimiter = parts[0][2]
      str_of_numbers = parts[1]
    end

    return str_of_numbers.gsub('\n', delimiter).split(delimiter).map(&:to_i).sum
  end
end