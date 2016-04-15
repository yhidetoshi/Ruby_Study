#p Array.new(5, 1)
#array = Array.new(3, 'naive')
#array[0].reverse! 
#p array

#array = [4, 4, 2, 3]
#p array.length
#p array.empty?
#p [].empty?

#p [1, 2, 3] + [4, 5, 6]

#p [1, 2, 3] & [2, 3, 4] 

#p array.first
#p array.first(2)
#p array.last(3)
#p array.last

#p array.sample
#p array.sample(2)
=begin
array << 9
p array

array.push 3
p array

array.pop
p array
=end

#p array.select {|v|v.even?}
#p array.select {|v|v.odd?}

array = [4, 4, 0, 2, 3]
#array.delete 4
#array.delete_at 2
#p array

#p array.uniq
p array
array.uniq!
p array

