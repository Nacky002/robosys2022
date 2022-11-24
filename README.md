# データの特徴を調べるコマンド集
![test](https://github.com/Nacky002/robosys2022/actions/workflows/test.yml/badge.svg)

* **plus**
  * 標準入力から数字を読み込み、その「総和」を出力するコマンド
* **avg**
  * 標準入力から数字を読み込み、その「平均」を出力するコマンド
* **vari**
  * 標準入力から数字を読み込み、その「分散」を出力するコマンド
* **stan**
  * 標準入力から数字を読み込み、その「標準偏差」を出力するコマンド

## 動作確認用コマンド

* plus.bash
  * plus の動作確認用コマンド
* avg.bash
  * avg の動作確認用コマンド
* vari.bash
  * vari の動作確認用コマンド
* stan.bash
  * stan の動作確認用コマンド

## 動作確認済みの環境
* Ubuntu 20.04.5 LTS

## 必要なソフトウェア
* Python
  * 動作確認済みのバージョン : 3.7 ~ 3.10

## 使い方

### インストール

1. "SSH" の URL をクローン

2. 動作確認 plus.bash を実行

    ```
    ./plus.bash
    ```

3. 標準出力された実行結果を確認

    * 成功の場合 ( 終了ステータスは `0` )
    ```
    TEST IS SUCCESS !!
    ```

    * 失敗の場合 ( 終了ステータスは `1` )
    ```
    NG at LINE 17    TEST IS FAILED
    ```

    > **Note**
    > * NG at LINE 17 の 17 には、plus.bash 内の問題が起きた行番号が入る
    > * avg.bash, vari.bash, stan.bash も plus.bash と同じ方法で使用可能

4. ex.1, ex.2 のように plus に、標準入力から数字を読み込ませて実行

    * ex.1  
    ```
    ./plus < example
    ```

    * ファイル `example` の中身 ( 例として作成した )
    ```
    5
    10
    25
    ```

    * ex.2  
    ```
    echo 1 2 3.14 4 5.06 | tr ' ' '\n' | ./plus
    ```

    > **Note**
    > * ファイルまたは標準出力の、一行ごとに一つの数値として扱う
    > * 数字と小数点以外の文字を入力すると、エラーが出る
    > * avg, vari, stan も plus と同じ方法で使用可能

    * ex.1 の実行結果
    ```
    40
    ```

    * ex.2 の実行結果
    ```
    15.2
    ```

## ライセンス
* このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。

© 2022 NAGAKI Yuki
