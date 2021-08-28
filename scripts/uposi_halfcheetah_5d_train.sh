ENV_NAME=DartHalfCheetahPT-v1
# 0-7 - mass, 8-13 - damping, 14-19 - stiffness, 20 - friction, 21 - cor, 22 - gact_scale, 23 - tilt_z,gravity
mpirun --map-by socket:OVERSUBSCRIBE -np 6 python policy_transfer/ppo/run_ppo.py --env $ENV_NAME \
					--batch_size 10000 --max_step 20000000 --train_up True --seed 42 \
					--dyn_params 0 --dyn_params 1 --dyn_params 2 --dyn_params 20 --dyn_params 21 \
					--name halfcheetah5d

#python policy_transfer/uposi/train_osi.py --env DartHopperPT-v1 \
#                                          --policy_path 'data/ppo_'$ENV_NAME'0__UP/policy_params.pkl' \
#                                         --dyn_params 0 \
#                                         --dyn_params 5 --action_noise 0.05 --OSI_hist 10

