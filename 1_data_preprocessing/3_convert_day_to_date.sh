#PBS -l walltime=12:00:00
#PBS -l select=1:ncpus=9:mem=1200gb

module load anaconda3/personal

cd /rds/general/user/syl416/home/MSc_project/1_data_preprocessing

Rscript 3_convert_day_to_date.R
