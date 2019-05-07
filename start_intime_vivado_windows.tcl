#################################################################################
#
#	Tcl script to run InTime in Vivado Project Mode (for Windows)
#
#################################################################################

# Configuration
set yourintimetoolpath "C:/Program Files/Plunify/InTime/v2.6.11/bin/intime.exe"
set yourproject "C:/Users/youraccount/plunify/examples/vivado/eight_bit_uc_xpr/eight_bit_uc.xpr"

# This assumes you have registered your toolchain in InTime. If you have not done so, refer to https://docs.plunify.com/intime/configuration.html
set yourtool "vivado"
set yourtoolchain "2018.2.0"

# This is the script InTime will run. 
# To understand more about the commands, refer to the documentation under Flow Properties - https://docs.plunify.com/intime/flow_properties.html
# Download a sample from https://github.com/plunify/InTime
set yourintimescript "C:/yourproject/intimeflow.tcl"

#Do not change. This executes InTime 
puts "Command Executed: \"$yourintimetoolpath\" -mode batch -platform minimal \
			-project ${yourproject} \
			-vendor_toolchain ${yourtool} \
			-vendor_toolchain_version ${yourtoolchain} \
			-s ${yourintimescript}"

eval exec "\"$yourintimetoolpath\" -mode batch -platform minimal \
			-project ${yourproject} \
			-vendor_toolchain ${yourtool} \
			-vendor_toolchain_version ${yourtoolchain} \
			-s ${yourintimescript}" >@ stdout

