
library(tidyverse)
library(ggplot2)
View(diamonds)

#visualizing distributions

#for continuous values
ggplot(data = diamonds)+
  geom_histogram(mapping = aes(x=carat),inwidth=0.02)

#categorical values
ggplot(data = diamonds)+
  geom_bar(mapping=aes(x=cut))

#overlay multiple histograms
ggplot(data = diamonds,mapping=aes(x=carat, color=cut))+
  geom_freqpoly(binwidth=0.01)

ggplot(data = diamonds, mapping =aes(x=carat, y=cut))+
  geom_boxplot()

#outliers
ggplot(diamonds)+
  geom_histogram(mapping = aes(x=y), binwidth=0.5)+
  labs(x='width')+
  coord_cartesian(ylim(0,10))

  
#price against cut
#categorical value against a continuous value
ggplot(data = diamonds,mapping=aes(x=cut, y=price))+
  geom_boxplot()+
  xlab('Quality')


#categorical value
diamonds %% 
  count(color,cut)%%
  ggplot(mapping=aes(x=color,y=cut))+
  geom_tile(mapping=aes(fill=n))


#continuous variables

ggplot(data = diamonds)+
  geom_point(mapping =aes(x=carat, y=price))