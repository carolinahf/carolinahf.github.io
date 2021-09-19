#install.packages("datasets")
library(datasets)

USArrests

dat<-USArrests

head(dat)

names(dat)

#[1] "Murder"   "Assault"  "UrbanPop" "Rape"    

# This is my answer, when we put it into Rmarkdown we don't need the hashtag. 
# The four variables contained in this dataset are Murder, Assault, UrbanPop and Rape. 


dat$state <- tolower(rownames(USArrests))

USArrests

names(dat)

# Problem 3: Murder is a categorical variable, according to the DVB chapter.
# It is a BLANK R variable.

# Problem 4: In this dataset we have the number of arrests per 100,000 residents for each of the following categories: assault, murder and rape in each of the 50 US states in 1973.

summary(dat)


hist(dat$Murder, main="Histogram of Murder", xlab="states", ylab="arrests per 100,000")

counts <- table(dat$Murder)
barplot(counts, col=c("red"), legend=TRUE)

state.names = row.names(USArrests)
barplot(USArrests$Murder, names.arg = state.names, las = 2, ylab = "Arrest Rate for murder per 100,000", main = "Murder Rate in the United States in 1973")

?las

# Problem 6: Summarize Murder quantitatively. 
# Min: 0.800, 1st Q: 4.075, Median 7.250, Mean 7.788, 3rd Q 11.250, Max 17.400


summary(dat$Murder)

#Problem 7: 


state.names = row.names(USArrests)
barplot(USArrests$Assault, names.arg = state.names, las = 2, ylab = "Arrest Rate for assault per 100,000", main = "Assault Rate in the United States in 1973")


state.names = row.names(USArrests)
barplot(USArrests$Rape, names.arg = state.names, las = 2, ylab = "Arrest Rate for rape per 100,000", main = "Rape Rate in the United States in 1973")

test <- cbind(USArrests$Murder, names.arg = state.names, las = 2, ylab = "Arrest Rate for murder per 100,000", main = "Murder Rate in the United States in 1973",USArrests$Assault, names.arg = state.names, las = 2, ylab = "Arrest Rate for assault per 100,000", main = "Assault Rate in the United States in 1973",USArrests$Rape, names.arg = state.names, las = 2, ylab = "Arrest Rate for rape per 100,000", main = "Rape Rate in the United States in 1973")
barplot(test,beside=T)

par(mfrow=c(3,1))

?par
# *Answer*: par can be used to set or query graphical parameters. Parameters can be set by specifying them as arguments to par in tag = value form, or by passing them as a list of tagged values.


