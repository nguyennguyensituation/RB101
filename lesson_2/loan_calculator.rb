def valid_positive_number(num_string)
  (Float(num_string) != nil rescue false) && num_string.to_f.positive?
end

def remove_dollar_sign_and_commas(str)
  str = str.delete!("$ ,")
end

def remove_percentage_sign(str)
  str = str.delete!("% percent pct")
end

def remove_years(str)
  str = str.delete!("year years yr yrs")
end

puts 'Welcome to the Loan Calculator!'
sleep(1)

# Main loop
loop do
  # GET loan amount loop
  loan_amount = ''
  loop do
    puts 'How much do you want to borrow?'
    loan_amount = gets.chomp

    # check if valid number
    remove_dollar_sign_and_commas(loan_amount)
    break if valid_positive_number(loan_amount)
    puts 'Please enter a loan amount that is more than $0.'
  end

  # GET annual percentage rate loop
  annual_percentage = ''
  puts 'What\'s the annual percentage rate (APR)?'
  loop do
    annual_percentage = gets.chomp

    # check if valid number
    remove_percentage_sign(annual_percentage)
    break if valid_positive_number(annual_percentage)

    puts 'Please enter an annual percentage rate that is more than 0%.'
  end

  # GET loan duration loop
  loan_duration_in_years = ''
  puts 'How many years will it take you to repay the loan?'
  loop do
    loan_duration_in_years = gets.chomp

    # check if valid number
    remove_years(loan_duration_in_years)
    break if valid_positive_number(loan_duration_in_years)

    puts 'Please enter how many years it will take you to pay back the loan (e.g. 1.5, 5, 10)'
  end

  puts "Okay, I'm going to run some numbers..."
  sleep(0.5)
  puts '.'
  sleep(0.5)
  puts '.'
  sleep(0.5)
  puts '.'
  sleep(0.5)

  # calculate loan duration in months, monthly interest, and monthly payment
  loan_duration_in_months = loan_duration_in_years.to_f * 12

  monthly_percentage_float = (annual_percentage.to_f / 12) * 0.01

  monthly_percentage_string = ((annual_percentage.to_f / 12) * 10).round(2)

  monthly_payment = (loan_amount.to_f() * (monthly_percentage_float / (1 - (1 + monthly_percentage_float)**(-loan_duration_in_months)))).round(2)

  # show recap and calculation
  puts "===================SUMMARY===================="
  puts "Here's what you told me..."
  puts "-Loan amount: $#{format('%.2f', loan_amount)}"
  puts "-Annual percentage rate: #{annual_percentage}%"
  if loan_duration_in_years == "1"
    puts "-Loan duration: 1 year"
  else
    puts "-Loan duration: #{loan_duration_in_years} years"
  end
  sleep(3)
  puts "Based on that info, you'll pay $#{monthly_payment} every month for #{loan_duration_in_months.ceil} months. Your monthly percentage rate will be #{monthly_percentage_string}%"
  puts "=============================================="

  # repeat the process?
  puts 'Do you want to do another calculation? Enter Y to continue.'
  continue = gets.chomp
  if continue.downcase == "y" || continue.downcase == "yes"
    puts "Okay, one more time!"
  else
    puts "Thanks for using the Loan Calculator. Bye!"
    break
  end
end
