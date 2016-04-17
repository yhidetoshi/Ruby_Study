module Greetable
  def greet_to(name)
   puts "Hello, #{name}. My Name is #{self.class}"
   puts 'test'
  end
end

class Alice
 include Greetable
end

#Greetable.greet_to 'Hoge'
alice = Alice.new
alice.greet_to 'Bob'
