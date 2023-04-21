library(ggplot2)

# データセットの作成
df <- data.frame(
  x = rep(1:5, each = 5),
  y = rep(1:5, times = 5),
  z = rnorm(25, 0, 1)
)

# ヒートマップの作成
ggplot(data = df, aes(x = x, y = y, fill = z)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "red")