# Useful packages to read into R. Will check if they are installed, and if not, they are installed.

pakker <- c("tidyverse", "Hmisc", "survival", "cowplot", "forcats", "GGally", "ggExtra", "foreign", "Rmisc", "validate", "Publish", "colortools", "epiR")
lapply(pakker, require, character.only = T)

new.packages <- pakker[!(pakker %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
