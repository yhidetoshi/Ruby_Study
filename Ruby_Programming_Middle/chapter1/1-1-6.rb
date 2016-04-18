ary = %w(Ruby PHP Python Perl Java C C++ C# D)
count = 1

# Patern1
ary.each { |lang|
  puts "#{count}: " + lang
  count += 1
}

# Patern2
ary.each do |lang|
  puts lang
end

