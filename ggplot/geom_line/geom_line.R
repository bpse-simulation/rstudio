library(ggplot2)

# データセットの作成
df <- data.frame(
  x = 1:10,
  y = c(5, 3, 6, 9, 8, 5, 7, 2, 4, 6)
)

# 折れ線グラフの作成
ggplot(data = df, aes(x = x, y = y)) + 
  geom_line()