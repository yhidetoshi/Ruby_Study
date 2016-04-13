class RSpecGreeter
   def greet
	"Hello RSpec!"
   end
end

describe "RSpec Greeter" do
   it "should say 'Hello RSpec!' when it receives the g                   reet() message" do
	greeter = RSpecGreeter.new
	greeting = greeter.greet
	greeting.should == "Hello RSpec!"
   end
end
