# RStudio

RStudioは、統合開発環境（IDE）として機能するR言語のフリーソフトウェアです。RStudioは、データの分析、可視化、および報告を行うためのツールを提供します。RStudioは、スクリプトエディタ、コンソール、グラフィックス、パッケージマネージャー、およびデバッグツールを備えた、使いやすく直感的なユーザーインターフェースを提供します。

RStudioは、Rプログラムを実行するためのコンソール、スクリプトエディタ、変数エクスプローラー、データビューアー、およびプロットパネルを提供します。また、Rパッケージのインストール、ロード、管理を行うためのパッケージマネージャーを備えています。RStudioは、R MarkdownドキュメントやShinyアプリケーションを作成するためのツールも提供しています。

さらに、RStudioは、GitやSubversionなどのバージョン管理システムをサポートし、データ分析プロジェクトのバージョン管理と協調作業を簡単にするためのツールも提供しています。

RStudioは、Windows、Mac、Linuxなどのオペレーティングシステムで利用できます。

## インストール

1. RStudioのダウンロードページ（ [RStudio Desktop](https://posit.co/download/rstudio-desktop/) ）からRとRStudioのインストーラーをダウンロードします。
2. ダウンロードしたRのインストーラーを実行します。
3. インストーラーの指示に従ってRのインストールを進めます。
4. ダウンロードしたRStudioのインストーラーを実行します。
5. インストーラーの指示に従ってRStudioのインストールを進めます。

## Rの使い方

1. Rを起動します。
2. コンソールにコマンドを入力します。
3. 実行したいコマンドを入力してEnterキーを押します。コンソールに結果が表示されます。
4. コンソールに q() と入力してEnterキーを押すことで、Rを終了します。

## RStudioの使い方

1. RStudioを起動します。
2. 左上のコンソールにコマンドを入力します。
3. 実行したいコマンドを入力してEnterキーを押します。コンソールに結果が表示されます。
4. スクリプトエディタにコマンドを入力し、Ctrl+Enter（Windows）またはCommand+Enter（Mac）で実行することもできます。
5. 実行履歴、環境、プロットなどのタブを使って、Rの操作を補助することができます。
6. ファイルメニューからスクリプトを保存したり、プロジェクトを作成することができます。
7. Rスクリプトを実行するには、スクリプトの内容を選択した後、「Run」ボタンをクリックするか、キーボードのショートカット「Ctrl + Enter」を使用します。選択した部分だけを実行することもできます。
8. R Markdownを使って、Rコードとその実行結果を含むレポートを作成することができます。
9. RStudioを終了するには、メニューの「File」から「Quit RStudio」を選択します。

## csvファイル読み込み関数

[read.csv()](read.csv)

## グラフ描画関数

[ggplot()](ggplot)

## 画像保存

RStudioで描画したグラフを画像として保存する方法はいくつかあります。

1. エクスポートボタンを使う方法
    - RStudioの「Plots」ウィンドウで保存したいプロットを選択します。
    - 「Export」ボタンをクリックし、「Save as Image...」を選択します。
    - ダイアログボックスが表示されますので、保存するファイル名を入力し、ファイル形式を選択します。
    - 例えば、PNG、JPEG、PDF、SVGの形式を選ぶことができます。
    - ファイル形式を選択した後、必要に応じて画像のサイズを指定することができます。
    - 「Save」ボタンをクリックして、指定した場所にグラフを保存します。
2. `ggsave()`関数を使う方法
    - ggplot2で描いたグラフの場合、`ggsave()`関数を使ってグラフを保存できます。
    - 以下のように、`ggsave()`関数を呼び出し、引数としてグラフオブジェクトとファイル名を指定します。

    ```r
    library(ggplot2)
    p <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
    ggsave("myplot.png", p)
    ```

   詳細： [ggsave()](ggplot/ggsave)

これらの方法を使って、RStudioで描画したグラフを簡単に保存できます。

## サンプルコード

[samples](samples)
