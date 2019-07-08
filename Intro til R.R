#Intro til R og RStudio

#Pakker at downloade:

install.packages(c("tidyverse", "read.xl"))

#Indlæs pakker:
x <- c("tidyverse", "read.xl")
lapply(x, require, character.only = TRUE)
rm(x)

#Test-dataset: mpg og mtcars:
mpg <- mpg
mtcars <- mtcars

#-----------------------------------Dplyr-----------------------------------
#Maniupulere data:

#mutate:

mpg %>% 
  mutate(kmcity = cty * 4.54609)

#mutate fungerer også med funktioner, fx. når man laver om mpg i city til km i city:
city_mpg <- mpg %>% 
  mutate(kmcity = cty * 4.54609)

#select - selects one / a number of specific columns:

city_mpg <- mpg %>% 
  mutate(kmcity = cty * 4.54609) %>% 
  select(manufacturer:drv, kmcity, -year)

#Can also be used to rename columns:
city_mpg <- mpg %>% 
  mutate(kmcity = cty * 4.54609) %>% 
  select(manufacturer:drv, kilometer_city = kmcity, car_model = model, -year)

#filter - filters row depending on some preconditions, eg. EF < 40%

cyl_mpg <- mpg %>% 
  mutate(kmcity = cty * 4.54609) %>% 
  select(manufacturer:drv, kmcity, -year) %>% 
  filter(cyl == 4)

#distinct - finds duplicates, and removes them duplicates

cyl_mpg_unique <- mpg %>% 
  mutate(kmcity = cty * 4.54609) %>% 
  select(manufacturer:drv, kmcity, -year) %>% 
  filter(cyl == 4) %>% 
  distinct(manufacturer, .keep_all = T)

#join - several functions, used to merge two data-frames in a specific way. For more info, type ?join



#group_by(data,..., add = FALSE) - groups data in groups, depending on categorical data. 
#Used together with summarise-function
by_cyl <- mtcars %>% 
  group_by(cyl)

by_cyl

as.tibble(mtcars)

by_cyl %>% 
  summarise(disp = mean(disp),hp = mean(hp))

mtcars %>% 
  summarise(disp = mean(disp),hp = mean(hp))

#-----------------------------------ggplot2-----------------------------------
#Visualisering af data:
ggplot(mpg) +
  geom_point(aes(x = class, y = hwy))

#Put some color on the graph, depending on some categorical data, in this case, depending on drive train:
ggplot(mpg) +
  geom_point(aes(x = class, y = hwy, color = drv))

#Put some labels on:
ggplot(mpg) +
  geom_point(aes(x = class, y = hwy, color = drv)) +
  labs(
    x = "Car class",
    y = "Miles per gallon on highway",
    title = "Point plot of the different kinds of car classes' fuel useage on highway",
    subtitle = "Coloring based on drive"
  )

#Hard to see the different categories? Flip the graph:
ggplot(mpg) +
  geom_point(aes(x = class, y = hwy, color = drv)) +
  labs(
    x = "Car class",
    y = "Miles per gallon on highway",
    title = "Point plot of the different kinds of car classes' fuel useage on highway",
    subtitle = "Coloring based on drive"
  ) +
  coord_flip()

#Ugly theme? Change it.
ggplot(mpg) +
  geom_point(aes(x = class, y = hwy, color = drv)) +
  labs(
    x = "Car class",
    y = "Miles per gallon on highway",
    title = "Plot of the different kinds of car classes' fuel useage on highway",
    subtitle = "Coloring based on drive",
    caption = "Based on data from mpg dataset",
    tag = "Figure 1"
  ) +
  coord_flip() +
  theme_minimal()

#facetting - facetterer resultater ud fra katergoriske data
ggplot(mpg) +
  geom_point(aes(x = class, y = hwy, color = drv)) +
  facet_wrap(. ~manufacturer)


#-----------------------------------tidyr-----------------------------------
#Lav om et dataset til tidy data, chose audi as an example:

audi <- mpg %>%
  filter(manufacturer == "audi")

#Spread - spread out a categorical variable/column into several columns, 
#corresponding to the number of different variables in the chosen column:
audi_spread <- spread(audi, key = model, value = cyl)


#Gather - gather up some variables into one new variable:
audi_gather <- audi_spread %>% 

  select(manufacturer:'a6 quattro', a4q ='a4 quattro', a6q = 'a6 quattro') %>% 
  gather(key = model, value = "cyl", a4, a4q, a6q, na.rm = T)


#Setting up a git-version control project
# 1. Go to Github and create an account: 
browseURL("https://github.com/join?source=login")

# 2. Create a new project, name it and create a Readme-file, for easier setup
browseURL("https://github.com/new")

# 3. Go to "Clone or download"-tab, and copy the URL.

# 4. Go to RStudio, "Project"-tab, and create a new project, choose "Version control" and GIT repository.

# 5. 


b <- ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy, color = cyl)) +
  labs(
    title = "Forslag på alternativ graf, som er lidt pænere",
    y = "Med bedre kontrol over både y-aksen",
    x = "Og x-aksen",
    subtitle = "Dog med lidt mere krævende programmering",
    caption = "Data taget ud fra luften",
    tag = "Figur af Filip"
  ) +
  theme_bw()
