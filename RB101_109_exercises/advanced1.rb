=begin

2. SEEING STARS

def star(num)
  outer, inner = 0, (num / 2) - 1
  result = []

  loop do
    result << (' ' * outer) + '*' + (' ' * inner) + '*' + (' ' * inner) + '*' + (' ' * outer)
    inner -= 1
    outer += 1
    break if inner < 0 
  end

  puts result, '*' * num, result.reverse
end

3, 4. TRANSPOSE 3X3, TRANSPOSE MXN

def transpose(matrix)
  result = []
  (0..(matrix.first.size - 1)).each do |col_i|
    new_row = (0..(matrix.size - 1)).map { |row_i| matrix[row_i][col_i]}
    result << new_row
  end
  result
end

7. MERGE SORTED LISTS

def merge(arr1, arr2)
  result = []
  i = 0

  arr1.each do |num|
    while i < arr2.size && arr2[i] < num do
      result << arr2[i]
      i += 1
    end

    result << num
  end
  result + arr2[i..-1]
end

8. MERGE SORT

PROBLEM
-Given an array (all elements are of the same type, e.g. all strings, all numbers)
-Return a sorted array using merge sort


# HOW MERGE SORT WORKS
# Given an unsorted array

[14, 33, 27, 10, 35, 19, 42, 44]

# Divide the array into equal halves, and keep dividing until each array only contains one element

# First division...

[14, 33, 27, 10]
[35, 19, 42, 44]

# Second division...

[14, 33]
[27, 10]
[35, 19]
[42, 44]

# Third division...

[14]
[33]
[27]
[10]
[35]
[19]
[42]
[44]

# When we're down to one element per array, start combining them in sorted manner...

# First combination...

[14, 33]
[10, 27]
[19, 35]
[42, 44]

# Second combination...

[10, 14, 27, 33]
[19, 35, 42, 44]

# Third combination (and final sorted list)...
[10, 14, 19, 27, 33, 35, 42, 44]

Step 1 − if it is only one element in the list it is already sorted, return.
Step 2 − divide the list recursively into two halves until it can no more be divided.
Step 3 − merge the smaller lists into new list in sorted order.


def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

def merge_sort(arr)
  return arr if arr.size == 1

  list1 = arr[0...arr.size / 2]
  list2 = arr[arr.size / 2...arr.size]

  list1 = merge_sort(list1)
  list2 = merge_sort(list2)

  merge(list1, list2)
end

9. EGYPTIAN FRACTIONS

Rational number: A number that can be represented as the result of division between two integers.

  1/3
  3/2
  22/7

Unit Fraction: A Rational number where the numerator == 1

  1/3
  1/4

Egyptian Fraction: The sum of a series of unique unit fractions.

  2 == 1/1 + 1/2 + 1/3 + 1/6

Method 1: Egyptian
- Given a rational number (numerator, denominator)
- Return an array of denominators of the Egyptian Fraction representation of that number

Method 2: Unegyptian
- Given an array of denominators of the Egyptian Fraction representation of a number
- Return the rational number (numerator, denominator)

def egyptian(num)
  result = []
  denominator = 1
  sum = 0
  loop do
    break if sum == num
    if sum + Rational(1, denominator) <= num
      result << denominator
      sum += Rational(1, denominator)
    end
    denominator += 1
  end

  result
end

def unegyptian(arr)
  arr.inject(0) { |sum, denominator| sum + Rational(1, denominator) }
end

=end


def transpose(matrix)
  result = []
  (0..(matrix.first.size - 1)).each do |col_i|
    new_row = (0..(matrix.size - 1)).map { |row_i| matrix[row_i][col_i]}
    result << new_row
  end
  result
end


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]