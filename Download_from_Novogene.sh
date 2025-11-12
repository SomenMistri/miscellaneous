#!/bin/bash
#SBATCH -n 1                                  # Number of tasks
#SBATCH -c 4                                  # Use 4 cores; sufficient for lftp/md5sum
#SBATCH -t 0-12:00                            # Runtime in D-HH:MM format (increased for download)
#SBATCH -p priority                           # Partition
#SBATCH --mem=16G                             # 16 GB is more than enough for lftp/md5sum
#SBATCH --mail-user=smistri@bwh.harvard.edu   # Email notifications
#SBATCH --mail-type=ALL                       # Send email at BEGIN, END, FAIL
#SBATCH -o novogene_download_md5_%j.out       # STDOUT log file
#SBATCH -e novogene_download_md5_%j.err       # STDERR log file

# Activate the Conda environment
echo "Activating Conda environment: download_env"
source /n/groups/weiner/Somen/tools/miniconda3/etc/profile.d/conda.sh  # Initialize Conda
conda activate /n/groups/weiner/Somen/tools/miniconda3/envs/download_env

# Navigate to the target directory (USER: Update this path as needed)
cd /n/groups/weiner/Somen/Raw_Data/Federico_Montini/2025-06-2025_10X_scRNAseq_Federico

# Download data from Novogene using lftp
echo "Starting download from Novogene..."
lftp -c 'set sftp:auto-confirm yes; set net:max-retries 20; open sftp://X202SC25072393-Z01-F001:9ycp5fyr@usftp22.novogene.com; mirror --verbose --use-pget-n=8 -c'

# Run md5sum recursively on all .fastq.gz files in 01.RawData and save output
echo "Starting md5sum for all .fastq.gz files in 01.RawData..."
find 01.RawData -type f -name "*.fastq.gz" -print0 | xargs -0 md5sum > md5_fastq_checksums.txt
echo "MD5 checksums written to md5_fastq_checksums.txt"