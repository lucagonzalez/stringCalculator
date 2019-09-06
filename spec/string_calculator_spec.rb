#
# Create a simple String calculator with a method int Add(string numbers). The method can take 0, 1 or 2 numbers, and will return their sum (for an empty string it will return 0). For example "" or "1" or "1,2"
#     Start with the simplest test case of an empty string and move to 1 and two numbers
#     Remember to solve things as simply as possible so that you force yourself to write tests you did not think about
#     Remember to refactor after each passing test
# Allow the Add method to handle an unknown amount of numbers
# Allow the Add method to handle new lines between numbers (instead of commas).
#     the following input is ok: "1\n2,3" (will equal 6)
#     the following input is NOT ok: "1,\n" (not need to prove it - just clarifying)
# Support different delimiters. To change a delimiter, the beginning of the string will contain a separate line that looks like this: [delimiter]\n[numbers...], for example ;\n1;2 should return three where the default delimiter is ; .
#     he first line is optional. all existing scenarios should still be supported
# Calling Add with a negative number will throw an exception "negatives not allowed" - and the negative that was passed.
#     if there are multiple negatives, show all of them in the exception message

require 'string_calculator'

describe 'string_calculator' do
  it "will return zero if the string is empty" do
    expect(string_calculator("")).to eq 0
  end

  it "will return the given number if there is only one number" do
    number = (rand 100)
    number_as_string = number.to_s

    expect(string_calculator(number_as_string)).to eq number
  end

  it "will sum two numbers given as string, separated by a comma" do
    number1 = (rand 100)
    number2 = (rand 100)
    numbers_as_string = "#{number1},#{number2}"

    sumResult = number1 + number2

    expect(string_calculator(numbers_as_string)).to eq sumResult
  end

  it "will sum an unknown amout of numbers, separated by new lines" do
    numbers_string = ""
    numbers_arr = Array.new(15) { rand(100) }

    numbers_arr.map { |num| numbers_string += "#{num}\n "}

    sumResult = numbers_arr.inject(0){|sum, x| sum + x}

    expect(string_calculator(numbers_string)).to eq sumResult
  end

  it "will sum an unknown amout of numbers, separated by any separator" do
    numbers_string = ""
    numbers_arr = Array.new(15) { rand(100) }

    numbers_arr.map { |num| numbers_string += "#{num};\n"}

    sumResult = numbers_arr.inject(0){|sum, x| sum + x}

    expect(string_calculator(numbers_string)).to eq sumResult
  end

  it "will raise an error if a negative is given" do
    number1 = -1
    number2 = 2
    numbers_string = "#{number1}, #{number2}"

    expect{
      string_calculator(numbers_string)
    }.to raise_error(NegativesNotAllowed)
  end
end
