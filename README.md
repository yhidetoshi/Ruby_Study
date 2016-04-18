# Ruby_Study

<a id="index"></a>
## <a href="#index">目次</a>
* [YAML](#anchor1)
* [Rakefile](#anchor2)
* [Rubyメモ] (#anchor)
 - 繰返し
   - time文
   - for文
   - while文
   - each文


![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Ruby_Study/yaml-icon.png)

## YAMLの書き方
- YAMLとは
  - 構造化されたデータを表現するためのデータ形式の一種。
  - YAML Ain't Markup Language類似の規格としてJSONと近い
  
- 書き方  
  - コメントアウトはパウンド記号(#)
  - ハッシュ形式-> `key:[半角スペース]value`

```
#input1.yml

- d1
- d2
- d3

(出力結果) ["d1", "d2", "d3"]
```

```
#input2.yml

- d1
-
  - x1
  - x2
- d3

(出力結果) ["d1", ["x1", "x2"], "d3"]
```

```
#input3.yml

name : tomato
email: potato@hoge.com

(出力結果) {"name"=>"tomato", "email"=>"potato@hoge.com"}
```

```
#input4.yml

name: tomato
email:
  mainaddress: potato@hoge.com
  subaddress: jagaimo@hoge.com

(出力結果) {"name"=>"tomato", "email"=>{"mainaddress"=>"potato@hoge.com", "subaddress"=>"jagaimo@hoge.com"}}
```

```
- name : tomato
  email: tomato@gmail.com
- name : potato
  email: potato@gmail.com
(実行結果) [{"name"=>"tomato", "email"=>"tomato@gmail.com"}, {"name"=>"potato", "email"=>"potato@gmail.com"}]
```

```
names :
  - tomato1
  - tomato2
emails:
  - potato1@gmail.com
  - potato2@gmail.com
(実行結果) {"names"=>["tomato1", "tomato2"], "emails"=>["potato1@gmail.com", "potato2@gmail.com"]}
```

####ブロックスタイルとフロースタイル
```
# ブロックスタイル
- tomato
- potato
(実行結果) ["tomato", "potato"]

name : apple
color: red
(実行結果) {"name"=>"apple", "color"=>"red"}


# フロースタイル
[tomato, potato]
(実行結果) ["tomato", "potato"]

{name: apple, color: red}
(実行結果) {"name"=>"apple", "color"=>"red"}
```

- YAMLのデータ型のまとめ
  - データ型は自動で認識
  - 文字列に型変換する時にはダブルクォーテーションで囲む

- yamlでの改行表現
  - テキストの改行は認識されずスペースに変換される
```
doc:
  aaa
  bbb
  ccc
(実行結果) {"doc"=>"aaa bbb ccc"}
```

  - (>)を用いて文章の最後の改行のみを認識させる
```
doc: >
  aaa
  bbb
  ccc
  
(実行結果) {"doc"=>"aaa bbb ccc\n"}
```

  - (|)を用いて全ての改行を認識させる
```
doc: |
  aaa
  bbb
  ccc

(実行結果) {"doc1"=>"aaa\nbbb\nccc\n"}

- |
  aaa
  bbb
  ccc
(実行結果) ["aaa\nbbb\nccc"]
```

  - (...)で以降の読み込みを中止
  - ハイフン×3つ(---)を使用してデータ区切り
```
- d1
- d2
- d3
...
- x1
- x2

(実行結果) ["d1", "d2", "d3"]

−−−
- d1
- d2
- d3
---
- x1
- x2
(実行結果)
["d1", "d2", "d3"]
["x1", "x2"]
```

### Rakefileの書き方

- Rake
  - Rake とはRuby製のビルドプログラムで、プログラム実行を"タスク"という単位でまとめて扱うことが出来る
- Rakefile
  - Rakefileの文法は、通常のRubyプログラムにいくつかrake用の記述を追加したもの.
  - Rubyプログラムで実行可能なことは何でもできる.

**[helloを表示するタスクを作る]**
Rakefile
```
#coding: utf-8
require 'rake'
require 'yaml'
task :default => :hello

namespace :hello do
  desc "朝の挨拶"
  task :morning do
  	puts 'Good Morning'
  end

  desc "昼の挨拶"
  task :noon do
	puts 'Good Afternoon'
  end
end
```
- **rakeタスクに追加されているか確認**
```
$ rake -T                                                [~/ruby-study/rake]
rake hello:morning  # 朝の挨拶
rake hello:noon     # 昼の挨拶
```

**(実行結果)**
```
$ rake hello:morning                                     
Good Morning
$ rake hello:noon
Good Afternoon
```

- **namespaceを入れ子に**
```
namespace :hello do

  namespace :morning do
     desc "丁寧"
     task :polite do
         puts 'Good Morning'
     end

     desc "軽い"
     task :friendly do
         puts 'Morning'
     end
  end
end
```
**(実行結果)**
```
$ rake hello:morning:polite                 
Good Morning
$ rake hello:morning:friendly
Morning
```

- **引数を渡す**
[環境変数を利用]
```
namespace :hello do
  task :morning do
    p ENV['GREETING']
    p ENV['TO_NAME']
  end
end
```
**(実行結果)**
```
rake hello:morning GREETING="good" TO_NAME="Taou"
"good"
"Taou"
```

![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Ruby_Study/ruby-icon.png)


**[コメントアウト]**
```
# 1行

# 複数行
=begin
  puts 'hogehuga'
=end
```

**[繰り返し]**
- **times文**
```
4.times do
  puts 'hogehoge'
end
```
```
5.times do |i|
  puts i
end
```
- **for文**
```
sum = 0
for i in 1..5
  sum = sum + i
end
puts sum
```
```
from = 10
to = 20
for i in from..to
  sum = sum += i
end
puts sum
```
```
names = ["awk", "Perl", "Java", "Python"]
for name in names
   puts name
end
```
- **while文**
```
i = 1
while i < 10
  puts i
  i = i +1
end
```
- **each文**
```
names = ["Java", "Perl", "Ruby"]
names.each do |name|
  puts name
end
```
```
sum = 0
(1..5).each do |i|
  puts i
end
```

**[配列]**
- 宣言
```
num = [1, 2, 3, 4, 5]
p num

str = ["hoge", "huga", "hhoogee"]
p str

# [1, 2, 3, 4, 5]
# ["hoge", "huga", "hhoogee"]
```

- Arrayクラス
```
a = Array.new
p a

b = Array.new(5)
p b

c = Array.new(5, 0)
p c

# []
# [nil, nil, nil, nil, nil]
# [0, 0, 0, 0, 0]
```
- hash
```
font_table = {:normal => "0", :small => "-1", :big => "+1"}
p font_table[:normal]
p font_table[:big]

# "0"
# "+1"
```
- %wで配列を定義
```
iroha = %w(a i u e o)
p iroha

# ["a", "i", "u", "e", "o"]
```

**[メソッド]**
```
def hello(name="hoge")
   puts name
end

hello()
hello("huga")
```
```
def volume(x, y, z)
  return x + y + z
end

puts volume(1, 2, 3)
```
```
def max(a, b)
  if a > b
    puts a
  else
    puts b
  end
end

max(5,10)
```

**[case文]**
```
array = ['a', 1, nil]
array.each do |item|
   case item
   when String
        puts "item is String"
   when Numeric
        puts "item is Numeric"
   else
        puts "item is something"
   end
end
```
**[標準入力と型変換]**
```
num0 = ARGV[0].to_i
num1 = ARGV[1].to_i

print num0 + num1, "\n"
puts num0 - num1
```
**[File処理]**
- read (close処理有り)
```
filename = "input_sample.txt"
file = open(filename)
text = file.read
puts text
file.close
```
- read
```
filename = "input_sample.txt"
text = File.read(filename)
print text
```
- get
```
filename = "input_sample.txt"
file = open(filename)

while text = file.gets
  puts text
end
file.close
```

- rename
```
File.rename("before.txt", "after.txt")
```
- rename(mv)
```
File.rename('data1.txt', 'backup/data1.txt')
```
- chmod
```
File.chmod(0777, "hello.rb")
```
- cp
```
FileUtils.cp("data.txt", "backup/data.txt")
```
- mv 
```
FileUtils.mv("data.txt", "backup/data1.txt")
```
- delete
```
File.delete("hoge.txt")
```
- mkdir
```
Dir.mkdir("temp")
```
- pwd
```
p Dir.pwd

Dir.chdir("../")
p Dir.pwd

# "/Users/hidetoshi/ruby-study/basic_confirm"
# "/Users/hidetoshi/ruby-study"
```
- rmdir
```
Dir.rmdir("temp")
```
