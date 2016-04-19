class A
  def x(str)
    puts str * 3
  end
end

class B < A
  def x(str) 
    super(str)
    puts "end"
  end
end

b = B.new
b.x("Hello")
