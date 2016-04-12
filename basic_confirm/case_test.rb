array = ['a', 1, nil]
array.each do |item|
  case item
  when String
	puts "item is string"
  when Numeric
	puts "item is numeric"
  else
	puts "item is something"
  end
end

