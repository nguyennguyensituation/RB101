=begin
1. Countdown

counter = 10

counter.times do |i|
  puts counter - i
end

puts 'LAUNCH!'

2. HEY YOU!

def shout_out_to(name)
  puts 'HEY ' + name.upcase
end

shout_out_to('you') # expected: 'HEY YOU'

3. Valid Series

# Debugged and refactored solution: 

def valid_series?(nums)
  nums.sum == 47 && nums.count { |n| n.odd? } == 3
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false

4. Reverse sentence


def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words.unshift(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

5. Card Deck

# Refactored

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

# Return the value of the card number/face value

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Create an array of 4 cards, one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.sample
end

# Determine the score of the remaining cards in the deck
deck_total = 380

p deck_total - player_cards.map { |card| score(card) }.sum

6. Getting Things Done

def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

7. Neutralizer

def neutralize(sentence)
  words = sentence.split
  words.reject { |word| negative?(word) }.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

8. Password

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  puts input == password ? 'Welcome to the inside!' : 'Authentication failed.'
end

password = set_password if !password

verify_password(password)

9. Number Guessing Game

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
      # guess_number(max_number, max_attempts)
    end
  end
end

guess_number(10, 3)

10. TF-IDF

def tfidf(term, document, documents)
  tf(term, document) * idf(term, documents)
end

def tf(term, document)
  document.split(/[\s,.-]/).count { |word| word.downcase == term }
end

def idf(term, documents)
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }
  return 0 if number_of_documents_with_term == 0
  number_of_documents = documents.length
  Math.log(number_of_documents.fdiv(number_of_documents_with_term))
end

11. What's wrong with the output?

arr = ["9", "8", "7", "10", "11"]
p arr.sort { |x, y| y.to_i <=> x.to_i }

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 

=end




