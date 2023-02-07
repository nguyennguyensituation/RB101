=begin
# 1. Short Long Short

def short_long_short(str1, str2)
  str1.size < str2.size ? str1 + str2 + str1 : str2 + str1 + str2
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

#2  What Century is That?

def century(year)
  century = (year / 100).ceil.to_s

  if century[-2] == '1'
    century + 'th'
  elsif century[-1] == '1'
    century + 'st'
  elsif century[-1] == '2'
    century + 'nd'
  elsif century[-1] == '3'
    century + 'rd'
  else 
    century + 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

# 3. Leap Years (Part 1)

def leap_year?(year)
  (year % 4 == 0 && !(year % 100 == 0)) || year % 400 == 0
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# 4. Leap Years (Part 2)

def leap_year?(year)
  if year < 1752
    year % 4
  else
    (year % 4 == 0 && !(year % 100 == 0)) || year % 400 == 0
  end
end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

# 5. Multiples of 3 and 5

def multisum(num)
  (1..num).each_with_object([]) do |num, arr|
    arr << num if num % 3 == 0 || num % 5 == 0
  end.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

# 6. Running totals

def running_total(arr)
  result = []
  for i in 0..arr.size - 1 do result << arr.slice(0..i).sum end
  result
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# 7. Convert a String to a Number!

def string_to_integer(str)
  digits = (('0'..'9').to_a).zip((0..9).to_a).to_h
  num_arr = str.chars.map { |char| digits[char] }.reverse

  sum = num_arr.shift
  place = 10

  num_arr.each do |digit| 
    sum += digit * place
    place *= 10
  end
  sum
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# 8. Convert a String to a Signed Number!

def string_to_integer(str)
  digits = (('0'..'9').to_a).zip((0..9).to_a).to_h
  num_arr = str.chars.map { |char| digits[char] }.reverse

  sum = num_arr.shift
  place = 10

  num_arr.each do |digit| 
    sum += digit * place
    place *= 10
  end
  sum
end

def string_to_signed_integer(str)
  num = string_to_integer(str.delete('^0-9'))
  str[0] == '-'?  -num : num
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# 9. Convert a Number to a String!

def integer_to_string(int)
  hash = (0..9).to_a.zip(('0'..'9').to_a).to_h

  int.digits.reverse.map { |num| hash[num] }.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# 10. Convert a Signed Number to a String!

def integer_to_string(int)
  hash = (0..9).to_a.zip(('0'..'9').to_a).to_h
  int.digits.reverse.map { |num| hash[num] }.join
end

def signed_integer_to_string(int)
  if int.negative?
    "-#{integer_to_string(-int)}"
  elsif int.zero?
    '0'
  else
    "+#{integer_to_string(int)}"
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'


=end

