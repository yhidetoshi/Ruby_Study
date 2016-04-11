# Ruby_Study


### YAMLの書き方
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
