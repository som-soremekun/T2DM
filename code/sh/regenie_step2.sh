#!/bin/bash

#==================================================================
# File:        regenie_step2
# Author:      CS
# Date:        16 June 2022
# Description: GWASs of T2D
#==================================================================

#SBATCH --account=ckd
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=10000
#SBATCH --output=/projects1/umic/users/c/ch/chisom/t2d/logs/step2_reg.o
#SBATCH --error=/projects1/umic/users/c/ch/chisom/t2d/logs/step2_reg.e

module load regenie

DIR="/mnt/users/c/ch/chisom/t2d"
CHR="/mnt/users/c/ch/chisom/t2d/bgen$1"
BGEN_FOR_GWAS="/mnt/users/c/ch/chisom/t2d/bgen"
PHENOTYPE_FILE="/mnt/users/c/ch/chisom/t2d/t2d_pheno_ugr.txt"
COVARIATE_FILE="/mnt/users/c/ch/chisom/t2d/t2d_pheno_ugr.txt"
REGENIE_OUT_STEP1="/mnt/users/c/ch/chisom/t2d/step1"
REGENIE_OUT_STEP2="/mnt/users/c/ch/chisom/t2d/step2"

cd $DIR

 ./regenie \
  --step 2 \
  --bgen ${BGEN_FOR_GWAS} \
  --chr ${CHR} \
  --phenoFile ${PHENOTYPE_FILE} \
  --phenoCol t2d \
  --covarFile ${COVARIATE_FILE} \
  --covarCol age,age2,sex,bmi,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
  --pred ${REGENIE_OUT_STEP1}_step1output_pred.list \
  --bsize 200 \
  --minINFO 0.3 \
  --bt \
  --strict \
  --gz \
  --threads 4 \
  --loocv \
  --out ${REGENIE_OUT_STEP2}_step2output
