#PBS -l walltime=12:00:00
#PBS -l select=1:ncpus=9:mem=1200gb

module load anaconda3/personal

cd /rds/general/user/syl416/home/MScProject

Rscript 1_merge_tiles_2017_18.R