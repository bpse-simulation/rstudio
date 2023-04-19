library(ggplot2)
library(scales)

# 対数グラフの外枠の作成
g <- ggplot() +
  annotation_logticks(sides = "l", size = 0.5) + #対数表示は縦軸，左側のみ軸表示，目盛り線の太さ
  scale_y_log10(limits = c(1e3, 1.5e5), # 軸の範囲
                expand = c(0, 0), # 軸の両端の余白の設定
                breaks = trans_breaks("log10", function(x) 10^x, n=2), # 主目盛りの数
                labels = trans_format("log10", math_format(10^.x)), # ラベルの表示設定
                oob = oob_keep) + # 範囲外の値の扱い
  scale_x_continuous(limits = c(0, 135), # 軸の範囲
                     expand = c(0, 0), # 軸の両端の余白の設定
                     breaks = seq(0, 125, length=6), # 主目盛りの数
                     oob = oob_keep) + # 範囲外の値の扱い
  theme(axis.ticks.length = unit(-3, "mm"), # 目盛り線の長さ
        axis.ticks = element_line(size = 1), # 目盛り線の太さ
        axis.text = element_text(size = 24, colour = "black"), # 目盛りの数字
        axis.text.x = element_text(margin = margin(t = 10, unit = "pt")), # x軸と値との間隔
        axis.text.y = element_text(margin = margin(r = 10, unit = "pt")), # y軸と値との間隔
        axis.title.x = element_text(margin = margin(t = 10, r = 0, b = 0, l = 0)), # x軸の名前と軸との間隔
        axis.title.y = element_text(margin = margin(t = 0, r = 10, b = 0, l = 0)), # y軸の名前と軸との間隔
        axis.title = element_text(size = 24), # 軸タイトル
        panel.grid.major = element_blank(), # グリッドは入れない
        panel.grid.minor = element_blank(), # グリッドは入れない
        plot.margin = unit(c(1, 1, 0.5, 0.5), "cm"), # グラフ全体の余白 t, r, b, l
        panel.background = element_rect(fill = "white", colour = "black", size = 1.2), # fillは枠内の色、colourは枠線の色、sizeは枠線の太さ
        legend.position = "none") + # 凡例を表示しない
  labs(x = expression(paste("Culture time ", italic("t"), " (h)", sep = "")), # x軸の説明
       y = expression(paste("Cell density ", italic("X"["t"]), " (cells/cm"^2, ")", sep = ""))) # y軸の説明

# データの準備
df <- read.csv("samples\\RD training.csv")

g <- g +
  geom_point(data = df, aes(x = t, y = mean), # データフレームの指定
             shape = 21, size = 5, stroke = 1.5, # 形と大きさと線の太さ
             colour = "black", fill = "white", alpha = 1) + # 線の色と塗りつぶしの色と透明度
  geom_errorbar(data = df, aes(x = t, y = mean, ymax = mean + sd, ymin = mean - sd), # geom_errorbarでエラーバー追加
                width = 3, # 横棒の長さ
                size = 1) # 線の太さ

# 対数増殖期に合わせて調整（これは24h-72hの場合）
df1 <- df[1:3,]

# 指数回帰
x <- df1$t
y <- df1$mean
expfit <- nls(y ~ a * exp(b * x), start = list(a = 3000, b = 0.02))
# 推定値
a <- summary(expfit)$coefficients[1, 1]
b <- summary(expfit)$coefficients[2, 1]
# データの準備
y_est <- a * exp(b * x)
df1 <- cbind(df1, y_est)
# 指数回帰描画
g <- g + geom_line(data = df1, aes(x = t, y = y_est), size = 1, colour = "blue")

## 指数回帰描画（こっちだと対数軸で直線に描画されなかった）
#g <- g +
#  #geom_smooth(data = df1, aes(x = t, y = mean), method = "nls", formula = y ~ a * exp(b * x), se = FALSE, method.args = list(start = list(a = 3000, b = 0.02)))
#  stat_smooth(data = df1, aes(x = t, y = mean), method = "nls", formula = "y ~ a * exp(b * x)", se = FALSE, method.args = list(start = list(a = 3000, b = 0.02)))

# グラフの描画
plot(g)
