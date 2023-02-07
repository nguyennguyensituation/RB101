INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(message)
  puts "=> #{message}"
end

# rubocop:disable  Metrics/AbcSize
def display_board(brd)
  system "clear"
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop:enable  Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, punctuation = ',', last_word = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{last_word} ")
  else
    arr[-1] = "#{last_word} #{arr[-1]}"
    arr.join("#{punctuation} ")
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "Sorry, that's not a valid choice."
    end
  end

  brd[square] = PLAYER_MARKER
end

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diags

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def find_winning_square(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).count(' ') == 1
      return line & empty_squares(brd)
    else
      false
    end
  end
end

def computer_places_piece!(brd)
  square = if find_winning_square(brd, COMPUTER_MARKER).size == 1
             find_winning_square(brd, COMPUTER_MARKER).first
           elsif find_winning_square(brd, PLAYER_MARKER).size == 1
             find_winning_square(brd, PLAYER_MARKER).first
           elsif empty_squares(brd).include?(5)
             5
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
  display_board(brd)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def play_piece!(brd, current_player)
  case current_player
  when "p"
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'p' ? 'c' : 'p'
end

player_score = 0
computer_score = 0

prompt "Who should go first? (Enter (P)layer or (C)omputer)"
current_player = gets.chomp.downcase[0]

loop do
  board = initialize_board

  loop do
    display_board(board)
    play_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    case detect_winner(board)
    when "Player" then player_score += 1
    when "Computer" then computer_score += 1
    end
  else
    prompt "It's a tie!"
  end

  prompt "Player: #{player_score} | Computer: #{computer_score}"
  prompt "You won the game!" if player_score == 5
  prompt "The computer won the game!" if computer_score == 5

  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

  if player_score == 5 || computer_score == 5
    player_score = 0
    computer_score = 0
  end
end

prompt "Thanks for playing Tic Tac Toe! Bye!"
