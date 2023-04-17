library(ggplot2)
library(scales)

# データの準備
df <- read.csv("ggplot\\geom_point\\data.csv")

x <- df$t
y <- df$mean
fm <- nls(y ~ a * exp(b * x), start = list(a = 2000, b = 0.01))
plot(x, df$mean)
lines(x,fitted(fm))

# 対数グラフの作成
g <- ggplot(df, aes(x=t, y=mean)) +
  geom_point(colour = "black", shape = 1, alpha = 1, size = 10, stroke=1.5) + #線の色と透明度
  annotation_logticks(sides = "l", size = 0.5) + #対数表示は縦軸，左側のみ軸表示，線の太さ
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x, n=2),
                labels = trans_format("log10", math_format(10^.x)),
                limits = c(1e3, 1e5), expand = c(0, 0), oob = oob_keep) +
  scale_x_continuous(limits = c(0, 100), expand = c(0, 0), oob = oob_keep) +
  geom_errorbar(aes(ymax = mean + sd, ymin = mean - sd), # geom_errorbarでエラーバー追加
    width = 3,  # 横棒の長さ
    size = 1) + # 線の太さ
  theme(axis.ticks.length = unit(-3, "mm"), #目盛りの長さ
        axis.ticks = element_line(size = 0.5), #目盛りの太さ
        axis.text = element_text(size = 24, colour = "black"), #目盛りの数字
        axis.text.x = element_text(margin = margin(t = 10, unit = "pt")), #x軸と値との間隔
        axis.text.y = element_text(margin = margin(r = 10, unit = "pt")), #y軸と値との間隔
        axis.title.x = element_text(margin = margin(t = 10, r = 0, b = 0, l = 0)), #x軸の名前と軸との間隔
        axis.title.y = element_text(margin = margin(t = 0, r = 10, b = 0, l = 0)), #y軸の名前と軸との間隔
        axis.title = element_text(size = 24), #軸タイトル
        panel.grid.major = element_blank(), #グリッドは入れない
        panel.grid.minor = element_blank(), #グリッドは入れない
        plot.margin = unit(c(1, 1, 0.5, 0.5), "cm"), #グラフ全体の余白 t, r, b, l
        panel.background = element_rect(fill = "white", colour = "black", size = 1.2), #fillは枠内の色、colourは枠線の色、sizeは枠線の太さ
        legend.position = "none") + #凡例を表示しない
  labs(x = "Culture time (h)", y = expression(paste("Cell density (", {"cells/cm"^2}, ")", sep=""))) +
  geom_smooth(method="nls", formula=y~a*exp(b*x), se=FALSE, method.args = list(start = list(a = 2000, b = 0.01)))



# postscriptの開始
postscript("output.eps", horizontal = FALSE, fonts = "Helvetica", width = 7, height = 7, paper = "special")

# グラフの描画
plot(g)

# postscriptの終了
dev.off()
