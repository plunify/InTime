#################################################################################
#
#	Tcl script to configure the environment for InTime 
#
#################################################################################

# InTime installation path
set yourintimetoolpath "C:/Program Files/Plunify/InTime/v2.6.11/bin/intime.exe"


#################################################################################
# This is the script InTime will run. 
# To understand more about the commands, refer to the documentation under Flow Properties
# https://docs.plunify.com/intime/flow_properties.html
#
# Download a sample from https://github.com/plunify/InTime
#################################################################################
set yourintimescript "intime_install_FPGA_tools.tcl"

#Do not change. This executes InTime 
puts "Command executed: \"$yourintimetoolpath\" -mode batch -platform minimal s ${yourintimescript}"
eval exec "\"$yourintimetoolpath\" -mode batch -platform minimal -s ${yourintimescript}" >@ stdout

