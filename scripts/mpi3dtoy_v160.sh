#! /bin/sh

FILENAME=$(basename $0)
FILENAME="${FILENAME%.*}"
NAME=${1:-$FILENAME}

echo "name=$NAME"

python3 main.py \
--aicrowd_challenge=true \
--name=$NAME \
--alg=BetaVAE \
--vae_loss=Basic \
--vae_type=Basic \
--traverse_z=true \
--encoder=PadlessGaussianConv64 \
--decoder=SimpleConv64 \
--discriminator=SimpleDiscriminator \
--z_dim=30 \
--use_wandb=true \
--w_kld=10.0 \
--lr_G=0.003 \
--lr_scheduler=ReduceLROnPlateau \
--lr_scheduler_args mode=min factor=0.95 patience=1 min_lr=0.00005 \
--max_iter=120000 \
--evaluate_metric mig sap_score irs factor_vae_metric \
--ckpt_load_iter=false \
--ckpt_load=./saved_models/mpi3dtoy_betatc/saved \
--ckpt_load_optim=false \


#--ckpt_load=./saved_models/mpi3dtoy_betatc/saved \

#--ckpt_load=./checkpoints/mpi3dtoy_betatc-vae/last \
#--ckpt_load_iter=false \


#--ckpt_load=checkpoints/mpi3dtoy_betatc-vae/last \

#--ckpt_load=./saved_models/mpi3dtoy_ae_gaussian/saved2 \






