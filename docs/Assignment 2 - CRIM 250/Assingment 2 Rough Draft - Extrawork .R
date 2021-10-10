

#Assingment 2 Rough Draft 


#Problem 5
counts <- table(dat$irsex, dat$sexatract)
barplot(counts, col=c("red", "blue"), legend=TRUE)

counts <- table(dat$irsex, dat$sexatract)
barplot(counts, col=c("red", "blue"), legend=TRUE)



#Problem 6 

tab.englsex <- table(dat$speakengl, dat$irsex)
barplot(tab.englsex,
        main = "Stacked barchart",
        xlab = "Code for Gender", ylab = "Frequency",
        legend.text = rownames(tab.englsex),
        beside = FALSE) # Stacked bars (default)

tab.sexengl <- table(dat$irsex, dat$speakengl)
barplot(tab.sexengl,
        main = "Stacked barchart",
        xlab = "Code for English Speaking", ylab = "Frequency",
        legend.text = rownames(tab.sexengl),
        beside = FALSE) # Stacked bars (default)

counts <- table(dat$irsex, dat$speakengl)
barplot(counts, col=c("red", "blue"), legend=TRUE)