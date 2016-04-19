module HelloModule
  def hello
    puts "Hello, module"
  end

  def bye
    puts "Good Bye"
  end
  module_function :hello
  
end

=begin
o = Object.new
p o.extend HelloModule
=end

HelloModule.hello
