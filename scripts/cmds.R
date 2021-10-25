#### Start ####

## Starting Rstudio with folders to keep analysis tidy
dir.create("scripts")
dir.create("data")
dir.create("plots")
file.create("scripts/cmds.R")
file.edit("scripts/cmds.R")

## Import data
download.file(url = "https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv",
              destfile = "data/gapminderdata.csv")
gapminder <- read.csv("data/gapminderdata.csv")

## Filter (from dplyr package) ----
# install.package("colourpicker")
library(tidyverse)
library(RColorBrewer)
oz <- filter(gapminder, country == "Australia")

gapminder %>% 
  ggplot(aes(x = year,
             y = pop,
             colour = continent)) +
  geom_point() +
  #scale_y_log10 () + ## Change from linear to log scale
  scale_y_continuous(breaks = c(0, 100000000, 200000000, 500000000, 1000000000),
                     labels = c(0, "100 m", "200 m", "500 m", "1 b")) +
  scale_colour_manual(values = c("#FFA500", "#EE2C2C", "#1E90FF", "#00EE00", "#EEEE00")) + ## Choose by going to Addins/Colour Picker
  theme(axis.text.x = element_text(angle = 45))


## Histograms ----
gapminder %>% 
  ggplot(aes(lifeExp,
             fill = continent)) +
  geom_histogram(bins = 30,
                 position = "stack") + ## "stack" is the default parameter, "dodge" will create separate histograms
  theme(legend.position="top")


## Faceting ----
## Using the above example, rather than "dodge" to separate groups, use "facet_wrap"
gapminder %>% 
  ggplot(aes(lifeExp,
             fill = continent)) +
  geom_histogram(bins = 40,
                 position = "stack") +
  facet_wrap(~continent) +
  theme_minimal() +
  theme(legend.position = "none") +
  xlab("Life expectancy") +
  ylab("Count")
  

## Customising a scatterplot ----
gapminder %>% 
  ggplot(aes(gdpPercap,
            lifeExp)) +
  geom_point(aes(colour = continent,
                 alpha = 0.7)) +
  geom_smooth(method = "lm") +
  scale_x_log10() +
  labs(x = "GDP per capita",
       y = "Life expectancy",
       title = "How does GDP relate to life expectancy?") +
  theme_bw() +
  theme(legend.position = "top")


## Save a plot with a command ----
ggsave("plots/GDPLifeExp300.png",
       width = 20, height = 15, units = "cm",
       dpi = 300)

ggsave("plots/GDPLifeExp.png",
       width = 20, height = 15, units = "cm")


## Esquisse ----
#install.packages("esquisse")


                      