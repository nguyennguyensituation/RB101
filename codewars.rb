=begin

COUNT LETTERS IN STRING

Given a string
Return a hash that contains...
-Keys are letters as symbols
-Values are the counts of each letter

CODE

def letter_count(str)
  result = Hash.new
  str.chars.each { |letter| result[letter.to_sym] = str.chars.count(letter) }
  result
end

TESTS

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

------------------------------------------------------------------------
FIND ALL PAIRS

Given an array of integers
Return the number of pairs in that array
- Arrays can be empty or contain one value (would return 0)
- If there are multiple pairs of a certain number, count the pair only once
- Max array length is 1000. Values in array are between 0 and 1000

CODE

def pairs(arr)
  matches = Hash.new
  count = 0

  arr.each { |num| matches[num] = arr.count(num) }
  matches.each_value { |value| count += value / 2 }
  count
end

TESTS

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

------------------------------------------------------------------------
RETURN SUBSTRING INSTANCE COUNT

Given a string (full_text) and a substring (search_text)
Return the number of times a the substring appears in the string

CODE

def solution(full_text, search_text)
  full_text.scan(search_text).size
end

TESTS

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

------------------------------------------------------------------------
ALPHABET SYMMETRY

Alphabetically symmetrical = a character's position in a string is equal to its position in the alphabet.

Example:
  Take the string "abode"
  - "a" is in position 1 in the string
  - "a" is in position 1 in the alphabet
  - "a" is alphabetically symmetrical

Given an array of words
Return an array that contains the number of letters that are alphabetically symmetrical.
-Arrays contain only alphabetical characters, no spaces
-Characters can be uppercase and lowercase

Example:
  solve(["abode","ABc","xyzD"]) = [4, 3, 1]

CODE

def solve(arr)
  alphabet = ('a'..'z').to_a

  arr.map do |word|
    count = 0
    word.chars.each_with_index { |char, index| count += 1 if index == alphabet.index(char.downcase) }
    count
  end
end

TESTS

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

------------------------------------------------------------------------
LONGEST VOWEL CHAIN

Given a lowercase word (string)
Return the length (number) of the longest substring of vowels

Example:
  string = 'codewarriors'
  vowel_substrings = ['o', 'e', 'a', 'io']

  => return 2

CODE

def solve(str)
  str.gsub!(/[^aeiou]/, ' ').split.max_by(&:size).size
end

TESTS

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

------------------------------------------------------------------------
NON-EVEN SUBSTRINGS

Given a string of integers
Return the number of odd-numbered substrings that can be formed

Create an array of every substring
  -
Remove substrings that are even
Return the size of the array

CODE

def solve(str)
  arr = str.chars
  substrings, result = [], []
  str_length = 0

  until str_length == str.size do
    arr.each_with_index do |num, idx|
      break if substrings.size == arr.size - str_length
      substrings << arr.slice(idx..(idx + str_length)).join
    end
    result << substrings
    str_length += 1
    substrings = []
  end

  result.flatten.delete_if { |num| num.to_i.even? }.size
end

TESTS

p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

------------------------------------------------------------------------
SUBSTRING FUN

PROBLEM
Given an array of words (strings)
Return a new string that is the nth letter of each string in the array,concatenated

Example:
["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2

ALGORITHM

-Initialize a new variable 'result' assign it to an empty string
-Iterate through every word in the array
  -Concatenate the value of the string at the current index to the result var
-Return the result

CODE

def nth_char(words)
  result = ''
  words.map.with_index { |word, idx| word[idx] }.join
end

TESTS

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'

------------------------------------------------------------------------
REPEATED SUBSTRING
https://www.codewars.com/kata/5491689aff74b9b292000334/ruby

Given a non-empty string...
Return an array that contains...
- the minimum substring and maximum number where string == substring * max number

Examples

  str = 'ababab'
  => ['ab', 3]

  str = 'abcde'
  => ['abcde', 1]

ALGORITHM

-Create arr of substrings
-iterate through every substring
  - multiply each substring from 1..str.size
  - return [substring, max_num] when substring * max_num == str

CODE

def repeated_substring(str)
  arr = (0..str.size - 1).map { |i| str.slice(0..i) }
  arr.each do |substr|
    (1..str.size).each { |max_num| return [substr, max_num] if substr * max_num == str }
  end
end

TESTS

p repeated_substring('ababab') == ['ab', 3]
p repeated_substring('abcde') == ['abcde', 1]

------------------------------------------------------------------------
TYPOGLYCEMIA GENERATOR

Given a string...
- one word or multiple words
- multiple words are separated by single spaces
- all lowercase
- can contain alphabetical chars
- can contain these non-alphabetical chars: hyphen (-), apostrophe ('), comma (,), and period (.)

Return a new string where for every substring...
- first and last chars remain in original place
- all chars between the first and last chars are sorted in alphabetical order
- punctuation must remain in the same position

ALGORITHM
- Initialize an var (arr) to an array that contains the value of every substring (word) within the string
- Iterate through each word in the array
  - If there a punctuation character exists...
    - initialize a var (punc) to an array that contains the value of the character and the index of that character
    - Remove the non-alphabetical character from the substring
  - Initialize a var (center) to the value of a substring equal to chars 1 through -2 of the word
  - Replace the inner substring with the same substring sorted alphabetically
  - If the value is not nil, insert the punctuation char at the original index
- Return the value of the arr, joined with ' '

CODE
def scramble_words(str)
  arr = str.split(' ')

  arr.each do |word|
    punc = word.chars.map.with_index { |char, i| [i, char] if char =~ /\W/ }.delete_if(&:nil?)
    word.gsub!(/\W/, '')
    center = word.slice(1..-2)
    word.gsub!(center, center.chars.sort.join)
    punc.each { |punc_char| word.insert(punc_char[0], punc_char[1]) }
  end.join(' ')
end

TESTS
p scramble_words("hasn't.") == "hans't."
p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching") == "you've gotta dacne like teehr's nbdooy wachintg"

------------------------------------------------------------------------
MOST FREQUENTLY USED WORDS IN A TEXT
https://www.codewars.com/kata/51e056fe544cf36c410000fb/train/ruby

Given a string of text...
- Can include punctuation and line breaks
Return an array of the 3 words that occur most frequently in the string
- If the text contains fewer than 3 unique words, return the top 2 or top 1 words
- If the text contains no words, return an empty array
- Words should be in descending order (based on frequency) and lowercase


- Words must contain alphabetic characters and can include apostrophes.
- Non-alphabetic characters are not considered part of the word
- Words are case-insensitive

ALGORITHM
- Create an array of all the words in the string
  - Remove non-alphabetic chars, white spaces, make everything lowercase, remove duplicates
- Iterate through the array
  - Mapping the value of 

CODE
def top_3_words(str)
  return [] if str !~ /[a-zA-Z]/
  str_arr = str.downcase.gsub(/[^a-z']/, ' ').split
  str_arr.uniq.sort_by { |word| str_arr.count(word) }.last(3).reverse
end

TESTS
p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]

------------------------------------------------------------------------
EXTRACT THE DOMAIN NAME FROM A URL
Given a url (string)...
Return the domain name (string)

DATA
string

ALGORITHM
- slice the url after 'www'
- slice the last element in the array after '//'
- return the first element in the array before '.'

CODE
def domain_name(url)
  url.split(/www./).last.split(/\/\//).last.split(/\./).first
end

TESTS
p domain_name("http://google.com")
p domain_name("http://google.co.jp")
p domain_name("www.xakep.ru")
p domain_name("https://youtube.com")
p domain_name("http://www.hyphen-site.com")
p domain_name("icann.org")

------------------------------------------------------------------------
DETECT PANGRAM

Pangram == A sentence that contains every single letter in the alphabet

Given a string...
Determine if it is a pangram and return true or false

DATA
String, Array

ALGORITHM
- Downcase all chars
- Strip non-alphabet chars from string
- Split chars into a new array
- Remove duplicate chars
- Sort array
- Check if new array is equal to alphabet array

CODE
def pangram?(str)
  str.downcase.gsub(/[^a-z]/, '').chars.uniq.sort == ('a'..'z').to_a
end

TESTS
p pangram?("The quick brown fox jumps over the lazy dog.")
p pangram?("This is not a pangram.")
p pangram?("ABCD45EFGH,IJK,LMNOPQR56STUVW3XYZ")

------------------------------------------------------------------------
KEBABIZE

Given a string that is camel case
Return a string that is kebab case, all lowercase and contains no non-alphabetical numbers

DATA
string

ALGORITHM
- Replace non-alphabetic chars with ''
- Split the string into an array when characters are upcased
- Join the array with a '-'

CODE
def kebabize(str)
  str.gsub(/[0-9]/, '').split(/(?=[A-Z])/).join('-')
end

p kebabize('myCamelCasedString')
p kebabize('myCamelHas3Humps')
p kebabize('6QcvQbUD9SBACfJ')

------------------------------------------------------------------------
DUBSTEP

Given a string...
- upcase letters only
- not empty
Return a string of the original, non dub-stepped song...
- string should not contain "WUB"
- words are separated by ' '

DATA
string, array

ALGORITHM
- Replace all instances of the string "WUB" with ' '
- Split the string into a array of words
- Join the chars with a space

CODE
def song_decoder(str)
  str.gsub(/WUB/, ' ').split.join(' ')
end

TESTS
p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")
p song_decoder("AWUBBWUBC")
p song_decoder("AWUBWUBWUBBWUBWUBWUBC")
p song_decoder("WUBAWUBBWUBCWUB")

------------------------------------------------------------------------
TAKE A TEN MINUTE WALK

Given a array of directions...
- ['n', 's', 'e', 'w']
- each direction == 1 minute
Return a boolean...
- True if 
  - the walk will take you 10 minutes
  - the walk will return you back to your starting point

DATA
array, boolean

ALGORITHM
- Return false if array size != 10
- Intialize 2 vars (north_south, east_west) to 0
- Iterate through each element in the array
  - If 'n', increase north_south by 1
  - If 's', decrease north_south by 1
  - If 'e', increase east_west by 1
  - If 'w', decrease east_west by 1
- Return true if north_south + east_west == 0

CODE
def is_valid_walk(arr)
  return false if arr.size != 10

  north_south, east_west = 0, 0

  arr.each do |dir|
    case dir
    when 'n' then north_south += 1
    when 's' then north_south -= 1
    when 'e' then east_west += 1
    else east_west -= 1
    end
  end

  north_south == 0 && east_west == 0 ? true : false
end

TESTS
p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false
p is_valid_walk(['n', 's', 'e', 'w', 'e', 's', 'e', 'w', 'n', 's']) == false
p is_valid_walk(%w([n s n s n s n s n w])) == false

------------------------------------------------------------------------
STOP GNINNIPS MY SDROW!

Given a string (1 or more words)...
Return the same string with all words that are 5 or more letters reversed

DATA
String

ALGORITHM
- Split the string into an array
- Iterate through the array...
  - If the word is >=5, reverse it
- Return the result of the array joined with ' '

CODE
def spinWords(str)
  str.gsub(/\w{5,}/, &:reverse)
end

TESTS
p spinWords( "Hey fellow warriors" ) ==  "Hey wollef sroirraw" 
p spinWords( "This is a test") ==  "This is a test" 
p spinWords( "This is another test" ) ==  "This is rehtona test"
p spinWords("Welcome") == "emocleW"

------------------------------------------------------------------------
WRITE NUMBER IN EXPANDED FORM

PROBLEM
Given a number (whole, greater than 0)
Return a string of that number in expanded form

EXAMPLE
42 => '40 + 2'
70304 => '70000' + 300 + 4'

DATA
Numbers, strings

ALGORITHM
-Create new array with each number as a string char
  -Convert num to string
  -Split num string into array
  -Reverse the array
-Iterate through each char in the array using each with index method
  -For each char, concatenate '0' * index onto the char
-Delete any element in the array where the first char == '0'
-Reverse the array and join the elements in the array with ' + '

CODE
def expanded_form(num)
  num.to_s.
  chars
  .reverse
  .each_with_index { |char, idx| char << '0' * idx }
  .delete_if { |char| char[0] == '0' }
  .reverse.join(' + ')
end

TESTS
p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) =='70000 + 300 + 4'

33.3% (333)
------------------------------------------------------------------------
PERSISTENT BUGGER

PROBLEM
Given a positive num
Return its multiplicative persistence (num)
- Multiplicative persistence == the number of times you need to multiple the digits in num to reach a single digit

EXAMPLES
39 => 3

3 * 9 == 27
2 * 7 == 14
1 * 4 == 4

4 => 0

DATA
Integers, Strings

ALGORITHM
- Initialize a counter var to 0
- Initialize digits var to an an empty array
- Initialize a current_num var to the value num.to_s
- Create a loop
  - Reassign the value of digits to the the current_num chars
  - Add break condition if digits.size == 1
  - Iterate through the digits array using map method
    -Convert each element to a string
    -Reassign the current_num value to the sum of the elements in digits multiplied
  - Increment counter var by 1
Return counter

CODE
def persistence(num)
  counter = 0
  current_num = num
  arr = []

  loop do
    arr = current_num.digits
    break if digits.size == 1
    arr = arr.map(&:to_i)
    current_num = arr.inject(:*)
    counter += 1
  end

  counter
end

TESTS
p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4
p persistence(444) == 3

35.3% 341

------------------------------------------------------------------------
TITLE CASE

PROBLEM
A string is in title case if...
-First letter of every word is capitalized
-The exceptions are a list of minor words if they are not the first word

Given a string of words (can be any case) and an optional list of exception words (string of words, separated by a space)...
Return a that string in title case

EXAMPLES
'a clash of KINGS', 'a an the of' 
=> 'A Clash of Kings'

'THE WIND IN THE WILLOWS', 'The In'
=> 'The Wind in the Willows'

'the quick brown fox'
=> 'The Quick Brown Fox'

''
=> ''

DATA
String, Array

ALGORITHM
-Make title downcase and convert to an array of strings
-Make list downcase
-Initialize result var to an empty string
-Reassign the value of arr to the return value of calling map and with_index methods  on the title array
  -Capitalize the word unless the list string includes the current word && the word index is != 0
-Return the value of arr joined by ' '


CODE
def title_case(title, list = '')
  title_arr = title.downcase.split(' ')
  list = list.downcase

  title_arr = title_arr.map.with_index do |word, idx| 
    idx == 0 || list.match?(/\b#{word}\b/) == false ? word.capitalize : word end

  title_arr.join(' ')
end

TESTS
p title_case('') == ''
p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
p title_case("First a of in", "an often into") == "First A Of In"

349 37.2%

------------------------------------------------------------------------
COUNT AND GROUP CHARACTER OCCURRENCES IN A STRING

PROBLEM
Given a string...
Return a hash where...
-keys are number of occurances
-values are arrays with the chars (lowercase) that correspond with those occurances
-keys are in descending order
-values are in alphabetical order
-char == letters or numbers, case insensitive

EXAMPLES
get_char_count("Mississippi") => {4=>["i", "s"], 2=>["p"], 1=>["m"]}
get_char_count("Hello. Hello? HELLO!!") => {6=>["l"], 3=>["e", "h", "o"]}
get_char_count("aaa...bb...c!") => {3=>["a"], 2=>["b"], 1=>["c"]}
get_char_count("aaabbbccc") => {3=>["a", "b", "c"]}
get_char_count("abc123") => {1=>["1", "2", "3", "a", "b", "c"]}

DATA
String, Hash

ALGORITHM
-Initialize var(arr) to array of lowercase alphanumeric chars
-Initialize var (result) to empty hash
-Reassign arr to the value of calling the map method on alphabetically sorted arr
  -For each char...
    -count number of elements == char in the arr
    -return an array that contains [num of elements, char]
-Remove duplicate elements in arr
-Iterate through the arr
  -For each sub array...
    -Set the hash key to the num of elements
    -Concatenate the char
-Return result

CODE
def get_char_count(str)
  result = Hash.new { |hash, key| hash[key] = [] }
  arr = str.downcase.scan(/[a-z0-9]/).sort
  arr.map { |char| [arr.count(char), char] }.uniq
     .each { |sub_arr| result[sub_arr[0]] << sub_arr[1] }
  result
end

TESTS
p get_char_count('Mississippi') == { 4 => %w[i s], 2 => ['p'], 1 => ['m'] }
p get_char_count('Hello. Hello? HELLO!!') == { 6 => ['l'], 3 => %w[e h o] }
p get_char_count('aaa...bb...c!') == { 3 => ['a'], 2 => ['b'], 1 => ['c'] }
p get_char_count('aaabbbccc') == { 3 => %w[a b c] }
p get_char_count('abc123') == { 1 => %w[1 2 3 a b c] }

357 39.1%

------------------------------------------------------------------------
FIND THE MINE!

PROBLEM
Given a 2D array...
-arrays are always square (n x n)
-the location with a "mine" is represented by 1
-locations without a "mine" are representd by 0
-there will only be one mine

Return an array that represents the location of the bomb...
-Array contains 2 values: row index, col index (0-based)

EXAMPLES
mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) => returns [0, 0]
mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) => returns [1, 1] 
mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) => returns [2, 1]

DATA
Array

ALGORITHM
-Initialize row and col vars to nil
-Loop through rows and return index of array that contains 1
-Loop through array and return index of row == 1
-Return array with two elements: row and col

CODE
def mineLocation(arr)
  arr.each_with_index { |row, idx| return [idx, row.index(1)] if row.include?(1) }
end

TESTS
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]

365 41.1%
------------------------------------------------------------------------
SCRAMBLIES - INCOMPLETE (failed speed tests)

PROBLEM
Given 2 strings (string 1, string 2)
-All lowercase, alphabetical chars only

Return a boolean...
-Return true if a substring of string 1 can be rearranged to match string 2
-Return false otherwise

EXAMPLES
scramble('rkqodlw', 'world') ==> True
scramble('cedewaraaossoqqyt', 'codewars') ==> True
scramble('katas', 'steak') ==> False

DATA
strings

ALGORITHM
- Initialize word1 var to str1 char array
- Create str2 char array, iterate through each char
  - assign idx var to to the word1 index of the char
  - return false if index does not exist (nil)
  - delete char from word 1
- Return true

CODE
def scramble(str1, str2)
  word1 = str1.chars
  str2.chars.each do |char| 
    idx = word1.index(char)
    return false if idx == nil
    word1.delete_at(idx)
    end
  true
end

TESTS
p scramble('rkqodlw', 'wworld') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

------------------------------------------------------------------------
LONGEST ALPHABETICAL SUBSTRING - INCOMPLETE (failed speed tests)

PROBLEM
Given a string (all lowercase, at least 1 char long)...
Return the longest substring that is in alphabetical order
If there are multiple solutions, return the first

EXAMPLES
(see tests)

DATA
Strings

ALGORITHM
-Initialize a var 'longest' to an empty string
-Initialize a 'size' var to the string size
-Loop from size to 1
  -Loop from index of string until index + size == string size
    -return longest if longest == longest.sort

CODE
def longest(str)
  longest = ''
  size = str.size
  idx = 0
  limit = size - 1

  loop do
    loop do
      longest = str.slice(idx..limit)
      return longest if longest == longest.chars.sort.join
      idx += 1
      limit += 1
      break if limit > str.size - 1
    end
    idx = 0
    size -= 1
    limit = size - 1
  end
    longest
end

TESTS
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

------------------------------------------------------------------------
THE HASHTAG GENERATOR

PROBLEM
Given a string...
Return either a hashtag(string) or false...
  - strings must start with '#'
  - All words are capitalized
  - Return false if... 
    - the final result is greater than 140 chars OR
    - the input or result is empty

EXAMPLES
" Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
"    Hello     World   "                  =>  "#HelloWorld"
""                                        =>  false
DATA
String, Array

ALGORITHM
-Initialize var (result) to array of string words
-Remove blank spaces
-Capitalize each word
-Insert a hashtag at the beginning
-Join words
-Return false if result string is empty or bigger than 140 chars
-Return result

CODE
def generateHashtag(str)
  result = str.split
  return false if result.empty?
  result = result.map(&:capitalize)
    .unshift('#')
    .join
  result.size <= 140 ? result : false
end

TESTS
p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") == "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false

373 46.1%
------------------------------------------------------------------------
PETE, THE BAKER

PROBLEM
Given a hash (recipe) and hash (available ingredients)
Return the maximum number of cakes that can be made from the available ingredients

EXAMPLES
// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); 

// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}); 

DATA
Hash, Integer

ALGORITHM
-Initialize a num_cakes var to an empty array
-Iterate through each item in the recipe hash using the map method
  -Divide ingredient quantity by recipe quantity and add the result to num_cakes
-Return the min element in num_cakes

CODE
def cakes(recipe, ingredients)
  num_cakes = []

  recipe.each do |item, amount|
    ingredients[item].nil? ? num_cakes << 0 : num_cakes << ingredients[item] / amount
  end

  num_cakes.min
end

TESTS
p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2

p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11

p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0

p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0

p cakes({"eggs"=>4, "flour"=>400},{}) == 0

p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1

381 51.2%

------------------------------------------------------------------------
MEAN SQUARE ERROR

PROBLEM
Given 2 arrays of equal length (contains only integers)...
-Take the absolute value difference between corresponding values in each array
-Square it
Return the average of those squares

EXAMPLES
[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2

DATA
Arrays, Integers

ALGORITHM
Iterate through each element in the first array using the map and with index methods
  -Subtract each element from its corresponding element
  -Find the absolute value and square it
Return the average value difference

CODE
def solution(arr1, arr2)
  arr1.map.with_index { |num, idx| (num - arr2[idx]).abs ** 2 }.sum.to_f / arr1.size
end

TESTS
p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1

389 56.3%

------------------------------------------------------------------------
EXPONENT METHOD

PROBLEM
Given 2 integers (num1, num2)
Return the value of num1 raised to the power of num2
-Return nil if num2 is negative

EXAMPLES
power(2, 3) # 8
power(10, 0) # 1
power(-5, 3) # -125
power(-4, 2) # 16

DATA
Integers

ALGORITHM
-Return nil if num2 is negative
-Initialize a var (sum) to the value of num1
-Create a loop that repeats num2 times
  -Reassign the value of 'sum' to 'sum' * num1
-Return 'sum'

CODE
def power(base, exponent)
  return nil if exponent.negative?
  return 1 if exponent.zero?
  result = base
  (exponent-1).times { result = result * base }
  result
end

TESTS
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil

397 61.4%
------------------------------------------------------------------------
WHERE MY ANAGRAM'S AT? 

PROBLEM
Given a word (string) and list of words (array of strings)...
Return an array of all the anagrams of that string

EXAMPLES
anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) => ['aabb', 'bbaa']

anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) => ['carer', 'racer']

anagrams('laser', ['lazing', 'lazy',  'lacer']) => []

DATA
String, Array

ALGORITHM
-Iterate through every word in the words array using the select method
  - The block returns true if the current word sorted is equal to the word sorted

CODE
def anagrams(word, words)
  words.select { |x| x.chars.sort.join == word.chars.sort.join }
end

TESTS
p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []

------------------------------------------------------------------------
SPLIT STRINGS

PROBLEM
Given a string...
Return an array that splits the strings into 2-char substrings
-If the string length is odd, append an '_' to the final string in the array

EXAMPLES
'abc' =>  ['ab', 'c_']
'abcdef' => ['ab', 'cd', 'ef']

DATA
String, Array

ALGORITHM
-If str.size is odd, append << '_' to the end of the string
-Find every 2 char substrings using the scan method

CODE
def solution(str)
  str << '_' if str.size.odd?
  str.scan(/\w\w/)
end

TESTS
p solution('abc') ==  ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']

405 63.3%

------------------------------------------------------------------------
ANAGRAM DIFFERENCE

PROBLEM
Given 2 words (strings, all lowercase)...
Return the number of letters that need to be removed to make them anagrams

EXAMPLES
'codewars' (4 letters)
'hackerrank' (6 letters)
=> 10

DATA
Strings, Array

ALGORITHM
-Find the biggest string where all the characters are contained in the second string and save that value to anagram
  -Find the short string, remove all the chars from the short string that are not found in the longer string
-Return the sum of (str1 - anagram) + (str2 - anagram)

CODE
def anagram_difference(str1, str2)
    word1, word2 = str1.chars, str2.chars
    anagram = []

    word1.each do |char|
      if word2.include?(char)
        anagram << char
        word2.delete_at(word2.find_index(char))
      end
    end
    (word1.size - anagram.size) + word2.size
end

TESTS
p anagram_difference('' , '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10
p anagram_difference("rilezleextgooqaktoqzyntoiheagbauvuvvcjfgfxbopbth", "bkmzgsfedfecddilzsceiuiufedbijkoovlvxfgccmocemhz") == 40

415 65.9%
------------------------------------------------------------------------
ANAGRAM DETECTION

PROBLEM
Given two words (strings)
Return a boolean
  - True if the two words are anagrams
  - Case insensitive

EXAMPLES
"foefet" is an anagram of "toffee"

"Buckethead" is an anagram of "DeathCubeK"

DATA
String, Array

ALGORITHM
- Downcase, convert both strings to arrays, sort alphabetically
- Return true if both arrays are equal to each other

CODE
def is_anagram(test, original)
  test.downcase.chars.sort == original.downcase.chars.sort
end

TESTS
p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false

417 66.7%
------------------------------------------------------------------------
HIGHEST SCORING WORD

PROBLEM
-Given a string of words (all lowercase)...
-Return the highest scoring word (string)
  - Each letter is equal to its position in the alphabet (a = 1, z = 26)
  - If words have equal value, return the word that appears earliest in the string

EXAMPLES
p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'

DATA
String, array, hash

ALGORITHM
-Create alphabet value hash
-Create empty scores hash. Each value should be an array
-Split string into array, iterate through each string in array
  -For each string, calculate the score
  -Add the key=>value pair score=> word to the scores hash
-Return the first value of the max key

CODE
def high(str)
  alphabet = ('a'..'z').to_a.zip((1..26).to_a).to_h
  scores = Hash.new { |hash, key| hash[key] = [] }

  str.split.map do |word|
    word_total = word.chars.map { |char| alphabet[char] }.sum
    scores[word_total] << word
  end

  scores.max.last.first
end

TESTS
p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'

425 68.6%
------------------------------------------------------------------------
REPLACE WITH ALPHABET POSITION

PROBLEM
-Given a string...
-Return a new string with every letter replaced by its position in the alphabet
  -Ignore non-alphabetical chars, spaces, etc.

EXAMPLES
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" ( as a string )

DATA
String, Array

ALGORITHM
-Delete non-alphabetic chars and spaces from string
-Split string into an array
-Iterate through each char using the map method
  -For each char, return the position of the char in the alphabet
-Join the map with ' '

CODE
def alphabet_position(str)
  arr = str.downcase.gsub(/[^a-zA-Z]/, '').chars
  arr.map { |char| char.ord - 96}.join(' ')
end

TESTS
p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""

433 70.5%
------------------------------------------------------------------------
SHERLOCK ON POCKETS

PROBLEM

- 'Suspect' is person with illegal item in pocket
- 'Pockets' hash contains entries where...
  - key == person
  - value == an array containing numbers. Each number represents an "item"

- Given a pockets hash and an array of "items"...
- Return an array of suspects that aren't allowed to have any of those items

EXAMPLES

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

find_suspects(pockets, [1, 2]) # => [:tom, :jane]
find_suspects(pockets, [1, 7, 5, 2]) # => nil
find_suspects(pockets, []) # => [:bob, :tom, :jane]
find_suspects(pockets, [7]) # => [:bob, :tom]

DATA
hash, array

ALGORITHM
-Initialize an empty results array
-Iterate through each person(key) in the pockets hash
  -If the difference between the value and the array is not an empty array, add the person to a results array

CODE
def find_suspects(pockets, allowed_items)
  result = []
  pockets.each do |key, value|
    next if value.nil?
    result << key if !(value - allowed_items).empty?
  end
  result.empty? ? nil : result
end

TESTS
pockets = {}
p find_suspects(pockets, [1, 3]) == nil

pockets = { tom: [2], bob: [2], julia: [3], meg: [3] }
p find_suspects(pockets, [2, 3]) == nil

pockets = { julia: nil, meg: [] } 
p find_suspects(pockets, [1, 6]) == nil

pockets = { meg: [1, 3], tom: [5, 3] }
p find_suspects(pockets, [1, 3]) == [:tom]

441 72.5%

------------------------------------------------------------------------
MEXICAN WAVE

PROBLEM
Given a string (lowercase, can be empty)...
Return an array of strings...
- Each uppercase letter represents a person standing up
- If the char is whitespace, skip over it

EXAMPLES
wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

DATA
string, array

ALGORITHM
-Initialize a var (arr) to the value of an array of all the characters in the string
-Iterate through every char in the arr with the map and with_index methods
  -For each alphabetic char, return the original string with the current char upcased
  -For each non-alphabetic char, return nil

CODE
def wave(str)
  arr = str.chars
  result = arr.map.with_index do |char, idx|
    arr[0...idx].join + char.upcase + arr[idx + 1..-1].join if char =~ /[a-z]/
  end.compact
end

TESTS
result = ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("hello") == result

result = ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("codewars") == result

result = []
p wave("") == result

result = ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave("two words") == result

result = [" Gap ", " gAp ", " gaP "]
p wave(" gap ") == result

449 74.4%

------------------------------------------------------------------------
DELETE A DIGIT

PROBLEM
-Given an integer...
-Find the max number that is possible if you delete one digit of the number

EXAMPLES
For n = 152, the output should be 52;

For n = 1001, the output should be 101.

DATA
Integer, array

ALGORITHM
-Initialize var (arr) to the value of the integer into a string, split into a char array
-Initialize an empty results array
-Iterate through every char in the array using the map and with index methods
  -Add the value of each number with that char removed to the results array
    -Create a current_num var and assign it the value of array
    -Delete the value at current index from the current_num array
    -Apply the join method to current_num and convert to integer
-Return the max num

CODE
def delete_digit(int)
  arr = int.to_s.chars
  result = arr.map.with_index do |_, idx|
    (arr[0...idx] + arr[idx+1..-1]).join.to_i
  end.max
end

TESTS
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1

457 76.3%
------------------------------------------------------------------------
MULTIPLES OF 3 OR 5

PROBLEM
Given a number...
Return the sum of all the multiples below the number passed in
-If the number is negative, return 0

EXAMPLES
Given 10
Return 23
[3, 5, 6, 9]

DATA
Integer, Array

ALGORITHM
-Create an array that is all the numbers from 3 up until n (the given number)
-Iterate through that array selecting the numbers are multiples of 3 or 5
-Return the sum of that new array

CODE
def solution(num)
  (3...num).select { |num| num % 3 == 0 || num % 5 == 0 }.sum
end


TESTS
p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168

457 76.3%
------------------------------------------------------------------------
STRING TRANSFORMER

PROBLEM
-Given a string (only alphabetical chars and spaces)
-Return a new string
  -Every case has been swapped (upper to lower and vice versa)
  -Words order is reversed
  -Needs to preserve leading, trailing and inner spaces

EXAMPLES
"Example Input" => "iNPUT eXAMPLE"
'Example string' => 'STRING eXAMPLE'

DATA
String, Array

ALGORITHM
-Create an array of words using the split method and reverse the order of the elements
-Iterate through that array using the map method
  -For each word, split each word into an array using the chars method
  -Iterate through each word using the each method, changing the case
  -Join the chars
-Join the words with a blank space (' ')

CODE
def string_transformer(str)
  return '' if str == ''

  result = []
  word = ''

  str.chars.each(&:swapcase!)
    .each do |char|
      if char == ' '
        result.prepend(word)
        result.prepend(char)
        word = ''
      else
        word << char
      end
    end
  result.prepend(word).join
end

TESTS
p string_transformer(" A b C d E f G ") == " g F e D c B a "
p string_transformer('Jaq_Lxsti_Prpw_Jrggo_Sdr_Vm_Tnu_Mbqbo_Avn') == 'jAQ_lXSTI_pRPW_jRGGO_sDR_vM_tNU_mBQBO_aVN'
p string_transformer('You Know When  THAT  Hotline Bling') == 'bLING hOTLINE  that  wHEN kNOW yOU'
p string_transformer("Example Input") == "iNPUT eXAMPLE"
p string_transformer('Example string') == 'STRING eXAMPLE'

465 78.3%
------------------------------------------------------------------------
LARGEST PRODUCT IN A SERIES

PROBLEM
Given a string of digits...
  -Input string always has more than 5 digits
Return a number that is the greatest product of 5 consecutive digits in the string


EXAMPLES
greatestProduct("123834539327238239583") // should return 3240

DATA
strings, arrays

ALGORITHM
-Covert each number string to integer
-Create an array of consective 5-digit arrays
-Find the product of each array
-Return the max product

CODE
def greatest_product(str)
  consecutive = []
  arr = str.chars.map(&:to_i)
  arr.each_with_index do |num, idx|
    limit = idx + 4
    break if limit == arr.size
    consecutive << arr.slice(idx..limit)
  end

  consecutive.map { |arr| arr.inject(:*) }.max
end


TESTS

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

473 83.3%
------------------------------------------------------------------------
DUPLICATE ENCODER

PROBLEM
- Given a string
- Return a new string that replaces every character in the original string with '(' or ')'
  -If the character appears only once, replace it with '('
  -If the character appears more than once, replace it with ')'

EXAMPLES
"din"      =>  "((("
"recede"   =>  "()()()"
"Success"  =>  ")())())"
"(( @"     =>  "))((" 

DATA
string, array

ALGORITHM
-Convert the string to downcase chars and then to an array
-Iterate through the array and reassign characters to ')' or '('
  -If the number of that char in original string is == 0, reassign it to ')'
  -Else, reassign it to '('
-Return the result of the joined array

CODE
def duplicate_encode(str)
  arr = str.downcase.chars
  arr.map { |char| arr.count(char) == 1 ? '(' : ')' }.join
end

TESTS
p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("

473 83.3%
------------------------------------------------------------------------
BACKSPACES IN STRING

PROBLEM
- Given a string
- Return a new string where...
  -'#' and the character that precedes it is deleted

EXAMPLES
"abc#d##c"      ==>  "ac"
"abc##d######"  ==>  ""
"#######"       ==>  ""
""              ==>  ""

DATA
string, array

ALGORITHM
- Initialize a 'result' var to an empty array
- Convert string to array
- Iterate through the array
  - If the current char does not equal '#', append it to the result array
  - Else remove the last element from the result array
-Return the joined result array

CODE
def clean_string(str)
  str.chars.each_with_object([]) { |char, result| char != '#' ? result << char : result.pop }.join
end

TESTS
p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == "" 
p clean_string("#######") == ""
p clean_string("") == ""

481 85.3%

------------------------------------------------------------------------
SORT ARRAYS (IGNORING CASE)

PROBLEM
- Given an array
- Return the array sorted in alphabetical order (ignoring case)

EXAMPLES
["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]

DATA
Array, strings

ALGORITHM
-Call the sort_by method on the array
  - Elements should be sorted by the element with the downcase method called on it

CODE
def sortme(arr)
  arr.sort_by(&:downcase)
end

TESTS
p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "B"]) == ["a", "B", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]

489 87.2%
------------------------------------------------------------------------
TRANSFORM TO PRIM

PROBLEM
- Given a list (array of integers)...
  - Array contains 2 integers or more
  - Numbers are positive
  - Numbers can be repeated
- Return the minimum number that you'd need to add to the list for the sum of all elements in the list to equal the closest prime number

prime number == a whole number that is greater than 1 that can only be divided by itself and 1

EXAMPLES

[3, 1, 2] => 1
[2, 12, 8, 4, 6] => 5

DATA
Array, Integer

ALGORITHM
-Initialize var (sum) to the sum of all elements in array
-Create a loop that iterates from 1 until we find a number that when added to the sum var is prime
-Return that num

CODE
require 'prime'

def minimum_number(arr)
  sum = arr.sum
  num = 0
  loop do
    return num if (num + sum).prime?
    num += 1
  end
end

TESTS
p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2

497 89.1%

------------------------------------------------------------------------
COUNTING DUPLICATES

PROBLEM
- Given a string (alphanumeric chars only, both uppercase and lowercase)...
- Return the number of case-insensitive chars that occur more than once

EXAMPLES
"abcde" -> 0  # no characters repeats more than once
"aabbcde" -> 2  # 'a' and 'b'
"aabBcde" -> 2  # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1  # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2  # 'a' and '1'
"ABBA" -> 2  # 'A' and 'B' each occur twice

DATA
String, Array

ALGORITHM
- Initialize var (chars) to the string, downcased, and split into an array of chars
- Initialize a var (result) to an empty array
- Iterate through the chars array
  - If a character appears more than once in the array, add it to the result array
- Remove duplicates from the result array
- Return the size of the result array

CODE
def duplicate_count(str)
  arr = str.downcase.chars.uniq
  str.downcase.chars - arr
end

TESTS
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2

505 91.1%
------------------------------------------------------------------------
THE ALPHABETIZED KATA

PROBLEM
- Given a string (alphabetical chars only, uppercase and lowercase)...
- Return a string where...
  - The original string chars are reordered...
    - first alphabetically (case insensitive)
    - then by their original order in the string
    - Remove blank spaces

EXAMPLES
alphabetized("The Holy Bible") # "BbeehHilloTy"

DATA
String, Array

ALGORITHM
-Initialize var (chars) to the value of splitting the string into a new array of chars and removing spaces
-Sort chars array alphabetically
-Return value of joined sorted array

CODE
def alphabetized(str)
  result = []
  ('a'..'z').each do |letter|
    result << str.scan(/[#{letter}#{letter.upcase}]/)
  end
  result.flatten.join
end

TESTS
p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

513 93%
------------------------------------------------------------------------
SUM OF DIGITS / DIGITAL ROOT

PROBLEM
- Given a positive integer
- Return a number (digital root)

digital root == the recursive sum of all the digits in a number

EXAMPLES
16  -->  1 + 6 = 7
942  -->  9 + 4 + 2 = 15  -->  1 + 5 = 6
132189  -->  1 + 3 + 2 + 1 + 8 + 9 = 24  -->  2 + 4 = 6
493193  -->  4 + 9 + 3 + 1 + 9 + 3 = 29  -->  2 + 9 = 11  -->  1 + 1 = 2

DATA
Integer, array

ALGORITHM
- Initialize a var (elements) to the value of an array that contains all the individual digits of a the given number
- Create a loop where...
  - elements is reassigned to elements.sum.digits
  - Return elements.first if elements size == 1

CODE
def digital_root(num)
  arr = num.digits
  loop do
    return arr.first if arr.size == 1
    arr = arr.sum.digits
  end
end

TESTS
p digital_root(16) == 7
p digital_root(942) == 6
p digital_root(132189) == 6
p digital_root(493193) == 2

521 94.9%
------------------------------------------------------------------------
ARRAY.DIFF

PROBLEM
- Given two arrays of numbers (a and b)
- Return a new array that only contains the values from list a that are not present in list b

EXAMPLES
array_diff([1,2],[1]) == [2]
array_diff([1,2],[1]) == [2]

DATA
arrays

ALGORITHM
Subtract arr2 from arr1

CODE
def array_diff(arr1, arr2)
  arr1 - arr2
end

TESTS
p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []
p array_diff([1,2,3], [1,2]) == [3]

------------------------------------------------------------------------
WHERE IS MY PARENT? (CRY)

PROBLEM
- Given a string (alphabetic chars) where...
  - Uppercase chars == 'mothers'
  - Lowercase chars == 'children'
- Return a string where...
  - Characters are sorted alphabetically first
  - Then by uppercase followed by lowercase

EXAMPLES

 "aAbaBb" => "AaaBbb"

DATA
String, array

ALGORITHM
-Initialize a var (mothers) to an array that contains only uppercase letters, sorted in alphabetical order
-Iterate through the mothers array using the map method
  -For each upcase character in the mothers array, find the number of elements in string that are equal to the downcase version of that char. This value is the number of children for that mother
  -Return the value of the mother + number of children times the mother char lowercased
-Join the returned array

CODE
def find_children(str)
  mothers = str.upcase.chars.uniq.sort
  mothers.map { |mother| mother << (mother.downcase * str.count(mother.downcase))}.join
end

TESTS
p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""

529 96.9%

------------------------------------------------------------------------
PLAYING WITH DIGITS

PROBLEM
- Given 2 integers (n, p)...
  - p is a positive integer
- Return a number (k), if it exists, else return -1
  - n * k == sum of each digits of n, taken to the successive powers of p

EXAMPLES

n = 253
p = 3

n ** k = (2 ** 3) + (5 ** 4) + (3 ** 5)

DATA
Integers, Array

ALGORITHM
- Initialize var (arr) to the digits in n
- Find the sum of each digit of n, taken to the sucessive powers of p
  -Assign a var (sum) to the sum of the return value of calling the map method on arr
    - For each digit, multiply it to the power of p
    - Reassign the value of p to p + 1
- Create a loop
  - Break the loop if k * n == sum
  - increment k by 1
- If k == sum, return -1 else return k

CODE
def dig_pow(n, p)
  sum = 0
  n.digits.reverse.each do |num|
    sum += num ** p
    p += 1
  end

  (sum % n).zero? ? sum / n : -1
end

TESTS
p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(46288, 3) == 51
p dig_pow(46288, 5) == -1

537 98.8%
------------------------------------------------------------------------
EQUAL SIDES OF AN ARRAY

PROBLEM
- Given an array of integers
  - can be positive and negative numbers
  - size of array is greater than 0, less than 1000 elements)
- Return the index (n) where the sum of the integers to the left of n is equal to the sum of the integers to the right of n, if n exists
  -If not, return -1

EXAMPLES
p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1

DATA
array, integer

ALGORITHM
- Iterate through the array using the each with index method
  -Calculate the sum of the values from the 0 index up to i index
  -Calculate the sum of the values from i + 1 index to -1 index
  -Return i if those sums are equal
-Return -1

CODE
def find_even_index(arr)
  arr.each_index { |idx| return idx if arr.slice(0...idx).sum == arr.slice((idx + 1)..-1).sum }
  -1
end

TESTS
p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1

615 0.3%
------------------------------------------------------------------------
REVERSE OR ROTATE

PROBLEM
- Given a string of digits and a number, x (which represents size)...
- Return a string where...
  - The original string has been split into substrings that x-long (ignore the last chunk if it is shorter than x)
    - For each substring...
      - Cube each element and find the sum of those cubed elements
      - If that sum is even, reverse the chunk
      - Else, rotate it to the left by one position
  - Join the modified substrings into a single string and return that result
  - If x < 0 OR string is empty, return ''
  - If x > string size, return ''

EXAMPLES

Given "123456987654" and 6

First, split into substrings
  '123456'
  '987654'

Then, each element cubed and then added together

  1**3 + 2**3 + 3**3 + 4**3 + 5**3 + 6**3 == 441
  9**3 + 8**3 + 7**3 + 6**3 + 5**3 + 4**3 == 1989

Then, determine if the sum is divisible by 2

  441.even? == false
  1989.even? == false

Then, reverse or rotate
  '123456' => '234561'
  '987654' => '876549'

Then, join the strings
  => "234561876549"

Example of a string rotated to the left by one position:
s = "123456" gives "234561".

DATA
Integers, arrays, strings

ALGORITHM
- Split the string into x-sized substrings
  - discard the last substring if it's less than x-size
- For each substring...
  - Convert to integer, apply the digits method to convert to array of numbers
  - Cube each number and find the sum
  - If even, substring should be reversed
  - Else, rotate substring
- Join substrings, convert to string

CODE
def revrot(str, size)
  arr = str.scan(/\w{#{size}}/)
  arr.map do |substr|
    total = substr.to_i.digits.map { |num| num**3 }.sum
    total.even? ? substr.reverse : substr.rotate
  end.join
end

TESTS
p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"

623 1%
------------------------------------------------------------------------
DECIPHER THIS!

PROBLEM
- Given an encoded message (string) ...
  - For each word...
      - Second and last letters are switched
      - First letter is replaced by character code
- Return the decoded message (string)

EXAMPLES
decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'

DATA
String, array

ALGORITHM
- Initialize var (arr) to value of string, split at ' '
- For each word in the array
  - Convert the first two chars to a letter
  - Switch the second and last character
- Return the array joined with ' '

CODE
def decipher_this(str)
  str.split.map do |word|
    first_letter = word.slice(/\d{2,}/)
    word.gsub!(first_letter, first_letter.to_i.chr)
    word = word[0] + word[-1] + word.slice(2..-2) + word[1] if word.size > 2
    word
  end.join(' ')
end

TESTS
p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

631 1.7%
------------------------------------------------------------------------
BOUNCING BALLS

PROBLEM
Given the following...
- h (height from building floor to ground)
- w (window to ground)
- b (bounce height)

Return the number (the times a ball will pass in front of the window) if all these conditions are met
  - h is greater than 0
  - b is greater than 0, less than 1
  - w is less than h
-Else, return -1

EXAMPLES
h = 3, bounce = 0.66, window = 1.5, => 3

h = 3, bounce = 1, window = 1.5, => -1 

h = 30, bounce = 0.66, window = 1.5) => 15

1 - 30 
3 - 19.8
5 - 13.06
7 - 8.976
9 - 5.92
11 - 3.9
13 - 2.62
15 - 1.72
17 - 1.13


DATA
Integer

ALGORITHM
- Return -1 if the three arguments passed in do not meet the requirements for a valid experiment
- Initialize a count var to 1
- Create a loop
  - Add a break condition for when height is less than window
  - Reassign height to the value of height * bounce
  - Reassign count to the value of count + 2
- Return count - 2

CODE
def bouncingBall(height, bounce, window)
  return -1 if !(height > 0 && bounce > 0 && bounce < 1 && window < height)
  count = 1
  loop do
    height = height * bounce
    return count if height <= window
    count += 2
  end
end

TESTS
p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1

639 2.7%
------------------------------------------------------------------------
WEIRD STRING CASE

PROBLEM
- Given a string (of alphabetic chars and single spaces)...
- Return a new string where even-indexed chars are upcase and odd-indexed chars are downcase
  - Each word begins with a 0 index

  EXAMPLES
weirdcase( "String" )#=> returns "StRiNg"
weirdcase( "Weird string case" );#=> returns "WeIrD StRiNg CaSe"

DATA
String, array

ALGORITHM
- Initialize arr var to the string split into words
- For each word in the array, apply the map method
  - For each word, split the word into an array of characters then apply the each_with_index method to the array
    - If the character is even or 0, apply the upcase method to it
    - Else apply the downcase method to it
  - Join the array
- Join the array with ' '

CODE
def weirdcase(str)
  str.split.map do |word|
    word.chars.each_with_index { |char, idx| idx.even? ? char.upcase! : char.downcase! }.join
  end.join(' ')
end

TESTS
p weirdcase('This') == 'ThIs'
p weirdcase('is') == 'Is'
p weirdcase('This is a test') == 'ThIs Is A TeSt'

647 3.1%
------------------------------------------------------------------------
ARE THEY THE "SAME"?

PROBLEM
- Given 2 arrays (a and b)
- Return true if...
  - You square each element in a and there  is equal, unique corresponding element in b

EXAMPLES
a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
=> true

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
=> false

DATA
Integer, Array

ALGORITHM
- Apply the map method to a
  - Square each element
- Compare the return value of applying the map method to a to b

CODE
def comp(arr1, arr2)
  return false if arr1.nil? || arr2.nil?
  arr1.map { |num| num ** 2 }.sort == arr2.sort
end

TESTS
p comp( [121, 144, 19, 161, 19, 144, 19, 11], [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19])
p comp([121, 144, 19, 161, 19, 144, 19, 11], [132, 14641, 20736, 361, 25921, 361, 20736, 361])

655 3.8%

------------------------------------------------------------------------
GROUPING AND COUNTING

PROBLEM
- Given an array (numbers)
- Return a hash where...
  - Keys == unique values
  - Values == count of each value
  - If input is empty or nil, return nil

EXAMPLES
input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}

DATA
array, integer, hash

ALGORITHM
- Initialize keys var to all the unique values of the input array
- Apply the each with object method to the keys array with a hash parameter
  - For each element
    - Key is equal to the element
    - Value is equal to the occurances of key in the array
- Cannot use length or count methods

CODE
def group_and_count(arr)
  return nil if arr.nil? || arr.empty?
  keys = arr.uniq
  keys.each_with_object({}) { |key, hash| hash[key] = arr.reject { |n| n != key }.rindex(key) + 1 }
end

TESTS
p group_and_count([]) == nil
p group_and_count([0,1,1,0]) == {0=>2, 1=>2}
p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}

(Retired kata)
------------------------------------------------------------------------
FIND THE NEXUS OF THE CODEWARS UNIVERSE

PROBLEM
- Given a hash...
  - Each key-value pair represents a user
  - Keys are rank
  - Values are honor
- Return the rank of the user whose rank is to closest to their honor
  - If multiple users qualify, return the one with the lowest rank

EXAMPLES
        rank    honor
users = {  1  =>  93,
          10  =>  55,
          15  =>  30,
          20  =>  19,    <--- nexus
          23  =>  11,
          30  =>   2 }

users = {1 => 3, 3 => 3, 5 => 1}
=> 3

users = {1 => 10, 2 => 6, 3 => 4, 5 => 1}
=> 3

DATA
Hash, Integer, Array

ALGORITHM
- Sort the has by keys
- Iterate through the hash
  - For each key...
    - Append the absolute value of the difference between rank and honor to each value
- Sort the hash by the value in the 1 index
- Return the first key

CODE
def nexus(users)
  users.min_by { |rank, honor| [(rank - honor).abs, rank] }.first
end

TESTS
p nexus({1 => 3, 3 => 3, 5 => 1}) == 3

p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3

p nexus({30=>5, 25=>10, 20=>15, 15=>20, 10=>25, 5=>30}) == 15

663 4.5%
------------------------------------------------------------------------
COUNT LETTERS IN A STRING

PROBLEM
- Given a string (alphabetic chars)
- Return a hash where...
  - keys are characters as symbols
  - values are character count

EXAMPLES
letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

DATA
string, hash

ALGORITHM
- Split the string into a an array
- Call the each with object method on the array with an empty hash passed in as an argument
  - For each character...
    - Set the key to the character as a symbol
    - Set the value to number of times that character appears in the string

CODE
def letter_count(str)
  str.chars.each_with_object({}) { |char, hash| hash[char.to_sym] = str.count(char) }
end

TESTS
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

(Retired)

------------------------------------------------------------------------
TRIPLE TROUBLE

PROBLEM
- Given 2 numbers
- Return a foolean (1 or 0)
  - Return 1 if...
    - num 1 contains 3 consecutive numbers that are the same
    - and num 2 contains 2 consecutive numbers that are the same
  - Else return 0

EXAMPLES
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

triple_double(12345, 12345) == 0

triple_double(666789, 12345667) == 1

DATA
Integers, Array

ALGORITHM
- Split num 1 into an array
- Iterate through each number in num1. For each number...
  - Check the num1 for triples of that number
    - If it exists, check num2 for doubles of that number
      - If there is a match, return 1
- Return 0

CODE
def triple_double(num1, num2)
  arr = num1.to_s.chars.uniq
  arr.each do |num| 
    return 1 if !num1.to_s.scan(/#{num}{3,}/).empty? && !num2.to_s.scan(/#{num}{2,}/).empty?
  end
  0
end

TESTS
p triple_double(451999277, 41177722899) == 1
p triple_double(1222345, 12345) == 0
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(10560002, 100) == 1
p triple_double(1112, 122) == 0

671 5.2%
------------------------------------------------------------------------
WHICH ARE IN?

PROBLEM
- Given two arrays of strings (a1 and a2)
- Return an array of strings of a1 that are substrings of the strings of a2
  - Sorted in lexicographical order

EXAMPLES

a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

=> ["arp", "live", "strong"]

a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

=> []

DATA
Array, String

ALGORITHM
- Initialize a var (a2_str) into the elements of a2 joined into a single string
- Iterate through a1 by calling the select method
  - For each string, check if a2 includes that string
- Sort the return value of calling the select method on a1

CODE
def in_array(arr1, arr2)
  str2 = arr2.join
  arr1.select { |word| str2.include?(word) }.sort
end

TESTS
a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

p in_array(a1, a2) == ["arp", "live", "strong"]

a1 = ["tarp", "mice", "bull"]

p in_array(a1, a2) == []

671 5.2%
------------------------------------------------------------------------
FORMAT A STRING OF NAMES LIKE 'BART', 'LISA' & 'MAGGIE'

PROBLEM
- Given an array containing hashes of names
- Return a string formatted as...
  - a list of names separated by commas
  - the last two names should be separated by an ampersand

EXAMPLES

list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# returns 'Bart, Lisa & Maggie'

list([ {name: 'Bart'}, {name: 'Lisa'} ])
# returns 'Bart & Lisa'

list([ {name: 'Bart'} ])
# returns 'Bart'

list([])
# returns ''

DATA
Array, Hash, String

ALGORITHM
- Create an array by calling values on the hash
- Join the array with commas and spaces
- Find the index of the last comma
- Replace the last comma with an ampersand

CODE
def list(names)
  str = names.map { |hash| hash.values }.join (', ')
  str[str.rindex(',')] = ' &' if names.size > 1
  str
end

TESTS
p list([{name: 'Bart'},{name: 'Lisa'},{name: 'Maggie'},{name: 'Homer'},{name: 'Marge'}])== 'Bart, Lisa, Maggie, Homer & Marge'
p list([{name: 'Bart'},{name: 'Lisa'}]) ==  'Bart & Lisa'
p list([{name: 'Bart'}]) == 'Bart'

(Retired)
------------------------------------------------------------------------
FORMAT WORDS INTO A SENTENCE

PROBLEM
- Given an array of words
- Return a string where each word is separated by a comma, but the last comma is replaced by 'and'

EXAMPLES
['ninja', 'samurai', 'ronin'] --> "ninja, samurai and ronin"
['ninja', '', 'ronin'] --> "ninja and ronin"
[] -->""

DATA
Array, string

ALGORITHM
-Return nil if the array is nil
-Remove blank spaces from the array
-Return '' if the array is empty
-Join the string with commas
-Replace the last comma with an 'and'

CODE
def format_words(words)
  return '' if words.nil?
  words.delete('')
  return '' if words.empty?
  str = words.join(', ')
  str[str.rindex(',')] = ' and' if words.size > 1
  str
end

TESTS
p format_words(["one", "two", "three", "four"]) == 'one, two, three and four'
p format_words(['one']) == 'one'
p format_words(['one', '', 'three']) == 'one and three'
p format_words(['', '', 'three']) == 'three'
p format_words(['one', 'two', '']) == 'one and two'
p format_words([]) == ''
p format_words(nil) == ''
p format_words(['']) == ''

679 6%
------------------------------------------------------------------------
FIND THE MISSING LETTER

PROBLEM
- Given an array of consecutive letters
  - Always at least 2 letters
  - All elements will always have the same case (upper case or lower case)
- Return the missing letter in the array

EXAMPLES
['a','b','c','d','f'] -> 'e'
['O','Q','R','S'] -> 'P'

DATA
array, string

ALGORITHM
- Initialize a var (alphabet) to an array that contains letters a - z and A - Z
- From the alphabet array, create an array that begins at the first letter of the input element and is the size of the input array
- Delete the input array from the element array and return the first value

CODE
def find_missing_letter(arr)
  alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
  start = alphabet.find_index(arr.first)
  (alphabet.slice(start..(start + arr.size)) - arr).first
end

TESTS
p find_missing_letter(["a","b","c","d","f"]) == 'e'
p find_missing_letter(["O","Q","R","S"]) == "P"
p find_missing_letter(["b","d"]) == "c"
p find_missing_letter(["a","b","d"]) == "c"
p find_missing_letter(["b","d","e"]) == "c"

687 6.7%
------------------------------------------------------------------------
WHO LIKES IT?

PROBLEM
- Given an array that contains names of people
- Return a string...
  - If empty, 'no one likes this'
  - If 1 person, 'Peter likes this'
  - If 2 people, 'Peter and Jacob like this'
  - If 3 people, 'Peter, Jacob and Mark like this'
  - If 4 or more people, 'Peter, Jacob, and x others like this'

EXAMPLES
[]                                -->  "no one likes this"
["Peter"]                         -->  "Peter likes this"
["Jacob", "Alex"]                 -->  "Jacob and Alex like this"
["Max", "John", "Mark"]           -->  "Max, John and Mark like this"
["Alex", "Jacob", "Mark", "Max"]  -->  "Alex, Jacob and 2 others like this"

DATA
Array, string

ALGORITHM
- If array is empty, return 'no one likes this'
- If array has 1 element, return 'some_name likes this'
- If array has 2 elements, return 'some_name and some_name like this'
- If array has 3 elements, return 'some_name, some_name and some_name like this'
- If array has 4 or more elements, return 'some_name, some_name, and x others like this'
  -x == array size - 2

CODE
def likes(arr)
  case arr.size
  when 0 then 'no one likes this'
  when 1 then "#{arr[0]} likes this"
  when 2 then "#{arr[0]} and #{arr[1]} like this"
  when 3 then "#{arr[0]}, #{arr[1]} and #{arr[2]} like this"
  else "#{arr[0]}, #{arr[1]} and #{arr.size - 2} others like this"
  end
end

TESTS
p likes([]) == 'no one likes this'
p likes(['Peter']) == 'Peter likes this'
p likes(['Jacob', 'Alex']) == 'Jacob and Alex like this'
p likes(['Max', 'John', 'Mark']) == 'Max, John and Mark like this'
p likes(['Alex', 'Jacob', 'Mark', 'Max']) == 'Alex, Jacob and 2 others like this'

695 7.4%

------------------------------------------------------------------------
FIND THE PARITY OUTLIER

PROBLEM
- Given an array of numbers (at least 3 elements long) where all the elements save one are even or odd
- Return the outlier number

EXAMPLES
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

DATA
Array, Number

ALGORITHM
132 = 6 (majority odd)
241 = 7 (majority even)

- Create an array of all even elements
- Create an array of all odd elements
- Return the first element of the array with exactly 1 element

CODE
def find_outlier(arr)
  even = arr.find_all { |n| n.even? }
  odd = arr.find_all { |n| n.odd? }

  even.size == 1 ? even.first : odd.first
end

TESTS
p find_outlier([0, 1, 2]) == 1
p find_outlier([1, 2, 3]) == 2
p find_outlier([1, 1, 1, 1, 1, 44, 7, 7, 7, 7, 7, 7, 7, 7]) == 44
p find_outlier([17, 6, 8, 10, 6, 12, 24, 36]) == 17
p find_outlier([0, 1, 2]) == 1
p find_outlier([1, 2, 3]) == 2

703 8.1%
------------------------------------------------------------------------
IS INTEGER ARRAY?

PROBLEM
- Given an array
- Return true if if every element in the array is an integer or a float with no decimals or the array is empty

EXAMPLES
p is_int_array([]) == true
p is_int_array([1, 2, 3, 4]) == true
p is_int_array([-11, -12, -13, -14]) == true
p is_int_array([1.0, 2.0, 3.0]) == true
p is_int_array([1, 2, nil]) == false
p is_int_array(nil) == false
p is_int_array("") == false
p is_int_array([nil]) == false
p is_int_array([1.0, 2.0, 3.0001]) == false
p is_int_array(["-1"]) ==  false

DATA
Array

ALGORITHM
- Return false if array is nil
- Return false if array includes string or nil
- Return false if any elements where n.to_i == n is false

CODE
def is_int_array(arr)
  return false if arr.nil? || arr == '' || arr.any?(String) || arr.any?(nil)
  arr.all? { |n| n.to_i == n }
end

TESTS
p is_int_array([]) == true
p is_int_array([1, 2, 3, 4]) == true
p is_int_array([-11, -12, -13, -14]) == true
p is_int_array([1.0, 2.0, 3.0]) == true
p is_int_array([1, 2, nil]) == false
p is_int_array(nil) == false
p is_int_array("") == false
p is_int_array([nil]) == false
p is_int_array([1.0, 2.0, 3.0001]) == false
p is_int_array(["-1"]) ==  false

711 8.8%
------------------------------------------------------------------------
REVERSING AND COMBINING TEXT

PROBLEM
- Given a string (words separated by spaces)
- Return the reversed and combined string
  - If num words is > 1, reverse each word, then combine it with with the next word
    - If odd number of words, last word is reversed but standalone
  - Repeat the process until only a single word remains

EXAMPLES
Input:  "abc def"
Output: "cbafed"

Input:  "abc def ghi 123"
Output: "defabc123ghi"

Input:  "abc def gh34 434ff 55_eri 123 343"
Output: "43hgff434cbafed343ire_55321"

DATA
Array, string

ALGORITHM
-Split string into an array
-Create a loop that breaks when num elements == 1
  -If array.size is odd, add empty string to end of the array
  -Assign the value of array to the result of iterating through the array by calling the map and with_index methods
    - For each word...
      - If the index is even, Reverse the word and append the reversed word at the next index to it and delete the next word
      - If the index is odd, skip
- Return the first element of the array

CODE
def reverse_and_combine_text(string)
  arr = string.split

  loop do
    break if arr.size == 1
    arr << '' if arr.size.odd?
    arr = arr.map.with_index { |word, idx| word.reverse + arr[idx + 1].reverse if idx.even? }.compact
  end
  arr.first
end

TESTS
p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"

719 9.5%
------------------------------------------------------------------------
INTEGER REDUCTION
https://www.codewars.com/kata/59fd6d2332b8b9955200005f/train/ruby

PROBLEM
- Given 2 integers (n and k)
- Return the lowest number possible as a string when you remove k number of digits from n

EXAMPLES
p solve(123056,1) == '12056'
p solve(123056,2) == '1056'
p solve(123056,3) == '056'
p solve(123056,4) == '05'
p solve(1284569,1) == '124569'
p solve(1284569,2) == '12456'
p solve(1284569,3) == '1245'
p solve(1284569,4) == '124'

DATA
Number, array

ALGORITHM
- Initialize a var (results) to an empty arr
- In the inner loop, add to the results array all the numbers possible where 1 digit is removed from n.
- In the outer loop, reset the value of n to the lowest number in teh results array.
- Repeat the loops until we've iterated through the outer array k number of times
- Return n

CODE
def solve(n, k)
  results = []
  n = n.to_s

  for i in 1..k do
    for i in 0..n.size - 1 do
      arr = n.chars
      arr.delete_at(i)
      results << arr.join
      break if i == n.size
    end
    n = results.min
  end

  n
end

TESTS
p solve(123056,1) == '12056'
p solve(123056,2) == '1056'
p solve(123056,3) == '056'
p solve(123056,4) == '05'
p solve(1284569,1) == '124569'
p solve(1284569,2) == '12456'
p solve(1284569,3) == '1245'
p solve(1284569,4) == '124'


=end

def replace(str, value)
  loop do
    break
  end
  puts str.object_id
  str = value
  puts str.object_id
end

greet = 'Hey!'
puts greet.object_id
replace(greet, 'Hello')
puts greet
puts greet.object_id