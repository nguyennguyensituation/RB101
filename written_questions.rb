def change_name(name)
  puts "line 2 name initialized inside method: #{name}, #{name.object_id}"
  name = 'star'
  puts "line 4 name inside method after reassignment: #{name}, #{name.object_id}"
end

name = 'barb'
puts "line 8 name initialized outside method: #{name}, #{name.object_id}"

change_name(name)

puts "line 12 name outside method after invocation: #{name}, #{name.object_id}"






