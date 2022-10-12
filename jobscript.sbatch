#!/bin/bash 

#SBATCH --partition=compute
#SBATCH --job-name=HM_run 
#SBATCH --time=24:00:00
#SBATCH --mem-per-cpu=10G
#SBATCH --account=research-ceg-gse
##SBATCH -o %a_pix2pix_log.txt
##SBATCH -e %a_pix2pix_err.txt
#SBATCH -o esmda_log.txt
#SBATCH -e esmda_err.txt

#asing the current date to a variable and a random number to another variable
DATE=$(date +%Y-%m-%d)
RANDOM_NUMBER=$RANDOM


module load 2022r2

# We assume running this from the script directory

data_dir="/project/LizardLips"
job_file=".job"
zeta=0.1
##python pix2pix_train.py 
python ES-MDA_DARTS.py 
#python teste_gpu.py $data_dir $job_file $zeta
#Create SLURM command to run the jobscript array only after the previous job is finished
