# [SublimeHaskell](https://github.com/SublimeHaskell/SublimeHaskell) & [SublimeREPL](https://github.com/wuub/SublimeREPL)
静的構文チェック、コード補完、定義ジャンプができるようになる SublimeHaskell と REPL の環境 (SublimeREPL) を SublimeText3 上に構築します。

イメージ。
![](https://github.com/yuichiro-yoshida/haskell-tips/raw/master/img/sublimehaskell.png)

# 手順 (Windows の場合)
※色々長く書いていますが、導入したい時は吉田、谷口がサポートします。
1. `C:\sr\global-project\stack.yaml` (デフォルトの場合ここにある) を編集し、 `resolver` の値を `nightly-2017-07-03` のように 、[Stackage](https://www.stackage.org/) に載っている最新のバージョンにする
2. `stack install hsdev` を実行する
    - ここで依存ライブラリ関連っぽいエラーが出た場合、下記「stack.yaml の resolver について」を参照する
3. SublimeText3 をインストールする
4. [この記事](http://futago-life.com/sublime-text3-wiki/first-step/install/package-control)を参考に SublimeText のパッケージコントロールのインストールをする
5. SublimeText 上で、 `Preferences > Package Control` から `Package Control:Install Pacakge` を選び、 `SublimeHaskell` を検索してインストールする
6. `Preferences > Package Settings > SublimeHaskell > Settings - User` から設定ファイルを開き、下記のように記載して hsdev のパスを指定する (「ユーザ名」を適切に書き換える)。
```
{
  "add_to_PATH": [
    "C:/Users/ユーザ名/AppData/Roaming/local/bin"
  ]
}
```
7. SublimeText 上で、 `Preferences > Package Control` から `Package Control:Install Pacakge` を選び、 `SublimeREPL` を検索してインストールする
8. SublimeREPL を stack に対応させるため、 `C:\Users\ユーザ名\AppData\Roaming\Sublime Text 3\Packages\SublimeREPL\config\Haskell\Main.sublime-menu` を開き (「ユーザ名」を適切に書き換える)、 `cmd` の値を `"cmd": ["stack", "exec", "ghci"]` にする
9. SublimeText を再起動する
10. SublimeHaskell は自動で実行される。SublimeREPL は、ロードしたい .hs ファイルを開いている状態で、 `Tools > SublimeREPL > Haskell` を選択して起動する。`View > Layout > Columns: 2` を使って画面を2分割すると見やすい。

# 注意点
- hsdev のエラーを防ぐため、各ファイルには必ずモジュール定義を行う ([hsdev のイシュー#35](https://github.com/mvoidex/hsdev/issues/35) 参照)
    - 1行目に `module ModuleName where` を書くとか
    - 大文字、小文字の一致に気をつける
- 上手く起動しない場合 (上記画像のイメージ) にならない場合、タスクマネージャから古い hsdev を落として SublimeText を再起動してみたり、手動で `hsdev start` コマンドを叩いて hsdev を起動してみたりする
    - SublimeText 上で `Ctrl + @` を叩くとコンソールを見ることができる

# おすすめ
- デフォルトでは SublimeREPL 上の入力でオートコンプリートが走って Enter を押す度に意図しない単語に変換されてしまうので、SublimeREPL のユーザ設定ファイルに下記を追加すると良いです。

```
"repl_view_settings": {
    "auto_complete": false
}
```

# stack.yaml の resolver について
- この値は [Stackage](https://www.stackage.org/) の build plan のバージョンを指す
- build plan には、世の膨大な Haskell ライブラリが相互に衝突しないように整合性チェック済みの各ライブラリのバージョン定義が書いてある
- もし hsdev のインストールで依存ライブラリ関連のエラーが起きる場合、この値を変更すると上手くいくかもしれない
