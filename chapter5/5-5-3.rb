=begin
array = 'password'
p array.hash
=end
=begin
hash = {one: 1,two: 2}

hash.each do |key, val|
   puts "#{key}:#{val}"
end

hash.each_key do |key|
   puts "#{key}"
end

hash.each_value do |val|
   puts "#{val}"
end
=end

=begin
hash = {foo: 1, bar: 2, baz: 3}

p hash.select{|key, val| val.odd?}
p hash.select{|key, val| val.even?}
=end

=begin
a = {one: 'A', two: nil}
b = {two: 'B', three: 'C'}
p a.merge(b)
=end
=begin
hash = {one: 'A'}
hash.merge! two: 'B'
p hash
=end

=begin
h = {one: 'A', two: 'B', three: 'C'}
p h.keys
p h.values
=end

has_default = Hash.new('undefined')

p has_default['foo']
