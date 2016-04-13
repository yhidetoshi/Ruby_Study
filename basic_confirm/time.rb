filename = "hello.rb"
st = File.stat(filename)
p st.ctime
p st.mtime
p st.atime

