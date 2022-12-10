# Rashat

93氏の[@TA-Track](https://www.dropbox.com/sh/u73uud29hcxlply/AABH9ZhzL1P1kX-bWrL4asdDa?dl=0&preview=%40TA-Track.anm)に含まれる、TA-Normalの改変です。

1つ前と被りのないランダムで登場/移動するアニメーション効果

- [patch.aul](https://github.com/ePi5131/patch.aul)必須
- [Curve Editor](https://github.com/mimaraka/aviutl-plugin-curve_editor) 推奨

## 最新 / Latest

**v1.0**

## Rashat

※元スクリプトと異なる部分のみ記載

| ダイアログ | 内容 |
| -: | :- |
| CurveID[in/out] | in,outのイージングをtableで指定します。<br>Curve EditorのIDを参照します。 |
| 移動距離[in/out] | in,outの距離をtableで指定します。 |
| 有効方向指定 | この効果中に移動可能な方向を指定します。<br>> x,-xで横方向のみ移動 など |
| 被りあり | 個別オブジェクトにおける1つ前の動作と被らないようにするか否かを指定します。 |
| in/out非表示 | 100%状態のとき非表示にします。 |

## クレジット / Credit

- Supported by ePi


## 変更履歴 / Change log

- 1.0
    - 初版。以前あったTA-Normal(X,Y axes Random)の強化版。