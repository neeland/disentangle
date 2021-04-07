#!/bin/bash
#SBATCH --job-name=50
#SBATCH --output=/home-mscluster/npather/disentanglement/50.%A_%a.txt
#SBATCH --partition=stampede
#SBATCH --array=0-2
python3 main.py \
--aicrowd_challenge=false \
--name=50 \
--alg=BetaVAE \
--traverse_z=true \
--traverse_c=true \
--dset_dir=/home-mscluster/npather/disentanglement-pytorch/data/dsprites \
--dset_name=dsprites_full \
--encoder=PadlessGaussianConv64 \
--decoder=SimpleConv64 \
--discriminator=SimpleDiscriminator \
--z_dim=20 \
--use_wandb=true \
--w_kld=9.0 \
--w_tc=1.0 \
--lr_G=0.001 \
--lr_scheduler=ReduceLROnPlateau \
--lr_scheduler_args mode=min factor=0.95 patience=1 min_lr=0.00005 \
--max_iter=90000 \
--iterations_c=45000 \
--evaluate_iter=1000 \
--evaluation_metric mig sap_score irs dci beta_vae_sklearn factor_vae_metric \
--alg=BetaVAE \
--loss_terms \
--use_bandit=false \
--controlled_capacity_increase=true \
--wandb_project_name=anneal \
--max_c=25 \



