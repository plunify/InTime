# Configure FPGA toolchains in InTime with Tcl

You can either use the Vivado Tcl Console or the terminal/command prompt to do this. 

## Steps
1. Download the 2 scripts `configure_tools.tcl` and `intime_install_FPGA_tools.tcl`
2. Edit the `intime_install_FPGA_tools.tcl`to specify the installation path to the toolchains and license. Multiple toolchains can be configured at the same time.

### For Vivado Tcl Console
1. Edit the `configure_tools.tcl` and specify the InTime installation path under the **yourintimetoolpath** variable.
2. Open the Vivado Tcl Console and type in `source configure_tools.tcl`
3. When it completes successfully, you should see a list of currently installed tools. (See below) 

![alt text](https://github.com/plunify/InTime/blob/master/configuration/Vivado_tcl_console_tool_list.png)


### For Terminal or Command prompt
1. Edit the `configure_tools.tcl` and specify the InTime installation path under the **yourintimetoolpath** variable.

For Windows, 

`"C:/Program Files/Plunify/InTime/v2.6.11/bin/intime.exe" -mode batch -platform minimal s intime_install_FPGA_tools.tcl`

For Linux, just change to where intime.sh is located. The output should be the same as the Vivado Tcl Console.

For more information on this, please refer to the InTime [documentation](https://docs.plunify.com/intime/configuration.html)
