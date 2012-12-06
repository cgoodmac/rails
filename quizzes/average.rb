require 'pry'

array = []

(250..725).each do |i|
  array << i
end

total = array.inject(:+)

average = total/ (array.length)

puts average

binding.pry
