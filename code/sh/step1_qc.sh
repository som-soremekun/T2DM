#!/bin/bash

#==================================================================
# File:        step1_qc
# Author:      CS
# Date:        28 June 2022
# Description: GWASs of T2D
#==================================================================

#SBATCH --account=ckd
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1000
#SBATCH --output=/projects1/umic/users/c/ch/chisom/t2d/logs/step1qc_reg.o
#SBATCH --error=/projects1/umic/users/c/ch/chisom/t2d/logs/step1qc_reg.e

module load plink2

DIR="/mnt/users/c/ch/chisom/t2d"
GENETIC_DATA="/mnt/lustre01/projects/ckd/data/genotyped_data"

cd $DIR

plink2 \
  --bfile ${GENETIC_DATA} \
  --maf 0.01 --mac 100 --geno 0.1 --hwe 1e-15 \
  --mind 0.1 \
  --write-snplist --write-samples --no-id-header \
  --out qc_pass
   
