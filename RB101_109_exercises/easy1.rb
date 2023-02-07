#1. Repeat yourself

def repeat(str, n)
  n.times { puts str }
end

2. Odd
def is_odd?(n)
  n.odd?
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# 3. Stringy Strings

def stringy(num)
  result = ''
  for i in 1..num do i.odd? ? result << '1' : result << '0' end
  result
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# 4. What's my bonus?

def calculate_bonus(salary, bool)
  bool ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

# 5. Bannerizer
def print_in_box(str)
  outer = "+-" + ("-" * str.size) + "-+"
  inner = "| " + (" " * str.size) + " |"
  center = "| " + str + " |"
  puts outer, inner, center, inner, outer
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

# 6. Right Triangles

def triangle(n)
  for i in 1..n do puts ' ' * (n - i) + '*' * i end
end

triangle(5)
triangle(9)

# 7. Madlibs

puts "Enter a noun:"
noun = gets.chomp

puts "Enter a verb:"
verb = gets.chomp

puts "Enter an adjective:"
adjective = gets.chomp

puts "Enter an adverb:"
adverb = gets.chomp

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"

# 8. Reverse the Digits in a Number

def reversed_number(num)
  num.digits.join.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

# 9. Get Middle Character

def center_of(str)
  center = str.size / 2
  str.size.odd? ? str[center] : str.slice(center-1..center)
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'


