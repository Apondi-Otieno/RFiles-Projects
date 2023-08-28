install.packages("tidyverse")

library(tidyverse)

?tidyverse

# Graphic elements
# 1. Data
# 2. Mapping / Aesthetics
# 3. Geometry

ggplot()

#load data
ggplot(data)

# mapping / aesthetics (x/y)
ggplot(data, aes(x,y))


#geometry
ggplot(data, aes(x,y)) +
  geom_point()


# other elements
ggplot(data, aes(x=var1,y=var2)) +
  geom_point(aes(fill=var3)) +
  coord_flip() + 
  labs() +
  facet_wrap()





#mpg data set
mpg

ggplot(mpg,aes(displ,hwy)) + geom_point()


ggplot(data = mpg) +
  geom_point(mapping=aes(x=displ,y=hwy))

ggplot(data=mpg) +
  geom_smooth(mapping=aes(x=displ,y=hwy))
  

#Color
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, 
                           color = class))







