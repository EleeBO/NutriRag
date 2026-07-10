#!/bin/bash

#SBATCH --job-name=benchmark
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err
#SBATCH --time=3-00:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=30G
#SBATCH --partition=nodes
#SBATCH --gres=gpu:a100:1
#SBATCH --chdir=/cluster/raid/home/vacy/NutriRag

# Initialize the shell to use local conda
eval "$(conda shell.bash hook)"

# Activate (local) env
conda activate NutriRag

python3 -u nutri_benchmark.py "$@"

conda deactivate