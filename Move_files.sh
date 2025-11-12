#!/bin/bash
#SBATCH -n 1                                # Number of tasks
#SBATCH -c 1                                # Number of cores
#SBATCH -t 0-12:00                          # Runtime in D-HH:MM format
#SBATCH -p priority                         # Partition to run in
#SBATCH --mem=8G                            # Memory total in MiB (more than enough for mv)
#SBATCH --mail-user=smistri@bwh.harvard.edu # Email address
#SBATCH --mail-type=ALL                     # NONE, BEGIN, END, FAIL, ALL
#SBATCH -o mv_%j.out                        # STDOUT log file
#SBATCH -e mv_%j.err                        # STDERR log file

echo "Move job started at: $(date)"
echo "Moving folder from /n/groups/weiner/Somen/Raw_Data/Rafa_Rezende to /n/scratch/users/s/som906/Raw_Data"

mv /n/groups/weiner/Somen/Raw_Data/Rafa_Rezende /n/scratch/users/s/som906/Raw_Data_backup

echo "Move job finished at: $(date)"