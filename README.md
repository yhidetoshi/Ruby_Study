# Ruby_Study

<a id="index"></a>
## <a href="#index">目次</a>
* [YAML](#anchor1)
* [Rakefile](#anchor2)
* [Rubyメモ] (#anchor)
 - 繰返し
   - time/for/while/each
 - 配列
   - 宣言/Arrayクラス/hash/%w/
 - 制御構造/メソッド/組込み関数
   - 条件分岐 
   
 - 標準入力と型変換
 - File/Dir処理
   - read/get/rename/mv/chmod/cp/delete/mkdir/pwd/rmdir
 -  オブジェクト指向
   - クラス定義/インスタンス初期化/アクセスメソッド/継承/super 
 - モジュール
 - 主な組み込みクラス
 - 時間
 - スレッド

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

![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Ruby_Study/rake-icon.jpg)

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

**[制御構造/メソッド/組込み関数]**
- **制御構造**
```
n = 2
if    n.zero?    #=> 0判定
elsif n.even?    #=> 偶数判定
elsif n.odd?     #=> 奇数判定
```

- **[ブロックの戻り値・引数]**
`yieldはブロックの戻り値を返す. 最後に評価された式の値`
```
def display_value
  puts yield
end

display_value do
  777
end  #=> 777と表示される
```

- **メソッド**
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
**[オブジェクト指向]**

- **[クラス定義/オブジェクト作成]**
```
class Hello
  def Hello
    puts "Hello Ruby"
  end

  def bye
    puts "Good Bye"
  end
end

g = Hello.new
g.Hello
g.bye

# 実行結果
#=> Hello Ruby
#=> Good Bye
```
- **[インスタンス初期化]**

`initialize`メソッドを定義するとインスタンス生成時に自動的に実行される.

`@`で始まる名前の変数はインスタンス変数と言う.
```
class Hello
  def initialize(name)
     @name = name
  end

  def hello
     puts "Hello #{@name}"
  end

  def bye
     puts "Bye #{@name}"
  end
end

fred = Hello.new("Fred")
fred.hello
fred.bye

# 実行結果
#=> Hello Fred
#=> Bye Fred
```
- **[アクセスメソッド]**
`インスタンス変数は外部からアクセスできないがインスタンス変数にアクセスできるメソッドを作れば、参照や代入が可能`
```
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
c.version = "6.5"
puts "#{c.distro} #{c.version}"

#=> CentOS 6.5
```
これをアクセスメソッドの`attr_accessor`を使うと下記のようになる

**[attr_accessorを利用した場合]**
```
class Linux
  attr_accessor :distro, :version
end

c = Linux.new
c.distro = "CentOS"
c.version = "6.5"
puts "#{c.distro} #{c.version}"

#=> CentOS 6.5
```


 - **[継承]**
` class サブクラス < スーパークラス`

 ```
 class Parent
  def hello
      puts "Hello Parent class"
  end
end

class Child < Parent
  def hi
     puts "Hello Child class"
  end
end

child = Child.new
child.hello
 ```
- **[superメソッド]**
`superメソッドを使うと,スーパークラスにある同名のメソッドを呼び出せる`
```
class A
  def x(str)
    puts str * 3
  end
end

class B < A
  def x(str)
    super(str)
    puts "end"
  end
end

b = B.new
b.x("Hello")

# 実行結果
#=> HelloHelloHello
#=> end
```
 
**[モジュール]**
`インスタンス化できないクラスのようなもの`
```
module ModuleA
  def from_a
    puts 'A'
  end
end

module ModuleB
  def from_b
    puts 'B'
  end
end

class MyClass
  include ModuleA
  include ModuleB
end

my_object = MyClass.new
my_object.from_a
my_object.from_b
```
**[主な組込みクラス]**
```
# round:四捨五入
1.3.round #=> 1

# 繰返しstep
3.step 5 do |num|
 puts num
end

# odd?:奇数判定
1.odd?  #=> true

#偶数判定
4.even? #=> true

2.next
2.succ
2.pred
30.to_s
2.to_s(2)
9.to_s(16)
123.to_i
Time.now.to_i

# upto:カウントアップ
1.upto 3 do |num|
  puts num
end

# downto:カウントダウン
3.downto 1 do |num|
  puts num
end

# 配列:最初の要素
array = [1, 2, 3, 4]

array.first           #=> 1
array.values_at(1)    #=> [1]
array.values_at(1..2) #=> [1, 2]
array.min             #=> 1
array.max	      #=> 4
array.minmax	      #=> [1, 4]
array.last            #=> 4
array.length          #=> 4 
array.empty?          #=> false
array.include?(4)     #=> true
array.sample          #=> ランダムで1要素抽出
array.sample(2)       #=> ランダムで2要素抽出
array.push 3          #=> 最後に3を追加(スタックに入れるのと同じ)
array.pop             #=> スタックでいうpop(一番上から取り出す)
array.delete 3        #=> 3の要素を全て消す
array.compact         #=> nilを削除
array.reverse	      #=> 配列を逆順に並べ替える
array.sort	      #=> 小さい順に並び替える
array.hash	      #=> ハッシュ化する

a.merge(b)            #=>a配列にb配列をマージする
```
**[時間]**
```
p Time.now            #=> 2016-04-17 15:51:31 +0900

now = Time.now	      #=>
p now.year	      #=> 2016
p now.month	      #=> 4
p now.day	      #=> 17
p now.hour	      #=> 15
p now.min	      #=> 51
```
 **[スレッド]**
`thread1.rb`
```
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
```
**実行結果**
```
Main_Threadを実行する
thread1を実行中
Main_Threadを実行する
Main_Threadを実行する
Thread1の終了を待っている
thread1を実行中
thread1を実行中
thread1を実行中
thread1を実行中
thread1を実行中
Thread1が終わったので,Main_Threadを終了する
```
