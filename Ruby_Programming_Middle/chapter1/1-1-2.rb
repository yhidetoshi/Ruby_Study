class A
  def foo
     "FOO"
  end

  def bar
      foo = "XXX"
      puts foo + self.foo
  end

end
a = A.new
a.bar
