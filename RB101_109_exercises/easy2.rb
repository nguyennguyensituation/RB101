=begin
# 1. How old is Teddy?

puts "Teddy is #{rand(20..200)} years old!"

# 2. How big is the room?

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

meters_to_square_feet = 10.7639

puts "The area of the room is #{length * width} (#{(length * width) * meters_to_square_feet}} square feet) "

# 3. Tip Calculator

puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
percentage = (gets.chomp.to_f) * 0.01

puts "The tip is #{bill * percentage}"
puts "The total is $#{bill + (bill * percentage)}"

# 4. When will I Retire?

puts "What is your age?"
current_age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

require 'date'
current_year = Time.now.year
years_to_retirement = retirement_age - current_age

puts "It's #{current_year}. You will retire in #{current_year + years_to_retirement}."
puts "You only have #{years_to_retirement} years of work to go!"

# 5. Greeting a user

puts "What is your name?"
name = gets.chomp

if name[-1] == '!'
  puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# 6 Odd Numbers

for i in 1..99 do puts i if i.odd? end

# 7. Even numbers

for i in 1..99 do puts i if i.even? end

# 8 Sum or Product of Consecutive Integers

puts "Please enter an integer greater than 0:"
integer = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

sum = (1..integer).to_a.inject(:+)
product = (1..integer).to_a.inject(:*)

if operation == 's'
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
else
  puts "The product of the integers between 1 and #{integer} is #{product}."
end

# 9 String Assignment

In the first example, the variable save_name is assigned to the value of name, which is 'Bob'. On line 3, we reassign name to the new string value 'Alice'. 

When we print the values of name and save_name, we see this:

'Alice'
'Bob'

The value of name was reassigned to 'Alice', but the value of save_name is still pointing at the string value it was originally assigned to.

In the second example, save_name and name are both pointing to the same string object. When we call the upcase! method on name, we mutate that string object that both name and save_name are pointing to.

#10 Always Return Negative

def negative(n)
  -n.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0

=end



