# CSVファイルを読み込む
my_data <- read.csv("data.csv")

# 読み込んだデータフレームを表示する
print(my_data)

# データフレームの列名を表示する
print(colnames(my_data))

# データフレームの1行目を表示する
print(my_data[1, ])