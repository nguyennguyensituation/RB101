require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def operation_to_message(operand)
  case operand
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES['welcome'])
name = gets.chomp

# main loop
loop do
  # name loop
  loop do
    if name.empty?
      prompt(MESSAGES['invalid_name'])
      name = gets.chomp
    else
      prompt(format(MESSAGES['greeting'], name: name))
      break
    end
  end

  number1 = nil
  number2 = nil
  operator = nil
  # number1 loop
  loop do
    prompt(MESSAGES['first_number'])
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  # number2 loop
  loop do
    prompt(MESSAGES['second_number'])
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  operator_prompt = <<-MSG
What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  # operator loop
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['invalid_operator'])
    end
  end

  prompt(MESSAGES['calculating'])

  sleep(1)

  result =
    case operator
    when '1'
      number1.to_i + number2.to_i
    when '2'
      number1.to_i - number2.to_i
    when '3'
      number1.to_i * number2.to_i
    when '4'
      number1.to_f / number2.to_f
    end
  prompt(format(MESSAGES['show_result'], result: result))
  # ask user to continue or stop
  prompt(MESSAGES['ask_continue'])
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end
prompt(MESSAGES['goodbye'])
