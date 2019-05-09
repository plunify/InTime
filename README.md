# Run InTime in Tcl Mode
This repository contains scripts used to run InTime in the tcl console or command line. 

Currently the scripts here caters for Vivado in both project and non-project modes. For non-project mode flow, you can only run this with a **DCP**, instead of a XPR. 

For InTime GUI, you can refer to this [video](https://www.youtube.com/watch?v=lQvY_XZ3R7w).
For more information about InTime, please click [here](https://www.plunify.com/en/intime/)

## Requirements
1. Latest version of InTime installed.
2. At least a copy of Vivado and its license properly registered in InTime. If you have not done so, please refer to this [page](https://github.com/plunify/InTime/tree/master/configuration)

## Steps
1. Download the scripts in the repo. There are 2 main scripts. 
The [`intimeflow.tcl`](intimeflow.tcl) is an optimization Tcl script for InTime. The start_intime_vivado_*.tcl is a wrapper to configure the environment before running the optimization script.

### Option A - Use Vivado Tcl Console
1. Edit the [`start_intime_vivado_windows.tcl`](start_intime_vivado_windows.tcl) or [`start_intime_vivado_linux.tcl`](start_intime_vivado_linux.tcl) script to configure the environment, e.g. project path etc. 
2. Open the Tcl Console and source the script.
![alt text](https://github.com/plunify/InTime/blob/master/images/VivadoTclConsole_windows.png "Vivado Tcl Console - Windows") 
3. This script runs the InTime executable and passes in a custom InTime optimization script called `intimeflow.tcl`

The contents of the intimeflow.tcl are below
```flow reset
flow set run_target local
flow set runs_per_round 2
flow set rounds 1
flow set concurrent_runs 1
flow set control_create_bitstreams false
flow run_recipe "hot_start"
```
The sample flow will run 1 round containing 2 builds and do 1 build at a time. To customize the flow, refer to this [page](https://docs.plunify.com/intime/flow_properties.html). 

### Option B - Run in a terminal (linux) or command prompt shell (windows)

#### For linux

You can either run it directly in the terminal or use the shell script [`start_intime_linux_shell.sh`](start_intime_linux_shell.sh). Similar to the tcl script, you will need to configure your environment in the shell script before you run it.

To run it directly, a sample command is somthing like this below
```intime.sh -mode batch -platform minimal -project yourproject.xpr -vendor_toolchain vivado -vendor_toolchain_version 2018.3.0 -s intimeflow.tcl```

#### For Windows

```"C:/intime.exe" -mode batch -platform minimal -project C:/yourproject.xpr -vendor_toolchain vivado -vendor_toolchain_version 2018.3.0 -s C:/intimeflow.tcl```

#### Description of arguments:
1. `intime.sh or intime.exe` Change this to the location of intime.sh or intime.exe in your environment.
2. `-mode batch` Tells InTime to operate in batch mode.
3. `-platform minimal` Tells InTime to operate in non-GUI mode.
4. `-project` Design to optimize – specify your XPR or DCP file.
5. `-vendor_toolchain` Specify your FPGA vendor tools 
6. `-vendor_toolchain_version` Use the specified Vivado version.
7. `-s` Runs an InTime Tcl script. Change this to point to the InTime Tcl script that you are creating.
8. `>@ stdout` Echo output to the terminal as InTime runs.

