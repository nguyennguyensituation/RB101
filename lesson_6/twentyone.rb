require 'yaml'
MESSAGES = YAML.load_file('blackjack_messages.yml')
SUITS = %w(❤ ◆ ♠ ♣)
CARDS = (2..10).to_a + %w(A K Q J)
BLACKJACK = 21
DEALER_MIN = 17

def prompt(message)
  puts "=> #{message}"
  sleep(1.2)
end

def new_game
  system "clear"
  prompt(MESSAGES['welcome'])
  sleep(0.5)
end

def new_deck
  deck = []
  SUITS.each do |suit|
    CARDS.each do |card|
      deck << if card.is_a?(Integer)
                ["[#{suit} #{card}]", card]
              elsif card == "A"
                ["[#{suit} #{card}]", 11]
              else
                ["[#{suit} #{card}]", 10]
              end
    end
  end
  deck.shuffle!
end

def new_bet(account)
  loop do
    puts(format(MESSAGES['pre_bet_balance'],
                balance: account[:balance],
                bet: account[:bet]))
    prompt(MESSAGES['ask_bet'])
    account[:bet] = gets.chomp.to_i
    break if account[:bet] >= 0 && account[:bet] <= account[:balance]
    prompt(MESSAGES['invalid_bet'])
  end
end

def draw(deck, hand)
  hand << deck.pop
end

def deal_cards(deck, player_hand, dealer_hand)
  2.times do
    draw(deck, player_hand)
    draw(deck, dealer_hand)
  end
end

# Returns a string of the cards of a given hand, minus the first card
def remaining_cards(hand)
  cards = ""
  index = 1
  (hand.size - 1).times do
    cards << " + #{hand[index].first}"
    index += 1
  end
  cards
end

def show_table(player_hand, dealer_hand, current_turn, account)
  system "clear"
  player_remaining_cards = remaining_cards(player_hand)
  dealer_remaining_cards = remaining_cards(dealer_hand)
  if current_turn == 'player'
    puts(format(MESSAGES['player_turn_table'],
                balance: account[:balance],
                bet: account[:bet],
                dealer_cards_hidden: dealer_hand[0][0] + '+ [ ? ]',
                player_cards: player_hand[0][0] + player_remaining_cards))
  else
    puts(format(MESSAGES['dealer_turn_table'],
                balance: account[:balance],
                bet: account[:bet],
                dealer_cards: dealer_hand[0][0] + dealer_remaining_cards,
                player_cards: player_hand[0][0] + player_remaining_cards))
  end
end

def calculate_score(hand)
  sum = 0
  hand.each_with_index { |_, index| sum += hand[index][1] }
  hand.flatten.join.include?("A") && sum > BLACKJACK ? sum -= 10 : sum
end

def determine_winner(player_score, dealer_score)
  if player_score > BLACKJACK
    "dealer"
  elsif dealer_score <= BLACKJACK && player_score < dealer_score
    "dealer"
  elsif player_score <= BLACKJACK && dealer_score < player_score
    "player"
  else
    "tie"
  end
end

def winner_announcement(winner)
  case winner
  when "player" then prompt(MESSAGES['player_win'])
  when "dealer" then prompt(MESSAGES['dealer_win'])
  else prompt(MESSAGES['tie'])
  end
end

def calculate_balance(winner, account)
  case winner
  when "player" then account[:balance] += account[:bet]
  when "dealer" then account[:balance] -= account[:bet]
  end

  account[:bet] = nil
end

def play_again?(account)
  if account[:balance] > 0
    prompt(MESSAGES['play_again'])
    keep_playing = gets.chomp
    keep_playing.downcase.start_with?('y')
  else
    prompt(MESSAGES['game_over'])
    false
  end
end

# Start new game
new_game
account = { balance: 100, bet: '--' }

# Create new deck, deal cards
loop do
  deck = new_deck
  player_hand, dealer_hand = [], []
  player_score, dealer_score = 0, 0
  account[:bet] = '--'
  deal_cards(deck, player_hand, dealer_hand)
  current_turn = "player"

  # Place new bet
  new_bet(account)
  show_table(player_hand, dealer_hand, current_turn, account)

  # Player turn
  loop do
    player_score = calculate_score(player_hand)
    prompt(format(MESSAGES['player_score'], score: player_score))
    if player_score == BLACKJACK
      prompt(MESSAGES['player_blackjack'])
      break
    elsif player_score > BLACKJACK
      prompt(MESSAGES['player_bust'])
      break
    else
      prompt(MESSAGES['player_hit_or_stay'])
      hit_or_stay = gets.chomp.downcase[0]
      if hit_or_stay == "s"
        prompt(MESSAGES['player_stay'])
        break
      else
        draw(deck, player_hand)
        prompt(format(MESSAGES['player_draw'], card: player_hand.last[0]))
        show_table(player_hand, dealer_hand, current_turn, account)
      end
    end
  end

  # Show dealer cards
  current_turn = "dealer"
  if player_score <= BLACKJACK
    prompt(MESSAGES['dealer_reveal'])
    show_table(player_hand, dealer_hand, current_turn, account)
  end

  # Dealer turn
  loop do
    dealer_score = calculate_score(dealer_hand)
    prompt "Dealer total: #{dealer_score}"
    if player_score > BLACKJACK
      break
    elsif dealer_score == BLACKJACK
      prompt(MESSAGES['dealer_blackjack'])
      break
    elsif dealer_score < BLACKJACK && dealer_score >= DEALER_MIN
      prompt(MESSAGES['dealer_stay'])
      break
    elsif dealer_score > BLACKJACK
      prompt(MESSAGES['dealer_bust'])
      break
    else
      prompt(MESSAGES['dealer_hit'])
      draw(deck, dealer_hand)
      show_table(player_hand, dealer_hand, current_turn, account)
    end
  end

  # Determine winner
  winner = determine_winner(player_score, dealer_score)
  winner_announcement(winner)
  calculate_balance(winner, account)

  show_table(player_hand, dealer_hand, current_turn, account)

  # Play again?
  break unless play_again?(account)
  system "clear"
end

prompt(MESSAGES['goodbye'])
