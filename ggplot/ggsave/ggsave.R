library(ggplot2)

# データの準備
data <- data.frame(x = rnorm(50), y = rnorm(50))

# プロットの作成
p <- ggplot(data, aes(x, y)) + geom_point()

# PNGファイルとして保存
ggsave("myplot.png", plot = p, width = 6, height = 4, dpi = 300)