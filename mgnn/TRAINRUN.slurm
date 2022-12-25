#!/bin/bash
#SBATCH -J mlg_train # job name
#SBATCH -o mlg_train.out # standard output and error log
#SBATCH -p titanxp # queue name or partiton name 2080tti*
#SBATCH -t 24:00:00 # Run time (hh:mm:ss)
#SBATCH  --gres=gpu:2 # Number of GPUs
#SBATCH  --nodes=1
#SBATCH  --ntasks=1
#SBATCH  --tasks-per-node=1
#SBATCH  --cpus-per-task=2

# echo node name (ex: n1~n35)
srun -l /bin/hostname
# echo current directory
srun -l /bin/pwd
# echo current time
srun -l /bin/date

# Remove all Linux Modules (recommended)
module purge

# For debug purpose
pip freeze

# Check GPUs
echo $CUDA_VISIBLE_DEVICES

python tools/run.py --tasks vqa --datasets vizwiz --model s_mmgnn --config ensemble/bar/s_mmgnn.yml --resume_file ensemble/bar/s_mmgnntrained_final.pth -dev cuda:0 --run_type all_in_one