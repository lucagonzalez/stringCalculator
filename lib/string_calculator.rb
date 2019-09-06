class NegativesNotAllowed < StandardError
end

#This Regex looks for anything that is not a positive or negative number
LOOK_FOR_SEPARATORS = /[a-zA-Z;.\/*,\[\];\(\)\\\n]/

def string_calculator(string)

  num_array_as_str = string.gsub(LOOK_FOR_SEPARATORS, ',').split(",")

  num_array_as_int = num_array_as_str.map { |num_as_str| num_as_str.to_i  }

  negatives_array = num_array_as_int.reject { |num_in_arr| num_in_arr >= 0 }

  if negatives_array.empty?
    num_array_as_int.inject(0){|num_in_arr, acumulator| num_in_arr + acumulator}
  else
    raise NegativesNotAllowed.new("#{negatives_array}")
  end
end
