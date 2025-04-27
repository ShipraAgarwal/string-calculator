class StringCalculator
  def add(str_of_numbers:, delimiter: ',')
    return 0 if str_of_numbers.empty?

    if str_of_numbers.start_with?('//')
      parts = str_of_numbers.split('\n', 2)
      delimiter = parts[0][2]
      str_of_numbers = parts[1]
    end

    numbers = str_of_numbers.gsub('\n', delimiter).split(delimiter).map(&:to_i)
    negatives = numbers.select(&:negative?)

    return "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    numbers.reject! { |number| number > 1000 }

    return numbers.sum
  end
end