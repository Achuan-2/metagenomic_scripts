#!/bin/bash
###################################################
### ==== NUMBER OF CPUS per TASK ====
#SBATCH --cpus-per-task=10
#SBATCH --mem=50G
#SBATCH -o slurm.%x.%j.out        # STDOUT
#SBATCH -e slurm.%x.%j.err        # STDERR
###########################

# local path ： /mnt/raid7/Dachuang/Achuan/scripts/virsorter2.sh
########### usage  ##########################
# conda activate achuan
# cd /mnt/raid7/Dachuang/Achuan/02_is_NCLDV/
# ls /mnt/raid7/wuyingjian/buffalo/03_assembly_megahit/{DATA_set}/ | while read id;do sbatch /mnt/raid7/Dachuang/Achuan/scripts/virsorter2.sh ${id} data14;done
##########################


conda activate achuan

ID=$1
Data=$2
Project=/mnt/raid7/Dachuang/Achuan/02_is_NCLDV/virsorter_result/${Data}


virsorter run -w ${Project}/${ID} \
    -i /mnt/raid7/wuyingjian/buffalo/03_assembly_megahit/${Data}/${ID}/final.contigs.fa \
    --include-groups NCLDV \
    --min-length 5000  \
    --min-score 0.5 \
    -j 10 all
