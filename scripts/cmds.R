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

