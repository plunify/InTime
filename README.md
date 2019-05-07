# Run InTime in Tcl Mode
This repository contains scripts used to run InTime in the tcl console or command line. Currently the scripts here caters for Vivado in both project mode. (Non-project mode will be added soon. For non-project mode flow, you can run this with a DCP.) For more information about InTime, please click [here](https://www.plunify.com/en/intime/)

## Requirements
1. Latest version of InTime installed.
2. A copy of Vivado and license are properly registered in InTime. Please refer to this [page](https://docs.plunify.com/intime/configuration.html)

## Steps
1. Download the scripts in the repo. There are 2 main scripts. 
The `intimeflow.tcl` is an optimization Tcl script for InTime. The `start_intime_vivado.tcl` is a wrapper to configure the environment before running the optimization script.

### Option A - Use Vivado Tcl Console
1. Edit the `start_intime_vivado_windows.tcl` or `start_intime_vivado_linux.tcl` script to configure the environment, e.g. project path etc. 
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

**For linux**

```/vol1/tools/intime/intime.sh -mode batch -platform minimal -project /vol2/yourproject.xpr -vendor_toolchain vivado -vendor_toolchain_version 2018.3.0 -s /vol2/intimeflow.tcl```

**For Windows**

```"C:/Program Files/Plunify/InTime/bin/intime.exe" -mode batch -platform minimal -project C:/Users/yourproject.xpr -vendor_toolchain vivado -vendor_toolchain_version 2018.3.0 -s C:/Users/intimeflow.tcl```

#### Description of arguments:
1. `/vol1/tools/intime/intime.sh` Change this to the location of intime.sh or intime.exe in your environment.
2. `-mode batch` Tells InTime to operate in batch mode.
3. `-platform minimal` Tells InTime to operate in non-GUI mode.
4. `-project` Design to optimize – specify your XPR file.
5. `-vendor_toolchain` Specify your FPGA vendor tools 
6. `-vendor_toolchain_version` Use the specified Vivado version.
7. `-s` Runs an InTime Tcl script. Change this to point to the InTime Tcl script that you are creating.
8. `>@ stdout` Echo output to the terminal as InTime runs.

