# Ruby_Study


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


