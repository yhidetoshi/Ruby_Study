module ModuleA
  def from_a
    puts 'A'
  end
end

module ModuleB
  def from_b
    puts 'B'
  end
end

class MyClass
  include ModuleA
  include ModuleB
end

my_object = MyClass.new
my_object.from_a
my_object.from_b
