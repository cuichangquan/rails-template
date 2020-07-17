[Markdown記法 チートシート](http://qiita.com/Qiita/items/c686397e4a0f4f11683d)

# メモ(ここに集約する)

### 力を入れるべき分野
    1. SSO シングルサインオン(他のAPPとの認証連携)
    2. Vue.js

### vim-abolish

| コマンド | 動作 |
|:-------|:----------------------------|
| crs    | "SnakeCase" → "snake_case"  |
| crm    | "mixed_case" → "MixedCase"  |
| crc    | "camel_case" → "camelCase"  |
| cru    | "upper_case" → "UPPER_CASE" |


    ###[Rails] bundle installは pathを指定すべきだ。(ctagsの生成はgemまでやってくれる。)[ruby on Rails]
    bundle install  --path vendor/bundle



    ###[ctags][git]
    .git/の下にtagsを生成してはいけない。vimがすごく重くなる傾向がある


    ###[git] git変更は敢えて変更無視
    git update-index --assume-unchanged    [ファイル名]    # assume-unchangedに追加
    git update-index --no-assume-unchanged [ファイル名]    # assume-unchangedから削除
    git ls-files -v | grep '^[[:lower:]]'                # 一覧を確認



    ###[git] gitで削除したファイルを復活させる
    $ git rev-list -n 1 HEAD -- (削除したファイルパス)
    $ git checkout 12345678^ -- (削除したファイルパス)




    ###[rails] has_one with condition
    has_one :author, -> { where(comment_id: 1) }
    has_one :employer, -> { joins(:company) }, class_name: "Person"
    has_one :dob, ->(dob) { where("Date.new(2000, 01, 01) > ?", dob) }
    

    ### checking for pg_config... noの対策
    sudo yum install -y postgresql-devel


### Gem 
- https://github.com/JDutil/contact_us (問い合わせForm)
- https://github.com/gazay/gon (railsで【超簡単に】javascriptに変数を渡す方法)
    
### [Docker で Rails5 の開発環境を「rails new」から構築する](http://qiita.com/kawasin73/items/d5836007c715b7f7885f)
### [The Ruby Toolbox](https://www.ruby-toolbox.com/)

### [Ruby Excelファイルを扱う](https://github.com/zdavatz/spreadsheet/blob/master/GUIDE.md)

### [escape_javascript](http://www.carlosramireziii.com/when-to-use-escape-javascript-in-an-sjr-template.html)

### [世界一簡単にブラウザのプッシュ通知を実装できる「Push.js」](https://nickersoft.github.io/push.js/)

### [Keychain に保存したパスワードをコピペできる Alfred Workflow を作った](http://qiita.com/masamoto/items/546131bcfef8621e76ff)
  
### [imagemagick convert to pdf](https://www.google.co.jp/search?q=imagemagick+convert&oq=imagemagick+convert+&aqs=chrome..69i57j0l5.5982j0j7&sourceid=chrome&ie=UTF-8#q=imagemagick+convert+to+pdf)

### [railsの画像最適化でpietを使う](http://blog.attracie.com/entry/2016/12/16/180233)

### [httpコマンド curlみたいなツール](https://github.com/jakubroztocil/httpie)

### [サイトを37倍に高速化した7つの手法](http://allabout-tech.hatenablog.com/entry/2016/09/28/094600?utm_content=buffer07a08&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer)

### Rails分散技術
- [activerecord-turntable](https://github.com/drecom/activerecord-turntable)
- [multi-database-rails-active-record-model](http://morizyun.github.io/blog/multi-database-rails-active-record-model/)

### [http Parametersの簡易テスト](http://codefol.io/posts/How-Does-Rack-Parse-Query-Params-With-parse-nested-query)

### 画像処理
- 画像最適化ツール
  https://tinypng.com/
  https://compressor.io/

- シャドバ、バンドリが使っている画像最適化ツール(圧縮/減色)
  http://www.webtech.co.jp/imesta/mobile/
