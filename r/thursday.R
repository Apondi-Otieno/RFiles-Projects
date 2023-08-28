library(tidyverse)

data <- road.csv('data/kenya-hospital-ke.csv')

?mpg

#1 data
#2 aesthetic/coordinates
#3 geometry

ggplot(mpg,aes(x-disp,y=hwy))+
  geom_point()

ggplot(mpg,aes(x-disp,y=hwy, color=class))+    #creates a map to represent type of car
  geom_point()

ggplot(mpg, aes(x=displ, y=hwy))+ 
  geom_point()
#color
ggplot(mpg)+
  geom_point(aes(x=displ, y=hwy), color="blue")

#shape
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,shape=class))

#alpha changes point transparency
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,alpha=class)) #you can specify alpha

#facet wrap
 #creates-------in a plot

ggplot(data=mpg)+
  geom_point(mapping=aes(x=disply=hwy))+
  facet_wrap(~model) #separates all the points in a graph


 #facet grade; allows you to compare two or more facets

ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ,y=hwy), color="blue")+
  facet_grid(drv~cyl)

ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ,y=hwy, color=cyl))+
  facet_wrap(~class)

#labels
ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ,y=hwy), color="blue")+
  facet_grid(drv~cyl)+
  labs(title="Fuel Efficiency of cars",x="Engine Displacement", y="Fuel Efficiency")

View(mpg)
