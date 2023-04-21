library(ggplot2)

# データセットの作成
df <- data.frame(
  value = rnorm(100, 10, 2)
)

# ヒストグラムの作成
ggplot(data = df, aes(x = value)) + 
  geom_histogram()