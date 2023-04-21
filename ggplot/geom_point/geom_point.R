library(ggplot2)

# データセットの作成
df <- data.frame(
  x = rnorm(100, 10, 2),
  y = rnorm(100, 5, 1)
)

# 散布図の作成
ggplot(data = df, aes(x = x, y = y)) + 
  geom_point()