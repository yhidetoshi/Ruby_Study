greeter = Proc.new{|name|
  puts "hello #{name}"
}

greeter.call 'Hoge'
greeter.call 'Huga'

