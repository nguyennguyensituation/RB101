require 'yaml'
MESSAGES = YAML.load_file('rps.yml')

def prompt(message)
  puts "=> #{message}"
end

VALID_CHOICES = %w(rock paper scissors spock lizard)

def set_choice(input)
  case input.downcase
  when 'r'
    'rock' 
  when 'p'
    'paper'
  when 's'
    'scissors'
  when 'k'
    'spock'
  when 'l'
    'lizard'
  else
    'invalid'
  end
end

winning_combinations = {
  'rock': ['lizard', 'scissors'],
  'paper': ['rock', 'spock'],
  'scissors': ['lizard', 'paper'],
  'lizard': ['paper', 'spock'],
  'spock': ['scissors', 'rock']
}

def calculate_result(hash, user, computer)
  a = hash.fetch(user.to_sym)

  if a.include?(computer)
    "You won!"
  elsif user == computer
    "It's a tie!"
  else
    "You lost!"
  end
end

user_score = 0
computer_score = 0
round = 0

puts ""
prompt(MESSAGES['welcome'])
puts ""
sleep(1)

# MAIN LOOP
loop do
  choice = ''
  round += 1
  puts MESSAGES['dashed_line']
  puts ""
  prompt("ROUND #{round}")

  # SET CHOICES
  loop do
    prompt(MESSAGES['choose'])
    choice = set_choice(gets.chomp)

    break unless choice == 'invalid'
    prompt(MESSAGES['invalid'])
  end
  sleep(0.5)

  computer_choice = VALID_CHOICES.sample
  result = calculate_result(winning_combinations, choice, computer_choice)

  # SHOW RESULTS
  prompt(format(MESSAGES['your_choice'], choice: choice))
  prompt(format(MESSAGES['computer_choice'], computer_choice: computer_choice))
  prompt(result)
  sleep(1)

  # SHOW SCORE
  if result == "You won!"
    user_score += 1
  elsif result == "You lost!"
    computer_score += 1
  else
    'tie'
  end

  puts ""
  prompt(MESSAGES['tally'])
  prompt("You: #{user_score}")
  prompt("Computer: #{computer_score}")
  puts ""
  sleep(1)

  # ASK IF YOU WANT TO CONTINUE
  if user_score == 3 || computer_score == 3
    puts MESSAGES['starred_line']

    if user_score == 3
      prompt(format(MESSAGES['you_won'], round: round))
    else
      prompt(format(MESSAGES['computer_won'], round: round))
    end

    prompt(MESSAGES['continue'])
    answer = gets.chomp

    if answer.downcase.start_with?('y')
      prompt(MESSAGES['play_again'])
      user_score = 0
      computer_score = 0
      round = 0
    else
      prompt(MESSAGES['thanks'])
      break
    end
  end
end
