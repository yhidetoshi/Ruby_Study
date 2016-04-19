class Linux

 def distro=(d)
    @distro = d
  end
  
  def version=(v)
    @version = v
  end

 
  def distro
     @distro
  end

  def version
    @version
  end

end


c = Linux.new
c.distro = "CentOS"
c.version = "5.3"
puts "#{c.distro} #{c.version}"

u = Linux.new
u.distro = "Ubuntu"
u.version = "9.04"
puts "#{u.distro} #{u.version}"
