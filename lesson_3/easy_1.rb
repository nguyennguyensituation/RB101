=begin
Question 1: 
What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

  This should output

  1
  2
  2
  3

  uniq returns a new array that would remove duplicates, but does not mutate the original array.


Question 2: 
Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

1. what is != and where should you use it?

  This means "does not equal" and it would be used in a conditional.

2. put ! before something, like !user_name

  turns any object to the opposite of their boolean equivalent

3. put ! after something, like words.uniq!

  This takes an array (words) and mutates it by removing any duplicates from the original array.

4. put ? before something

  Used in a ternary. It's checking if the condition preceding the question mark is true.

5. put ? after something

  Used in a ternary — it's checking if the condition preceding the question mark is true.

  Also could be used a method name.

6. put !! before something, like !!user_name

  turns any object into their boolean equivalent

Question 3: 
Replace the word "important" with "urgent" in this string:

  advice = "Few things in life are as important as house training your pet dinosaur."


A few options:

  advice = advice.sub("important", "urgent")

  advice.sub!("important", "urgent")

  advice.gsub("important", "urgent")

  advice["important"] = "urgent"
  =end

Question 4: 
The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
  returns the value at the 1 index (in this case, 2) and removes it from the original numbers array.

  numbers = [1, 3, 4, 5]

numbers.delete(1)
  returns the value passed in as an argument (1) and removes it from the original numbers array.

  numbers = [2, 3, 4, 5]

Question 5:
Programmatically determine if 42 lies between 10 and 100.

  (10..100).include?(42) 

  or

  (10..100).cover?(42) 


Question 6: 
Starting with the string:

famous_words = "seven years ago..."

show two different ways to put the expected "Four score and " in front of it.

  "Four score and " + famous_words

  OR

  famous_words.prepend("Four score and ")

  OR

  "Four score and " << famous_words

Question 7:
If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

  flintstones.flatten!


Question 8:
Given the hash below
flintstones = { 
  "Fred" => 0, 
  "Wilma" => 1, 
  "Barney" => 2, 
  "Betty" => 3, 
  "BamBam" => 4, 
  "Pebbles" => 5 
}

Turn this into an array containing only two elements: Barney's name and Barney's number

  new_array = flintstones.select{|key, value| key ==  "Barney"}

  OR

  new_array = flintstones.assoc("Barney")

=end
