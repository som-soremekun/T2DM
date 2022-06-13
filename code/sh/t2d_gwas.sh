



#STEP 1 – this is run at the whole genome level 
./regenie \ 
	--step 1 \ # specify step for the regenie run
	--bed GENETIC_DATA_FILE \ #plink bed, bim, and bam file 
	--phenoFile PHENOTYPE_FILE \ #the phenotype file
	--covarFile COVARIATE_FILE \ #the covariate files
	--covarColList CONT_COVARIATE_NAMES \ #Comma separated list of covariates to include in the analysis 
	--bsize 1000 \    #size of the genotype blocks 
	--bt \ #specify that traits are binary with 0=control,1=case,NA=missing
	--lowmem 
	--strict #flag to removing samples with missing data at any of the phenotypes 
	--gz #flag to output files in compressed gzip format 
 	--loocv \ #flag to use leave-one out cross validation 
	--threads NUM_THREADS \ #number of computational threads to use [default=all-1]
	--out REGENIE_OUT_STEP1 
 
#Step 1 will output REGENIE_OUT_STEP1.log, REGENIE_OUT_STEP1_pred.list and files REGENIE_OUT_STEP1_{1}.loco. These files are needed for step 2 of REGENIE. 
 
#STEP 2 - this is run per chromosome 
 
./regenie \ 
	--step 2 \ 
	--bgen BGEN_FOR_GWAS \ 
	--chr CHR \ 
	--phenoFile PHENOTYPE_FILE \ 
	--covarFile COVARIATE_FILE \ 
	--covarColList COVARIATE_NAMES \ 
	--spa \  #specify to use Saddlepoint approximation as fallback for p-values less than threshold
	--pred REGENIE_OUT_STEP1_pred.list \  #File containing predictions from Step 1
	--bsize 1000 \ 
	--bt \
	--strict 
	--gz  
	--write-samples  #flag to write sample IDs for those kept in the analysis for each trait in step 2 
	--threads 
	--loocv \ 
	--out REGENIE_OUT_STEP2 

