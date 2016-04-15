=begin
languages = %w(perl python ruby)
i = 0

while i < languages.length
	puts "Hello, #{languages[i]}"
	i += 1
end

3.times do
	puts 'こんにちは'
end
=end

languages = %w(perl ruby java)
i = 0
while i < languages.length
  puts "Hello #{languages[i]}"
  i += 1
end

3.times do
   puts "hello"
end
 
for name in %w(perl ruby java)
  puts name
end
