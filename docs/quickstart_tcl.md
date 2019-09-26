Quick Start for InTime in Tcl Mode
====================================

## Start InTime 
Using a command line shell, a typical way to start InTime is as such below

```bash
intime.sh -mode batch -project <proj> -s intimeflow.tcl
```

!!! Note "For Vivado users "
    * For project-mode, use a XPR file for the ```<proj>``` option.
    * For non-project mode-, use the a tcl build script for the ```<proj>``` option.

--- 
## Configure the InTime license and FPGA tool 

Do not proceed if you haven't done that. Please refer to [configuration](configuration_basic.md).

--- 

## Writing the Tcl script

This is a sample script which works in Windows & Linux environments. You can download it from Plunify's [github](https://github.com/plunify/InTime-Vivado/tree/master/scripts/intime) account.

```tcl
# Adjust the run_target, runs_per_round according to your recipe
flow reset
flow set run_target local
flow set runs_per_round 2
flow set rounds 1
flow set concurrent_runs 1
flow set control_create_bitstreams false
flow run_recipe "hot_start"
```

!!! tip
    Plunify recommends starting with the *Hotstart* recipe at the beginning for Vivado, and *Default* recipe for Quartus and ISE.


### Understanding the script
1. Reset the flow. This prevents an earlier job settings from affecting this new job.
2. Set the *run_target* to *local*. This will run locally in the machine instead of being distributed to other InTime capable machines
3. Set the number of runs (builds) per round to 2 
4. Set the rounds to 1
5. Do not create bitstream
6. Start the "hot_start" recipe

For more information about flow properties such as *run_target*, please refer to [Flow Properties](flow_properties.md).