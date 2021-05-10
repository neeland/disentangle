#!/bin/bash
#SBATCH --job-name=100b9.sap.celeba
#SBATCH --output=/home-mscluster/npather/disentangle/logs/100b9.sap.celeba.%A_%a.txt
#SBATCH --partition=batch
#SBATCH --array=0
python3 main.py \
--aicrowd_challenge=false \
--name=100b9.sap.celeba \
--alg=BetaVAE \
--traverse_z=true \
--traverse_c=true \
--dset_dir=/home-mscluster/npather/disentanglement-pytorch/data/celeba/ \
--dset_name=celebA \
--encoder=PadlessGaussianConv64 \
--decoder=SimpleConv64 \
--discriminator=SimpleDiscriminator \
--z_dim=20 \
--use_wandb=true \
--w_kld=9.0 \
--w_tc=0.0 \
--lr_G=0.001 \
--lr_scheduler=ReduceLROnPlateau \
--lr_scheduler_args mode=min factor=0.95 patience=1 min_lr=0.00005 \
--max_iter=200000 \
--iterations_c=200000 \
--evaluate_iter=10000 \
--recon_iter=10000 \
--traverse_iter=10000 \
--print_iter=10000 \
--evaluation_metric sap_score \
--alg=BetaVAE \
--loss_terms \
--use_bandit=false \
--controlled_capacity_increase=false \
--loss_txt=false \
--wandb_project_name=celeba \
--jeffreys=false \
--w_jeff=-1.0 \

