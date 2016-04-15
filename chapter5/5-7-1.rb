=begin
file = File.open('dammy.txt')
puts file.read
file.close
=end

=begin
File.open 'dammy.txt' do |file|
   puts file.read
end
=end

=begin
File.open 'dammy.txt' do |f|
   while line = f.gets
      puts line
   end
end
=end

=begin
File.open 'dammy_write.txt', 'w' do |f|
  f.write 'Hello'
end
=end

File.open 'dammy.txt' do |f|
 puts f.atime
 puts f.ctime
 puts f.mtime
 puts f.size
end
