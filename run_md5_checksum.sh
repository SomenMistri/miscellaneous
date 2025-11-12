#!/bin/bash
#SBATCH -n 1                                  # Number of tasks
#SBATCH -c 4                                  # Use 4 cores; more isn't useful for md5sum
#SBATCH -t 0-04:00                            # Runtime in D-HH:MM format
#SBATCH -p priority                           # Partition
#SBATCH --mem=16G                             # 16 GB is more than enough for md5sum
#SBATCH --mail-user=smistri@bwh.harvard.edu   # Email notifications
#SBATCH --mail-type=ALL                       # Send email at BEGIN, END, FAIL
#SBATCH -o md5sum_%j.out                      # STDOUT log file
#SBATCH -e md5sum_%j.err                      # STDERR log file


# Navigate to the target directory
cd /n/groups/weiner/Somen/Raw_Data/Rafa_Rezende/X202SC25048346-Z01-F001

# Run md5sum recursively and save output
echo "Starting md5sum for all .fastq.gz files in 01.RawData..."
find 01.RawData -type f -name "*.fastq.gz" -print0 | xargs -0 md5sum > md5_fastq_checksums.txt
echo "MD5 checksums written to md5_fastq_checksums.txt"