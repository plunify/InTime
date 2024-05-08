# Tcl script for running InTime Auto Pilot to optimize timing
#
# Instructions:
# 1) Modify "run_target": "local" (use the same machine), "private_cloud" (server farm), "plunify_cloud" (Amazon Web Services)
# 2) Modify "concurrent_runs": Number of compilations to run in parallel
#
# Copyright Plunify 2024
# https://www.plunify.com

flow reset
flow restore_defaults
flow load_recipe "auto_pilot"
flow set auto_pilot_alias "timing"
flow set run_target "private_cloud"
flow set runs_per_round 20
flow set concurrent_runs 4
flow run_recipe "auto_pilot"