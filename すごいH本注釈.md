# すごいH本注釈

## イントロダクション

Haskell でプログラミングできる環境を用意するのに、書いてある Haskell Platform ではなく、今は [Stack](https://docs.haskellstack.org/en/stable/README/) を使うのが楽です。

Stack をインストールしたら

```sh
# GHC をインストールするために一回必要
$ stack setup
$
$ stack ghci
```

で対話モードが起動できます。

また、ほんとうにちょっと試すだけなら Web にもインタープリタがあります。 https://www.tryhaskell.org

ghci のヘルプは `:help` です。 ghci 内で使えるコマンドが一覧できます。
