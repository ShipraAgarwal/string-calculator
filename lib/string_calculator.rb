class StringCalculator
  def add(str:)
    return 0 if str.empty?

    numbers = parse_string(str: str)

    check_for_negatives(numbers: numbers)

    numbers.reject! { |number| number > 1000 }

    numbers.sum
  end

  private

  def parse_string(str:)
    delimiter = ','

    if str.start_with?('//')
      parts = str.split('\n', 2)
      delimiter = parts[0][2..]


      if delimiter.start_with?('[') && delimiter.end_with?(']')
        delimiter[0] = ''
        delimiter[delimiter.length - 1] = ''
      end

      str = parts[1]
    end

    get_numbers(string_of_numbers: str, delimiter: delimiter)
  end

  def get_numbers(string_of_numbers:, delimiter:)
    string_of_numbers
      .gsub('\n', delimiter)
      .split(delimiter)
      .map(&:to_i)
  end

  def check_for_negatives(numbers:)
    negatives = numbers.select(&:negative?)

    return if negatives.empty?

    raise "negatives not allowed: #{negatives.join(', ')}"
  end
end
