=begin
1. LONGEST SENTENCE

def longest_sentence(text)
  arr = text.split(/(\. |\? |\! )/)
  count = arr.map.with_index { |sentence, idx| [idx, sentence.split.size] }
  longest = count.max_by { |sentence| sentence.last }.first
  arr[longest]
end

2. NOW I KNOW MY ABCS
def block_word?(word)
  blocks = ['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 'JW', 'HU', 'VI', 'LY', 'ZM']
  arr = word.upcase.chars
  result = []

  arr.each do |char|
    blocks.each do |block|
      result << block if block.include?(char)
    end
  end

  result.uniq == result
end

3. LETTERCASE PERCENTAGE RATIO

def letter_percentages(str)
  total = str.size.to_f
  lower = str.scan(/[a-z]/).size /  total * 100
  upper = str.scan(/[A-Z]/).size / total * 100
  none = 100 - lower - upper
  { :lowercase => lower, :uppercase => upper, :neither => none }
end

4. MATCHNG PARENTHESES? 

def balanced?(str)
  arr = str.scan(/\(|\)/)
  return false if arr.size.odd? || arr.first == ')' || arr.last == '('
  count = 0
  arr.each do |char| 
    char == '(' ? count += 1 : count -= 1 
    return false if count < 0
  end
  count.zero?
end

5. TRIANGLE SIDES

def triangle(a, b, c)
  arr = [a, b, c].sort
  return :invalid if arr.first <= 0 || (arr[0] + arr[1]) < arr[2]

  case arr.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  else :scalene
  end
end

6. TRI-ANGLES

def triangle(a, b, c)
  arr = [a, b, c]

  if arr.sum != 180 || arr.any? {|angle| angle <= 0 }
    :invalid
  elsif arr.any?(90)
    :right
  elsif arr.any? {|angle| angle > 90 }
    :obtuse
  else
    :acute
  end
end

7. UNLUCKY DAYS

require 'date'

def friday_13th(year)
  count = 0
  for month in 1..12 do count += 1 if Date.new(year, month, 13).friday? end
  count
end

8. NEXT FEATURED NUMBER HIGHER THAN A GIVEN VALUE

def is_featured?(num)
  num.odd? && num % 7 == 0 && num.digits.reverse.uniq.join.to_i == num
end

def featured(num)
  loop do
    num += 1
    break if num >= 9_876_543_210
    return num if is_featured?(num)
  end
  'Error'
end


7. BUBBLE SORT

def bubble_sort!(arr)
  loop do
    swapped = false
    for i in 0..(arr.size - 2) do
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
    break if swapped == false
  end
  arr
end

8. SUM SQUARE - SQUARE SUM

def sum_square_difference(num)
  arr = (1..num).to_a
  (arr.sum ** 2) - arr.map { |num| num ** 2 }.sum
end

9. 
=end



