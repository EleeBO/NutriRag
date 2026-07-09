#!/bin/bash

#SBATCH --job-name=NutriRag
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err
#SBATCH --time=10-00:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=50G
#SBATCH --partition=nodes
#SBATCH --gres=gpu:a100:2
#SBATCH --chdir=/cluster/raid/home/vacy/NutriRag

# Initialize the shell to use local conda
eval "$(conda shell.bash hook)"

# Activate (local) env
conda activate NutriRag

../frp_server/frp_0.54.0_linux_amd64/frpc -c ../frp_server/frpc/frpc_nutriRag.toml &
python3 -u chatRag_user_free.py

conda deactivate
