library(data.table)

library(tidyverse)

setwd("C:/Users/Chisom/Desktop/T2D Analysis")

View(pheno)

#read in the file using read.delim to retain tab delim
pheno <- read.delim("Hb1c.txt")

View(pheno)

#view the distribution of the file
summary(pheno$hba1c2)

#plot the distribution of hba1c
pheno %>%
  ggplot(aes(x=hba1c2)) +
  geom_histogram() +
  geom_vline(aes(xintercept=6.5),
            color="blue")


#classify hba1c2 column
pheno <- pheno %>%
   mutate(t2d = case_when(
     hba1c2 < 6.5 ~ 0,
     hba1c2 >= 6.5 ~ 1
   )
   )

#write it to a table
pheno %>%
  write.table("t2d_pheno_test",
            col.names=T,
            row.names=F,
            quote=F,
            sep="\t")

#4/7/22
#classify gender
#but this did not work. it has "object 'Male' not found" error
pheno <- pheno %>%
   mutate(sex2 = case_when(
   sex == Male ~ 1,
   sex == Female ~ 0
)
)

#this assigns numbers of 1 to sex if male, or else 0 if female
pheno$sex <- ifelse(pheno$sex=="Male",1,0)



#PART 2

#Generate summaries of the pheno data

#check the distribution of the gender
table(pheno$sex)

#check the distribution of the t2d
table(pheno$t2d)

#check the age distribution
hist(pheno$age, main ="Age",
     xlab ="age",
     xlim = c(10, 100), col ="yellow",
     freq = TRUE)

#check the bmi distribution
hist(pheno$bmi, main ="BMI",
     xlab ="bmi",
     xlim = c(10, 100), col ="green",
     freq = TRUE)

#check the weight distribution
hist(pheno$weight, main ="Weight",
     xlab ="weight",
     xlim = c(10, 100), col ="pink",
     freq = TRUE)

#check the height distribution
hist(pheno$height, main ="Height",
     xlab ="height",
     xlim = c(80, 250), col ="blue",
     freq = TRUE)






ggplot(data = pheno, aes(sex)) + geom_bar(fill = "darkblue")
+ scale_y_continuous("BMI", breaks = seq(10,100, by = 10))
+ labs(title = "BMI vs T2D")


