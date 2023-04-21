library(ggplot2)

# データセットの作成
df <- data.frame(
  group = rep(c("A", "B"), each = 50),
  value = c(rnorm(50, 10, 2), rnorm(50, 15, 2))
)

# 箱ひげ図の作成
ggplot(data = df, aes(x = group, y = value)) + 
  geom_boxplot()