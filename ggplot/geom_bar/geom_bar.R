library(ggplot2)

# データセットの作成
df <- data.frame(
  category = c("A", "B", "C", "D"),
  count = c(20, 35, 15, 45)
)

# 棒グラフの作成
ggplot(data = df, aes(x = category, y = count)) + 
  geom_bar(stat = "identity")