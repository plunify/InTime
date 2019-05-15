# Configure FPGA toolchains in InTime with Tcl

You can either use the Vivado Tcl Console or the command-line terminal / Command Prompt to do this. 

## Steps
1. Download the 2 scripts `configure_tools.tcl` and `intime_install_FPGA_tools.tcl`
2. Edit the `intime_install_FPGA_tools.tcl`to specify the installation path to the FPGA toolchains and their respective licenses. Multiple toolchains can be configured at the same time.

### For Vivado Tcl Console
1. Edit the `configure_tools.tcl` and specify the InTime installation path in the **yourintimetoolpath** variable.
2. Open the Vivado Tcl Console and enter `source configure_tools.tcl`
3. When it completes successfully, you should see a list of currently installed tools. (See below) 

![alt text](https://github.com/plunify/InTime/blob/master/images/Vivado_tcl_console_tool_list.png)

### For command-line terminal or Command Prompt
1. Edit the `configure_tools.tcl` and specify the InTime installation path in the **yourintimetoolpath** variable.

In Windows, 

`"C:/Program Files/Plunify/InTime/v2.6.11/bin/intime.exe" -mode batch -platform minimal -s intime_install_FPGA_tools.tcl`

In Linux,

change the above command to execute intime.sh instead. The output should be the same as when executing in the Vivado Tcl Console.

For more information, please refer to InTime [documentation](https://docs.plunify.com/intime/configuration.html)
