pattern = Regexp.new(ARGV[0])
filename = "input_sample.txt"

file = open(filename)
while text = file.gets
   if pattern =~ text
	puts text
   end
end
file.close
