class Animal
  def eat
    puts "eat something"
  end

  def sleep
    puts "sleep"
  end
end 
 
class Dog < Animal
  def bow
    puts "wanwan!!"
  end
end

class Bird < Animal
  def sing
    puts "pipi!!"
  end
end

pochi = Dog.new
pochi.eat
pochi.sleep
pochi.bow

pichan = Bird.new
pichan.sing
pichan.eat
pichan.sleep
