library(ggplot2)
library(scales)

celldens <- read.csv("ggplot\\geom_line\\celldensity.csv")
celldens1 <- celldens[-1,-1] # 1行目，1列目を削除する
#celldens1 <- t(celldens1) # データの行と列を入れ替える場合に使う

# データの準備
df <- NULL
for (i in 1:50) {
  t=(celldens[2:1001, 1]-1)/10 #seq(1, 100, length=1000)#
  y=celldens1[1:1000, i]
  df <- rbind(df, data.frame(t=t, y=y, s=rep(paste0("n=",i), 100)))
}

# 対数グラフの作成
ggplot(df, aes(x=t, y=y, group=s)) +
  geom_line(colour = "black", alpha = 0.1, size=1) + #線の色と透明度
  annotation_logticks(sides = "l", size = 0.5) + #対数表示は縦軸，左側のみ軸表示，線の太さ
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x, n=5),
                labels = trans_format("log10", scales::math_format(10^.x)),
                limits = c(1e1, 1e5), expand = c(0, 0), oob = scales::oob_keep) +
  scale_x_continuous(limits = c(0, 100), expand = c(0, 0), oob = scales::oob_keep) +
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
  labs(x = "Culture time (h)", y = expression(paste("Cell density (", {"cells/cm"^2}, ")", sep="")))
