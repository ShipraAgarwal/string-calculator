# string-calculator
A simple string calculator written in Ruby following TDD.

Main calculator class is: **/lib/string_calculator.rb**

Test file for the string calculator class is: **/spec/string_calculator_spec.rb** 

To run the tests use the command: **bundle exec rspec**

Steps to run the StringCalculator:

require_relative 'lib/string_calculator'

calculator = StringCalculator.new

result = calculator.add("2, 3, 4, 5")
