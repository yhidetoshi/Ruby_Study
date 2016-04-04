class Parent
	def hello
		puts 'Hello, Parent class'
	end
end

class Child < Parent
	def hi
		puts 'Hello Child class'
	end
end

child = Child.new
puts(child.hello)
puts(child.hi)
