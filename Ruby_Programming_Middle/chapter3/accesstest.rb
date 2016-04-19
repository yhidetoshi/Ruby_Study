class Accesstest
  def public_method
    puts "Public Method"
  end

  private
  def private_method
    puts "Private Method"
  end
end

at = Accesstest.new
at.public_method
#at.private_method

