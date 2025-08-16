# TextQR

文字からQRコードを生成します。

[元になったスクリプト](https://shummg.work/archives/1530)


`qrencode.lua`はこのスクリプトと同じ場所に配置してください。


## 最新 / Latest

**r1**

## 各パラメータ

* ### テキスト
> ここに入力した文字がQRコードとして出力されます。

* ### サイズ
> QRコードの表示サイズを指定します。

* ### 色
> QRコードの主に黒で表示される部分の色を指定します。

* ### 透明度
> `色`パラメータの透明度を指定します。

* ### 背景色
> QRコードの主に白で表示される部分の色を指定します。

* ### 背景透明度
> `背景色`パラメータの透明度を指定します。



## ライブラリ
このスクリプトはqrencode.luaを使用しています。



License: 3-clause BSD license
Copyright (c) 2012-2020, Patrick Gundlach (SPEEDATA GMBH) and contributors, see https://github.com/speedata/luaqrcode. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
Neither the name of SPEEDATA nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL SPEEDATA BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.



https://speedata.github.io/luaqrcode/


## 変更履歴 / Change log

- r1
    - 初版