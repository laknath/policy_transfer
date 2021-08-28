ENV_NAME=DartWalker2dPT-v1
# 0-6: mass, 7-12: damping, 13: friction, 14: cor, 15: power, 16: ankle power, 17: frame_skip_range, 18: up_noise_range
mpirun --map-by socket:OVERSUBSCRIBE -np 6 python policy_transfer/ppo/run_ppo.py --env $ENV_NAME \
					--batch_size 10000 --max_step 20000000 --train_up True --seed 42 \
					--dyn_params 6 --dyn_params 13 --name walker2d

#python policy_transfer/uposi/train_osi.py --env DartHopperPT-v1 \
#                                          --policy_path 'data/ppo_'$ENV_NAME'0__UP/policy_params.pkl' \
#                                         --dyn_params 0 \
#                                         --dyn_params 5 --action_noise 0.05 --OSI_hist 10

