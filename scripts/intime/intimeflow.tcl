# Sample script for InTime Optimization
# Supports Windows & Linux environments

flow reset
flow load_recipe "hot_start"
# Compile on the same machine (local) / grid (private_cloud) / AWS (plunify_cloud)
flow set run_target local
# Number of strategies to generate
flow set runs_per_round 2
# Number of compilations to run in parallel
flow set concurrent_runs 1
flow set control_create_bitstreams false
flow run_recipe "hot_start"
