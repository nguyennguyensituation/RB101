=begin

Question 1:

ages = { "Spot" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

Any of these options would work:

  puts ages.include?('Spot') ? true : false
  puts ages.assoc('Spot') ? true : false
  puts ages['Spot'] ? true : false
  puts ages.key?('Spot') ? true : false
  puts ages.member?('Spot') ? true : false

Question 2:

munsters_description = "The Munsters are creepy in a good way."

"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."

  munsters_description.swapcase!

"The munsters are creepy in a good way."
  
  munsters_description.capitalize!

"the munsters are creepy in a good way."
  
  munsters_description.downcase!

"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
  
  munsters_description.upcase!

Question 3:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

  ages.merge!(additional_ages)

ages << additional_ages


Q4

advice = "Few things in life are as important as house training your pet dinosaur."

  advice.include?('Dino')

  advice.match?('Dino')

Question 5:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

Question 6:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

  flintstones << "Dino"

  


Question 7:

  flintstones += ["Dino", "Hoppy"]

  OR

  flintstones.push("Dino").push("Hoppy")

  OR
  
  flinstones.concat(%w(Dino Hoppy))

Question 8:

advice = "Few things in life are as important as house training your pet dinosaur."

  advice.slice!(0, advice.index('house'))
  
  Returns the text and mutates the original string by removing the argument passed to slice.

  Without the !, returns the text, doesn't alter the original string

Question 9:

statement = "The Flintstones Rock Rock!"

  statement.scan(/t/).length

  OR 


Question 10:

title = "Flintstone Family Members"

  title.center(40)
  
=end




