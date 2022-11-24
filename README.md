# robosys2022 コマンド
![test](https://github.com/Nacky002/robosys2022/actions/workflows/test.yml/badge.svg)

* plus
  * 標準入力から数字を読み込み、その総和を出力するコマンド
* plus.bash
  * plus コマンドの動作確認用コマンド
  * 問題がない場合、終了ステータスとして 0 を出力

* avg
  * 標準入力から数字を読み込み、その平均を出力するコマンド
* avg.bash
  * avg コマンドの動作確認用コマンド
  * 問題がない場合、終了ステータスとして 0 を出力

* vari
  * 標準入力から数字を読み込み、その分散を出力するコマンド
* vari.bash
  * vari コマンドの動作確認用コマンド
  * 問題がない場合、終了ステータスとして 0 を出力

* stan
  * 標準入力から数字を読み込み、その標準偏差を出力するコマンド
* stan.bash
  * stan コマンドの動作確認用コマンド
  * 問題がない場合、終了ステータスとして 0 を出力

## 使い方
1. "SSH" の URL をクローン

2. 動作確認 plus.bash を実行

    ```
    ./plus.bash
    ```

3. 標準出力された実行結果を確認

    * 成功の場合（終了ステータスは `0` ）
    ```
    TEST IS SUCCESS !!
    ```

    * 失敗の場合（終了ステータスは `1` ）
    ```
    NG at LINE 17    TEST IS FAILED
    ```

    > **Note**
    > * NG at LINE 17 の 17 は、plus.bash 内の問題が起きた行番号
    > * avg.bash, vari.bash, stan.bash も plus.bash と同じ方法で使用可能

4. ex.1, ex.2 のように plus に、標準入力から数字を読み込ませて実行

    * ex.1  
    ```
    seq 5 | ./plus
    ```

    * ex.2  
    ```
    echo 1 2 3 4 5 | tr ' ' '\n' | ./plus
    ```

    > **Note**
    > * 改行により、複数の数字を識別している
    > * 数字以外の文字を入力すると、エラーが出る
    > * avg, vari, stan も plus と同じ方法で使用可能

5. 標準出力された実行結果を確認

    * ex.1, ex.2 の実行結果

    ```
    15
    ```

## 必要なソフトウェア
* Python
  * 動作確認済みのバージョン : 3.7 ~ 3.10

## 動作確認済みの環境
* Ubuntu 20.04.5 LTS

## 権利関係
* このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。

© 2022 NAGAKI Yuki
