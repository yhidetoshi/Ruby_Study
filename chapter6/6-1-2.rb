FirstClass = Class.new
p first_class_instance = FirstClass.new

SecondClass = Class.new(FirstClass)
p SecondClass.superclass
