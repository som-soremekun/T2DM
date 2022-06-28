#!/bin/bash

#==================================================================
# File:        regenie_step1
# Author:      CS
# Date:        16 June 2022
# Description: GWASs of T2D
#==================================================================

#SBATCH --account=ckd
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1000
#SBATCH --output=/projects1/umic/users/c/ch/chisom/t2d/logs/step1_reg.o
#SBATCH --error=/projects1/umic/users/c/ch/chisom/t2d/logs/step1_reg.e

module load regenie

DIR="/mnt/users/c/ch/chisom/t2d"
GENETIC_DATA_FILE="/mnt/lustre01/projects/ckd/data/genotyped_data"
PHENOTYPE_FILE="/mnt/users/c/ch/chisom/t2d/t2d_pheno_ugr.txt"
COVARIATE_FILE="/mnt/users/c/ch/chisom/t2d/t2d_pheno_ugr.txt"
REGENIE_OUT_STEP1="/mnt/users/c/ch/chisom/t2d/step1"

cd $DIR

./regenie \
  --step 1 \
  --bed ${GENETIC_DATA_FILE} \
  --phenoFile ${PHENOTYPE_FILE} \
  --phenoCol ${PHENOTYPE_FILE}$t2d \
  --covarFile ${COVARIATE_FILE} \
  --covarCol age,age2,sex,bmi,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
  --bsize 1000 \
  --bt \
  --loocv \
  --lowmem \
  -out ${REGENIE_OUT_STEP1}    
