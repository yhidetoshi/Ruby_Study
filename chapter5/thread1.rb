t1 = Thread.start {
  6.times do
     puts "thread1を実行中"
     sleep(0.5)
  end
}
3.times do
  puts "Main_Threadを実行する"
end

puts "Thread1の終了を待っている"
t1.join
puts "Thread1が終わったので,Main_Threadを終了する"
