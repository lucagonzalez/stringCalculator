require 'string_calculator'

describe 'add' do
  it "will return zero if the string is empty" do
    expect(add("")).to eq 0
  end

  it "will return the given number if there is only one number" do
    number = (rand 100)
    number_as_string = number.to_s

    expect(add(number_as_string)).to eq number
  end

  it "will sum two numbers given as string, separated by a comma" do
    number1 = (rand 100)
    number2 = (rand 100)
    numbers_as_string = "#{number1},#{number2}"

    sumResult = number1 + number2

    expect(add(numbers_as_string)).to eq sumResult
  end

  it "will sum an unknown amout of numbers, separated by new lines" do
    numbers_string = ""
    numbers_arr = Array.new(15) { rand(100) }

    numbers_arr.map { |num| numbers_string += "#{num}\n "}

    sumResult = numbers_arr.inject(0){|sum, x| sum + x}

    expect(add(numbers_string)).to eq sumResult

  end

  it "will sum an unknown amout of numbers, separated by any separator" do
    numbers_string = ""
    numbers_arr = Array.new(15) { rand(100) }

    numbers_arr.map { |num| numbers_string += "#{num};\n"}

    sumResult = numbers_arr.inject(0){|sum, x| sum + x}

    expect(add(numbers_string)).to eq sumResult
  end

  it "will raise an error if a negative is given" do
    number1 = -1
    number2 = 2
    numbers_string = "#{number1}, #{number2}"

    expect{
      add(numbers_string)
    }.to raise_error(NegativesNotAllowed)
  end
end
