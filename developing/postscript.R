
# postscriptの開始
postscript("output.eps", horizontal = FALSE, fonts = "Helvetica", width = 7, height = 7, paper = "special")

# グラフの描画
plot(g)

# postscriptの終了
dev.off()
