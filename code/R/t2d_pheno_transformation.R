library(data.table)
library(tidyverse)

pheno <- read_csv("Hb1c.csv")

summary(pheno$hba1c2)

#pheno %>%
#	ggplot(aes(x=hba1c2)) + 
#	geom_histogram() +
#	geom_vline(aes(xintercept=6.5),
#           color="blue")


pheno <- pheno %>%
	mutate(t2d = case_when(
		hba1c2 < 6.5 ~ 0,
		hba1c2 >= 6.5 ~ 1
		),
		sex = 
	)


pheno %>%
	write.table("t2d_pheno_test",
		col.names=T,
		row.names=F,
		quote=F,
		sep="\t")
