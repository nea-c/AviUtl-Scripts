# TA-Normal(X,Y axes Random)

93氏の[@TA-Track](https://www.dropbox.com/sh/u73uud29hcxlply/AABH9ZhzL1P1kX-bWrL4asdDa?dl=0&preview=%40TA-Track.anm)に含まれる、TA-Normalの改変です。

X,Yの登場方向が1つ前と被りのない4方向(X,-X,Y,-Y)ランダムになります。

- [patch.aul](https://github.com/ePi5131/patch.aul)必須
- [ease](https://scrapbox.io/ePi5131/ease) , [マルチベジェ起動](https://www.dropbox.com/sh/u73uud29hcxlply/AABH9ZhzL1P1kX-bWrL4asdDa?dl=0&preview=マルチベジェ軌道.zip)推奨

## 最新 / Latest

**v1.2**

## TA-Normal(X,Y axes Random)

※元スクリプトと異なる部分のみ記載

| ダイアログ | 内容 |
| -: | :- |
| easing | in,outのイージングを指定します。<br>正数であればeaseを、負数であればマルチベジェ起動を利用します。<br>また、1～41の間はease内よりUndofish氏のものと同じような番号を指定します。 |
| 座標 | in,outの距離をtableで指定します。 |
| in/out非表示 | 100%状態のとき非表示にします。 |

## クレジット / Credit

- Supported by ePi


## 変更履歴 / Change log

- 1.2
    - 正確な乱数を提供してくれるものを使用するように変更
    - Undofish氏のものではなくePi氏のeaseを利用するように変更

- v1.1
    - 1オブジェクトに複数個付与すると正常に動作しない問題の修正

- v1.0
    - リリース

