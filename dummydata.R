#### Dummy dataset med diskrete og kontinuerte variabler ####
# Opsætning af variabler
cont.var <- 10 # antallet kontinuerte variabler i datasettet
mini <- 40 # minimumværdi i kontinuerte variabler
maxi <- 60 # maxværdi i kontinuerte variabler
disk.var <- 2 # antallet diskrete variabler
datalist.kont <- list() # skaber en tom listevariabel 
datalist.disk <- list() # skaber en tom listevariabel
samplesize <- 100

# Vi skaber to lister
for (i in 1:cont.var) {
  df <- data.frame(assign(paste0("var",i), sample(c(mini:maxi), samplesize, replace = TRUE))) # skaber en dataframe
  datalist.kont[i] <- df
}

for (i in 1:disk.var) {
  df <- data.frame(assign(paste0("var",i), sample(c(0,1), samplesize, replace = TRUE))) # skaber en dataframe
  datalist.disk[i] <- df
}

# Og smækker dem sammen til én dataframe, og giver dem navne (var1-var...):
df <- data.frame(bind_cols(datalist.disk, datalist.kont)) # samler det hele i en dataframe df
colnames(df) <- paste("var",1:(cont.var+disk.var))

# Oprydning i work space
rm(list = ls(pattern = "var"), datalist.kont, datalist.disk, i, maxi, mini, navne, samplesize) # fjerner var-fra global environment
gc()
