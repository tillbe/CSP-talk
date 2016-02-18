library(ggplot2)
library(cowplot)

theme_set(theme_cowplot(font_size=20))

x = readRDS("large_n_example.rds")

a = ggplot(x, aes(x = as.factor(1), y = hd)) + 
  geom_point(size = 1, alpha=.5, 
             position = position_jitter(width = .5)) +
  scale_x_discrete(breaks=NULL)+ 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) + 
  scale_x_discrete("") + 
  scale_y_continuous("Values")

b = ggplot(x, aes(x = hd)) + 
  geom_histogram(binwidth = 0.01) + 
  scale_x_continuous("Values")

c = ggplot(x, aes(x = as.factor(1), y = hd)) +  
  geom_violin() + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) + 
  scale_x_discrete("") + 
  scale_y_continuous("Values")

d = ggplot(x, aes(x = as.factor(1), y = hd)) +  
  stat_boxplot(geom ='errorbar', width=.25) + # adds whiskers to the lines
  geom_boxplot(width=.5) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) + 
  scale_x_discrete("") + 
  scale_y_continuous("Values")


gp = plot_grid(b, a,d,c,ncol = 2, scale = 0.95)  
save_plot("large_n_example.png", gp,
          base_height = 8,
          base_aspect_ratio = 1.5)
