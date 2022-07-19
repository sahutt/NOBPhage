## vector for calling sample outputs
np_list = c('SG_01_11_2017_np.npo','SG_05_27_2016_np.npo','SG_07_05_2017_np.npo')

Nonpareil.set(np_list, plot.opts = list(main=NA), cex = 0.5 )

## generate Nonpareil summary
summary(Nonpareil.curve.batch(np_list, plot = F))

## compute summary stats: mean, med, sd, se
mean(summary(Nonpareil.curve.batch(np_list, plot = F))[,2])
median(summary(Nonpareil.curve.batch(np_list, plot = F))[,2])
sd(summary(Nonpareil.curve.batch(np_list, plot = F))[,2])
sd(summary(Nonpareil.curve.batch(np_list, plot = F))[,2])/sqrt(32)
