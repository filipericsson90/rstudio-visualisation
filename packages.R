# Source code and setup
## Indlæser pakker, og dem der mangler bliver installeret:

pakker <- c("tidyverse", "Hmisc", "survival", "cowplot", 
            "forcats", "GGally", "ggExtra", "foreign", 
            "Rmisc", "validate", "Publish", "colortools", "esquisse", "survminer", "blandr", "extrafonts)

new.packages <- pakker[!(pakker %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

# Indlæs pakker:
lapply(pakker, require, character.only = T)

rm(new.packages, pakker)
