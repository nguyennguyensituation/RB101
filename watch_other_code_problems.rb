
=begin

Problem 1:
Reverse a string without using the built-in #reverse method

Given a string, return the string in reverse order without using the built-in reverse method.

def reverse_string(string)
  result = []
  i = string.size. - 1

  loop do
    break if i < 0
    result << string[i]
    i -= 1
  end

  result.join
end

-------------------------------------------------------------------------------
Problem 2: 
Fizzbuzz

write a method that takes two arguments: the first is the starting number, and the second is the ending number. 

Print out all numbers between the two numbers except 
  if a number is divisible by 3, print out "Fizz", 
  if a number is divisible by 5, print out "Buzz", 
  and if a number is divisible by 3 and 5, print out "FizzBuzz".

PROBLEM

-Given two numbers (start, end)
-Print all the numbers in that range
    - If it is divisible by 3 & 5, print "FizzBuzz"
    - If it is divisible by 3, print "Fizz"
    - If it is divisible by 5, print "Buzz"

DATA
Array, integer, string

ALGORITHM
- Initialize a variable ('arr') to an array that contains all the numbers between start and end
- Iterate through the array. For each number...
    - Check if divisible by 3 & 5
      - Print "Fizzbuzz"
    - Check if divisible by 3
      - Print "Fizz"
    - Check if divisible by 5
      - Print "Buzz"
    - Else
      - Print number

CODE

def fizzbuzz(num1, num2)
  arr = (num1..num2).to_a
  arr.each do |num|
    if num % 3 == 0 && num % 5 == 0
      puts "Fizzbuzz"
    elsif num % 3 == 0
      puts "Fizz"
    elsif num % 5 == 0
      puts "Buzz"
    else
      puts num
    end
  end
end

-------------------------------------------------------------------------------
Problem 3: 
Product search

PROBLEM
- Given a hash with three keys (minimum price, maximum price, q)
- Search throuh the PRODUCTS array and return an array that contains the hash or hashes that fit the criteria outlined in the input hash

DATA
Hash, array, number, string

ALGORITHM
- Initialize an empty results array
- Iterate through the product array and add the hashes where the name includes q to the results array
- Iterate through results array and reject any hash where the price does not fall within the range outlined in the input argument
- Return the results array

CODE
def search(query)
  PRODUCTS.select do |hash|
    hash[:name].downcase.include?(query[:q]) &&
    (query[:price_min]..query[:price_max]).include?(hash[:price])
  end
end

-------------------------------------------------------------------------------
Problem 1: 
Remove vowels from an array of strings

Write a method that takes an array of strings and returns an array of the same string values, except with the vowels removed.

PROBLEM
- Given an array of strings
- Return an array of the same string values with the vowels removed

DATA
- Array, string

ALGORITHM
- Iterate through the input array. For each word...
  - Replace every instance of a vowel with ''
  - Return the transformed array

CODE
def remove_vowels(arr)
  arr.map { |word| word.gsub(/[aeiou]/, '')}
end

-------------------------------------------------------------------------------

Problem 2: 
Balancer

Write a method that takes a string and returns a boolean indicating if this string has a balanced set of parentheses.

PROBLEM
- Given a string...
- Return a boolean
  - True if the string is "balanced"
    - String is "balanced" if... 
      - It contains an equal number of opening and closing parentheses
      - The first parenthesis can not be a closing parenthesis

CODE

def balancer(str)
  sum = 0
  str.chars.each do |char|
    case char
    when '(' then sum += 1
    when ')' then sum -= 1
    end
    return false if sum < 0
  end
  sum.zero? ? true : false
end

-------------------------------------------------------------------------------

Problem 3: find primes between two numbers
# Write a method that takes two numbers. Return an array containing all primes between the two numbers (include the two given numbers in your answer if they are prime). Don't use Ruby's 'prime' class.

PROBLEM
- Given 2 numbers
- Return an array that contains all that prime numbers between that range
  - Prime number: A number that can be evenly divided only by itself and 1
    - must be odd
    - can't end in 5
    - sum of digits cannot be evenly divisible by 3
    - Find square root of 
DATA
- Integer, array

ALGORITHM
-Split this into two methods:
  - is_prime? to determine whether this is a prime number
  - find_primes to create an array of all the prime numbers within the given range

is_prime?
- Return false if the number == 1
- Return true if the number == 2, 3, or 5
- Iterate through all the numbers from 2 through num. For each denominator...
  check if the number % denominator == 0
  if so, return false
-Return true

find_primes
- Initialize a var ('arr') to an array of all the numbers between start and stop
- Iterate through the array using the select method. For each number...
    - Pass it as an argument to the is_prime? method and select it if it returns true

CODE
def is_prime?(num)
  return false if num == 1
  return true if num == 2 || num == 5

  for d in (2...num) do return false if num % d == 0 end
  true

end

def find_primes(start, stop)
  arr = (start..stop).to_a
  arr.select do |num| is_prime?(num) end
end

-------------------------------------------------------------------------------
REPEATED SUBSTRING

Given a non-empty string, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only.

PROBLEM
- Given a string (not empty, all lowercase)
- Return a boolean
  - True if a substring of repeated x times == the string

DATA
- String, Array

ALGORITHM
- Create an array of all the possible substrings starting at the 0 index in the string, from 1 character long, up to half the size of the input string

- Iterate through the substrings array. For each substring...
  - Multiply by x
    - Return true if if the substring multiplied by x is equal the string
    - Else, increment x by 1
    - Break if the multiplied substring size is greater than the input string size
- Return false

Example 1:
 - Input "abab"
 - Output: True
 - Explanation: It's the substring 'ab' twice.

Example 2:
 - Input: "aba"
 - Output: False

def create_substrings(str)
  substrings = []
  for i in 0..(str.size / 2) do
    substrings << str.slice(0..i)
  end
  substrings
end

def repeated_substring(str)
  substrings = create_substrings(str)

  substrings.each do |substring|
    multiplier = 2
    loop do
      return true if substring * multiplier == str
      multiplier += 1
      break if (substring * multiplier).size > str.size
    end
    multiplier = 0
  end

  false
end


# Alternative solution
def repeated_substring(str)
  (1..str.size / 2).each do |x|
    arr = str.scan(/\w{#{x}}/)
    return true if arr.uniq.size == 1 && arr.join == str
  end
  false
end

-------------------------------------------------------------------------------
COMMON CHARS

Given an array of strings made only from lowercase letters, return an array of all characters that show up in all strings within the given array (including duplicates). For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.

PROBLEM
- Given an array (strings, all lowercase)
- Return an array of all the chars that appear in all the strings in a given array
  - Include the duplicates

DATA
- Array, strings

ALGORITHM
- Find the shortest string and remove it from the array
- Initialize a var ('result') to an empty array
- Iterate through the string. For each char...
  - If all words in the array include the char
    - Add the char to the result array
    - Delete the first instance of that char from the words in the array
- Return the result array

CODE
def common_chars(arr)
  # remove the first word from the input array, create an array of unique chars
  first_word = arr.shift.chars.uniq

  # create an array of common chars that appear in all the words in the array
  common_chars = first_word.select { |char| arr.all? { |word| word.include?(char) }}

  # for each char, create a subarray that contains the character and the minimum number of times it appears in a word in the array
  counts = common_chars.map { |char| [char, arr.map { |word| word.count(char) }.min] }

  # multiply the character by the minimum number of times it appears and then flatten the array
  counts.map { |letter| (letter.first * letter.last).chars }.flatten
end

-------------------------------------------------------------------------------
NEXT BIGGEST NUMBER

You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits:

PROBLEM
- Given an positive integer number
- Return the next bigger number composed of the digits in the input number
  - If it's not possible, return -1

ALGORITHM
- Return -1 if num is less than 10
- Find the max possible value by...
  - Split the number into an array of digits, sorting, joining, and converting to integer
  - Return -1 if input num == max possible value
- Iterate from the current number to the max possible value. For each number...
  - Return the number if the number contains all the digits of the input number
- Return -1

def next_bigger_num(num)
  return -1 if num < 10
  max_value = num.digits.sort.reverse.join.to_i

  return -1 if num == max_value

  for i in (num + 1)..max_value do
    return i if i.digits.sort == num.digits.sort
  end
  -1
end

-------------------------------------------------------------------------------
MAX SEQUENCE

The maximum sum subarray problem consists of finding the maximum sum of a contiguous subsequence in an array of integers.

Example:
max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 #=> [4, -1, 2, 1]

The easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array. If the array is made up of negative numbers, return 0 instead. 

An empty array is considered to have zero greatest sum. Note that the empty array is also a valid subarray

Input: Array of numbers
Output: Maximum sum (number) of a contiguous subarray
  If all numbers are positive, return sum of array
  If all numbers negative or array is empty, return 0

ALGORITHM
- If all numbers are negative or array is empty, return 0
- If all numbers are positive, return sum of array
- Initialize a var (sums) to an empty array
- Find all subarrays
  - For each index...
    - Append the sum of a subarray that is x elements long to the sums array
    - Increment x by 1 until index + x == arr.size + 1
- Return the max sum in the sums array

CODE
def max_sequence(arr)
  return 0 if arr.empty? || arr.all?(&:negative?)
  return arr.sum if arr.all?(&:positive?)

  sums = []
  for i in 0..(arr.size - 1) do
    x = 1
    until i + x == arr.size + 1 do
      sums << arr[i, x].sum
      x += 1
    end
  end
  sums.max
end

-------------------------------------------------------------------------------
COMMON PREFIX

Write a method to find the longest common prefix string amongst an array of strings. If there is no common prefix, return an empty string,

All given inputs are in lowercase letters a-z.

Input: array of strings (all lowercase)
Output: longest common prefix
  - If no common prefix, return empty string

ALGORITHM
-Initialize var ('prefixes') to an array that contains a single empty string
-Iterate through prefixes
  -If all words in array start with prefix, add prefix to results array
  -If all words do not start with prefix, return the last item in the results array

CODE

def common_prefix(arr)
  first_word = arr.shift
  prefixes = [""]

  for i in 1..first_word.size do
    prefix = first_word[0, i]
    if arr.all? { |word| word.start_with?(prefix)}
      prefixes << prefix 
    else
      break
    end
  end

  prefixes.last
end

-------------------------------------------------------------------------------
SUBSTRING TEST
Given 2 strings, your job is to find out if there is a substring that appears in both strings. You will return true if you find a substring that appears in both strings, and false if not. A substring is longer than 1 character.

PROBLEM
- Input: 2 strings
- Return a boolean
  - True if there is a substring (case insensitive) that appears in both strings
    - Substrings are strings that 2 chars or longer
  - False if substring does not exist or either string is less than 1 char long

ALGORITHM
- Return false if either word size is less than 2
- Convert both words to downcase
- Iterate through the shorter word, finding all possible substrings that are 2 chars long. For each substring...
  - Return true if the longer word include? the substring
- return false

CODE
def substring_test(str1, str2)
  return false if str1.size < 2 || str2.size < 2
  str1 = str1.downcase
  str2 = str2.downcase

  for i in 0..(str1.size - 2) do
    substring = str1[i, 2]
    return true if str2.include?(substring)
  end
  false
end

-------------------------------------------------------------------------------
SCRAMBLE

Write a function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise, return false.

Input: 2 strings (lowercase alphabetical chars)
Output: boolean
  - Return true if some or all of string 1 chars can be rearranged to match str2

ALGORITHM
- For each char in string2, find the character count
  - Return false if the count of that char in str1 < the count of that char in str2

CODE
def scramble(str1, str2)
  str2.each_char { |char| return false if str2.count(char) > str1.count(char) }
  true
end

-------------------------------------------------------------------------------
LONGEST PALINDROME

Find the length of the longest substring in the given string that is the same in reverse.

Example:
longest_palindrome("I like racecars that go fast") == 7

If the length of the input string is 0, return value must be 0

Input: string
Output: number of longest palindrome possible
  - palindrome == the string has the same value when reversed
  - If input string.size == 0, return 0

ALGORITHM
- Define is_palindrome? method to check if string == string.reverse

- Find all substrings starting with longest to shortest by...
  - Starting at 0 index and length...
    - length == string.length - index
    - substring = str[index, length]
    - return true if substring is_palindrome?
    - decrement length by 1
    - break when length < 2
  -Then increment index by 1 until index == string.length - 2
-Return false

CODE
def is_palindrome?(str)
  str == str.reverse
end

def longest_palindrome(str)
  palindromes = ['']
  for idx in 0..(str.size - 1) do
    for length in 1..(str.size - idx) do
      substring = str[idx, length]
      palindromes << substring if is_palindrome?(substring)
    end
  end

  palindromes.max_by(&:size).size
end

-------------------------------------------------------------------------------
FIND EVEN INDEX

You are given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1. Empty arrays are equal to 0 in this problem.

Input: Array of numbers
Output: Index (number) where all the sum of all elements to the left of that index are equal to the sum of all the elements to the right of that index.
  - If empty, return 0
  - If not possible, return -1

DATA
Array

ALGORITHM
- If empty, return 0
- Iterate through each index. For each index...
  - If the sum of the right elements is 0 and index is 0, return 0
  - If the sum of the left elements is equal to the sum of the right elements, return index
  - If the index is the last index, and the sum of the left elements is 0, return last index
- Return -1

CODE
def find_even_index(arr)
  return 0 if arr.empty?

  for idx in 0...(arr.size) do
    left = arr[0..(idx - 1)].sum
    right = arr[(idx + 1)..(arr.size - 1)].sum

    return idx if idx.zero? && right.zero? || left == right
  end
  -1
end

-------------------------------------------------------------------------------
SUBSTRING AT INDEX
Write a method that will return a substring based on specified indices.

Input: string, starting index, ending index
Output: string

Data: string

ALGORITHM
- If the ending index is greater than the string size - 1, reassign the ending index to string size - 1
- If no ending index is given, default to starting index
- Assign variable 'length' to ending index - starting index + 1
- Call the slice method on the string

def substring(str, start, finish = start)
  length = finish - start + 1
  str[start, length]
end

-------------------------------------------------------------------------------
ALL SUBSTRINGS
# Write a method that finds all substrings in a string, no 1 letter words.

Input: string ( lowercase)
Output: array of substrings that are 2 chars or longer

ALGORITHM
- Initialize var ('result') to an empty array
- Loop through index 0 through the second to last index (string size - 2). For each index...
  - Loop through character length 2 through the max character length possible (string size - index) and add the substring that starts at index and is x characters length long
- Return the array

def substrings(str)
  results = []
  for idx in 0..(str.size - 2) do
    for length in 2..(str.size - idx) do
      results << str[idx, length]
    end
  end
  results
end

-------------------------------------------------------------------------------
PALINDROMES
Write a method that will return all palindromes within a string.

Input: string (lowercase)
Output: Array of all possible palindromes in the string
  -Palindrome: A string has the same value forwards and backwards (e.g. "pop"), with a minimum length of 2 characters

ALGORITHM
- Create an empty palindromes array
- Find all the possible substrings in the string
  - Iterate through the input string starting at the 0 index and ending at the index.size - 2
    - Find all substrings that are 2 characters or longer
    - If the substring is a palindrome, add it to the palindromes array
- Return the palindromes array

def is_palindrome?(str)
  str.reverse == str
end

def palindromes(str)
  palindromes = []

  for idx in 0..(str.size - 2) do
    length = 2
    loop do
      substring = str[idx, length]
      palindromes << substring if is_palindrome?(substring)
      length += 1
      break if substring.size + idx == str.size
    end
  end
  palindromes
end

-------------------------------------------------------------------------------
CAPITALIZE WORDS
Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase. You may assume that words are any sequence of non-blank characters.

Input: string
Output: same string, all titlecase

ALGORITHM
- Split the string into an array
- For each word in the array, reassign the value of the first character to that same character, capitalized
- Join the array with a ' '

def word_cap(str)
  str.downcase!
  arr = str.split
  arr.each do |word|
    word[0] = word[0].upcase
  end
  arr.join(' ')
end

-------------------------------------------------------------------------------
INTERWEAVING ARRAYS

Write a method that combines two Arrays passed in as arguments and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty and that they have the same number of elements.

Input: 2 arrays (non-empty, equal number of elements)
Output: 1 array that alternates elements from the 2 input arrays

ALGORITHM
- Apply the zip method to the first array, with the second array passed in as an argument

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

-------------------------------------------------------------------------------
SUM SAME CONSECUTIVE INTEGERS
You are given an array that contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

You can assume there is never an empty array and there will always be an integer.

Input: array (positive and negative integers only)
Output: array with consecutive numbers from input array replaced with their sum

DATA: array

ALGORITHM
- Initialize a var (result) to an empty array
- Initialize a var ('sum') to 0
- Iterate through each number in the array. For each number...
  - Add it to the sum array
  - If it is the last number in the array or the next number != the current number, add sum to the results array and reassign sum to 0
  - If the next number == the current number, next
- Return result

def sum_consecutives(arr)
  result = []
  sum = 0

  arr.each_with_index do |num, idx|
    sum += num
    if idx == arr.size - 1 || arr[idx + 1] != num
      result << sum 
      sum = 0
    end
  end
  result
end

=end
