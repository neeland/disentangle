#!/bin/bash
#SBATCH --job-name=100b3.smallnorb
#SBATCH --output=/home-mscluster/npather/disentangle/100b3.smallnorb.%A_%a.txt
#SBATCH --partition=stampede
#SBATCH --array=0-3
python3 main.py \
--aicrowd_challenge=false \
--name=100b3.smallnorb \
--alg=BetaVAE \
--traverse_z=true \
--traverse_c=true \
--dset_dir=/home-mscluster/npather/disentanglement-pytorch/data/smallnorb \
--dset_name=smallnorb \
--encoder=PadlessGaussianConv64 \
--decoder=SimpleConv64 \
--discriminator=SimpleDiscriminator \
--z_dim=20 \
--use_wandb=true \
--w_kld=3.0 \
--w_tc=0.0 \
--lr_G=0.001 \
--lr_scheduler=ReduceLROnPlateau \
--lr_scheduler_args mode=min factor=0.95 patience=1 min_lr=0.00005 \
--max_iter=200000 \
--iterations_c=200000 \
--evaluate_iter=1000 \
--recon_iter=10000 \
--traverse_iter=10000 \
--print_iter=10000 \
--evaluation_metric mig sap_score irs dci beta_vae_sklearn factor_vae_metric \
--alg=BetaVAE \
--loss_terms \
--use_bandit=false \
--controlled_capacity_increase=false \
--loss_txt=false \
--wandb_project_name=smallnorb200k \
--jeffreys=false \
--w_jeff=-1.0 \
--jeff1=false \




