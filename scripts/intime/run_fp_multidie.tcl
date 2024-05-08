#############################################################################################
#
# Instructions:
# - Adjust the <concurrent_runs> value below to what your server can manage. Do not overload.
# - For <run_target>, if you are using a grid, change to "private_cloud" 
#
# General options
flow reset

flow set concurrent_runs 4
flow set runs_per_round 10

# Configure to run locally or on the grid (private_cloud)
flow set run_target local
#flow set run_target private_cloud

# Maximum number of hours for each compilation
flow set strategy_max_runtime 24

# Add new flow properties about this line
#############################################################################################

# Assignment Mode
#############################################################################################
flow set fp_type assign
# flow set fp_maxdsp_limit 8
# flow set fp_maxlut_limit 8
# flow set fp_maxramb18_limit 8
# flow set fp_maxramb36_limit 8

flow load_recipe auto_floorplan
flow run_recipe auto_floorplan

results clear
results add last_job
if { [results goal_met] } {
    puts "INFO: Goal has been met, stopping."
    return -code ok
}

# Congestion Mode
#############################################################################################
flow set fp_type congestion
#flow set fp_hier_limit 3
#flow set fp_max_utilization_percentage to 0.8

flow load_recipe auto_floorplan
flow run_recipe auto_floorplan