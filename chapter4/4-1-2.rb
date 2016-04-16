=begin
class MyClass
  def method_a
    puts 'method_a called'
  end
  def method_b
    method_a 
  end
end

my_object = MyClass.new
p my_object.method_b
=end

class Brownie
  def intialize 
    @baked = false
  end

  def bake!
    @baked = true
    self
  end

  def baked?
    @baked
  end
end

b = Brownie.new
p b.baked?
p b.bake!
p b.baked?
