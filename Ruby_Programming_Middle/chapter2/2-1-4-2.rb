class Linux
  attr_accessor :distro, :version
end

c = Linux.new
c.distro = "CentOS"
c.version = "5.3"
puts "#{c.distro} #{c.version}"

u = Linux.new
u.distro = "Ubunt"
u.version = "10"
puts "#{u.distro} #{u.version}"
