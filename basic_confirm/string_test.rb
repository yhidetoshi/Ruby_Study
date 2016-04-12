names = ["hayashi", "kobayashi", "hoge", "huga"]
names.each do |name|
  if /ha/ =~ name
    puts name
  end
end
