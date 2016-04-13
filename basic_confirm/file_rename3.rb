require "fileutils"
FileUtils.cp("data.txt", "backup/data.txt")
FileUtils.mv("data.txt", "backup/data1.txt")
