#PBS -l walltime=09:00:00
#PBS -l select=1:ncpus=9:mem=500gb

module load anaconda3/personal

cd /rds/general/user/syl416/home/MScProject/Data/sample

Rscript extract_sample_2017_18.R
