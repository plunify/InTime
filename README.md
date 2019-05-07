# Run InTime in Tcl Mode
This repository contains scripts used to run InTime in the tcl console or command line. Currently the scripts here caters for Vivado both project and non-project mode. Non-project mode flow is only supported via a DCP.

## Requirements
1. Latest version of InTime installed.
2. Vivado version and license are properly registered in InTime. Please refer to this [page](https://docs.plunify.com/intime/configuration.html)

## Steps
1. Download the scripts in the repo. There are 2 main scripts. 
The `intimeflow.tcl` is an optimization Tcl script for InTime. The `start_intime_vivado.tcl` is a wrapper to configure the environment before running the optimization script.

**Option A - Use Vivado Tcl Console**
![alt text](https://github.com/plunify/InTime/blob/master/images/VivadoTclConsole_windows.png "Vivado Tcl Console - Windows")
1. Open the Tcl Console and source this script - `start_intime_vivado.tcl`
2. This script runs the InTime executable and passes in a custom InTime optimization script called `intimeflow.tcl`

**Option B - Run with a shell**
