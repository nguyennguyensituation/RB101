=begin
# 1. Searching 101

puts "==> Enter the 1st number:"
num1 = gets.chomp.to_i

puts "==> Enter the 2nd number:"
num2 = gets.chomp.to_i

puts "==> Enter the 3rd number:"
num3 = gets.chomp.to_i

puts "==> Enter the 4th number:"
num4 = gets.chomp.to_i

puts "==> Enter the 5th number:"
num5 = gets.chomp.to_i

puts "==> Enter the last number:"
num6 = gets.chomp.to_i

array = [num1, num2, num3, num4, num5]

if array.include?(num6)
  puts "The number #{num6} appears in #{array}."
else
  puts "The number #{num6} does not appear in #{array}."
end

# 2. Arithmetic Integer

puts "==> Enter the first number:"
num1 = gets.chomp.to_i

puts "==> Enter the second number:"
num2 = gets.chomp.to_i

puts "==> #{num1} + #{num2} = #{num1 + num2}"
puts "==> #{num1} - #{num2} = #{num1 - num2}"
puts "==> #{num1} * #{num2} = #{num1 * num2}"
puts "==> #{num1} / #{num2} = #{num1 / num2}"
puts "==> #{num1} % #{num2} = #{num1 % num2}"
puts "==> #{num1} ** #{num2} = #{num1 ** num2}"

# 3. Counting the Number of Characters
puts "Please write word or multiple words:"
string = gets.chomp

num_chars = string.delete(' ').size

puts "There are #{num_chars} characters in \"#{string}\"."

# 4. Multiplying two numbers

def multiply(num1, num2)
  num1 * num2
end

p multiply(5, 3)

# 5. Squaring an Argument

def square(num)
  num ** 2
end

p square(5)
p square(-8)

# 6 Exclusive Or
def xor?(arg1, arg2)
  (arg1 && !arg2) || (!arg1 && arg2)
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# 7. Palindromic Strings (Part 1)

def palindrome?(str)
  str == str.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

#8 Palindromic Strings (Part 2)

def palindrome?(str)
  str == str.reverse
end

def real_palindrome?(str)
  clean = str.downcase.delete('^a-z0-9')
  palindrome?(clean)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

# 9 Palindromic Numbers

def palindromic_number?(num)
  num == num.digits.join.to_i
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# 10. Uppercase Check

def uppercase?(str)
  str == str.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

=end





