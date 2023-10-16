# flowCore

R言語を使用してFlow Cytometry Standard (FCS) ファイルを読み込むための基本的なスクリプトを提供します。FCSデータを読み込むためには、`flowCore` パッケージを使用します。まず、R言語の環境に `flowCore` パッケージをインストールし、読み込んでからFCSファイルを読み込むスクリプトを以下に示します。

0. `flowCore` パッケージをインストールします（一度だけ必要です）。

    ``` R
    install.packages("flowCore")
    ```

1. パッケージをロードします。

    ``` R
    library(flowCore)
    ```

2. FCSファイルを読み込みます。 "your_file.fcs" をFCSファイルのパスに書き換えてください。

    ``` R
    fcs_file <- read.FCS("your_file.fcs")
    ```

3. データの詳細を確認できます。たとえば、ヘッダ情報を表示するには次のようにします。

    ``` R
    head(fcs_file@description)
    ```

4. データを抽出して使用できます。たとえば、FCSファイル内のパラメータをリストアップするには次のようにします。

    ``` R
    parameters(fcs_file)
    ```

これで、FCSファイルを読み込んでデータにアクセスする準備が整いました。必要に応じて、データを解析し、CSVファイルとしてエクスポートするなど、さまざまな操作を実行できます。
