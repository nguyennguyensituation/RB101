# Create new nested array of columns
def columns_array(arr)
  result = []
  (0..8).each do |row|
    result << (0..8).to_a.map { |col| arr[col][row] }
  end
  result
end

# Create new nested array of 3x3 blocks
def blocks_array(arr)
  rows = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
  cols = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
  new_block = []
  result = []
  counter = 0

  rows.each do |block_row|
    cols.each do |block_col|
      block_row.each do |row|
        block_col.each do |col|
          new_block << arr[row][col]
        end
      end
      result << new_block
      new_block = []
      counter += 1
    end
  end

  result
end

# Determine if valid by checking each array of rows, columns, and blocks
def done_or_not(arr)
  valid = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  arr.each { |row| return 'Try again!' if row.sort != valid }
  columns_array(arr).each { |column| return 'Try again!' if column.sort != valid }
  blocks_array(arr).each { |block| return 'Try again!' if block.sort != valid }
  'Finished!'
end

p done_or_not([
  [5, 3, 4, 6, 7, 8, 9, 1, 2], 
  [6, 7, 2, 1, 9, 5, 3, 4, 8],
  [1, 9, 8, 3, 4, 2, 5, 6, 7],
  [8, 5, 9, 7, 6, 1, 4, 2, 3],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 6, 1, 5, 3, 7, 2, 8, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 4, 5, 2, 8, 6, 1, 7, 9]
])

p done_or_not([
  [5, 3, 4, 6, 7, 8, 9, 1, 2], 
  [6, 7, 2, 1, 9, 0, 3, 4, 9],
  [1, 0, 0, 3, 4, 2, 5, 6, 0],
  [8, 5, 9, 7, 6, 1, 0, 2, 0],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 0, 1, 5, 3, 7, 2, 1, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 0, 0, 4, 8, 1, 1, 7, 9]
  ])