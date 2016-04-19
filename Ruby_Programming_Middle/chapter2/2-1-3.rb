class Hello

#Patern1
 #def Hello.hello

#Patern2
 #def self.hello

#Patern3
  #class << self
    def hello
      puts "Hello"
    end
  #end
end

Hello.hello
