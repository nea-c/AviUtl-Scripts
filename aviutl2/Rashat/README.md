# Rashat

93氏の[@TA-Track](https://www.dropbox.com/sh/u73uud29hcxlply/AABH9ZhzL1P1kX-bWrL4asdDa?dl=0&preview=%40TA-Track.anm)に含まれる、TA-Normalの改変です。

1つ前と被りのないランダムで登場/移動するアニメーション効果

- [patch.aul](https://github.com/ePi5131/patch.aul) , [Curve Editor](https://github.com/mimaraka/aviutl-plugin-curve_editor) 必須

## 最新 / Latest

**v1.3**

## Rashat

※元スクリプトと異なる部分のみ記載

| ダイアログ | 内容 |
| -: | :- |
| CurveEditor | in,outのイージングをtableで指定します。<br>{{type,value/id},{type,value/id}} のように指定します。<br>{type,value/id}と指定するとin,out両方が同じ動作になります。 |
| 移動距離 | in,outの距離をtableで指定します。<br>数値のみで指定するとin,out両方が同じ移動距離になります。 |
| 有効方向指定 | この効果中に移動可能な方向を指定します。※zも指定可能。<br>> x,-xで横方向のみ移動 など |
| 被りあり | 個別オブジェクトにおける1つ前の動作と被らないようにするか否かを指定します。 |
| in/out非表示 | 100%状態のとき非表示にします。 |

## クレジット / Credit

- Supported by ePi


## 変更履歴 / Change log

- 1.3
    - CurveEditorのv1.0で動作するように修正

- 1.2
    - 有効方向指定の記入する順番によって効果のかかり方が違う問題の修正

- 1.0
    - 初版。以前あったTA-Normal(X,Y axes Random)の強化版。