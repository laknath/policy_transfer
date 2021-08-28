ENV_NAME=DartHopperPT-v1
# 0 - friction, 1 - CoR, 2-5 - mass, 6-8: damping, 9: power, 10: ankle range, 11: velrew_weight
mpirun --map-by socket:OVERSUBSCRIBE -np 6 python policy_transfer/ppo/run_ppo.py --env $ENV_NAME \
					--batch_size 2000 --max_step 100000000 --train_up True --seed 42 \
					--dyn_params 0 --dyn_params 1 --dyn_params 2 --dyn_params 3 --dyn_params 4 \
					--name hopper5d

#python policy_transfer/uposi/train_osi.py --env DartHopperPT-v1 \
#                                          --policy_path 'data/ppo_'$ENV_NAME'0__UP/policy_params.pkl' \
#                                         --dyn_params 0 \
#                                         --dyn_params 5 --action_noise 0.05 --OSI_hist 10

