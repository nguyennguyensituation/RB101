=begin

1. ROTATION (PART 1)

def rotate_array(arr)
  result = arr.clone
  result << result.shift
end

2. ROTATION (PART 2)

# Standalone solution

def rotate_rightmost_digits(num, place)
  arr = num.digits.reverse
  arr << arr.delete_at(-place)
  arr.join.to_i
end

# Solution referencing rotate_array method

def rotate_rightmost_digits(num, place)
  arr = num.digits.reverse
  arr[-place..-1] = rotate_array(arr[-place..-1])
  arr.join.to_i
end

3. ROTATION (PART 3)

def max_rotation(num)
  result = []
  arr = num.to_s.chars

  loop do
    arr = rotate_array(arr)
    result << arr.shift
    break if arr.empty?
  end
  result.join.to_i
end

4. 1000 LIGHTS

def lights(switches)
  result = [false] * switches

  for i in 1..switches do
    result = result.map.with_index do |switch, idx|
      (idx + 1) % i == 0 ? !switch : switch
    end
  end

  result.map.with_index { |switch, idx| switch ? idx + 1 : result.delete(idx) }.compact
end

5. DIAMONDS

def diamond(width)
  center = 1
  outer = width / 2
  fill = []

  outer.times do
    row = (" " * outer) + ("*" * center) + (" " * outer)
    outer -= 1
    center += 2
    fill << row
  end

  middle = "*" * width

  puts fill, middle, fill.reverse
end

6. STACK MACHINE INTERPRETATION

def minilang(program)
  stack = []
  register = 0
  commands = program.split

  commands.each do |command|
    case command
    when 'PRINT' then puts register
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'ADD'   then register += stack.pop
    when 'SUB'   then register -= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MOD'   then register %= stack.pop
    else              register = command.to_i
    end
  end
end

7. WORD TO DIGIT

DIGITS = %W(zero one two three four five six seven eight nine)

def word_to_digit(str)
  result = str.split(/\b/)
  result.map { |word| DIGITS.include?(word) ? DIGITS.find_index(word) : word }.join
end

8. FIBONACCI NUMBERS (RECURSION)

def fibonacci(n)
  return 1 if n < 3
  fibonacci(n - 1) + fibonacci(n - 2)
end

9. FIBONACCI NUMBERS (PROCEDURAL)

def fibonacci(n)
  result = [1, 1]

  (n - 2).times do result << result[-1] + result[-2]end

  result.last
end

10. FIBONACCI NUMBERS (LAST DIGIT)

def fibonacci(n)
  result = [1, 1]
  (n - 2).times do result << result[-1] + result[-2]end
  result.last
end

def fibonacci_last(num)
  fibonacci(num).digits.first
end

=end

