
#########################################################################################
#
# 	Installs Vivado toolchains
#
#########################################################################################

# Add the Xilinx toolchains to InTime
set yourvendor "xilinx"
set yourtoolchain "vivado"

#########################################################################################
#
# Specify your toolchain installation path, e.g. /mnt/Xilinx/Vivado/2018.2 or C:/2018.2
# Specify till the point find the settings64.sh or settings64.bat
#
# If license is left blank, InTime will refer to the LM_LICENSE_FILE environment variable. 
# If that variable is not configured, please specify the exact path and filename 
# of the license file.
#
# E.g. 2100@mylicserver (for floating server) or /mnt/license.lic (for a license file)
#
##########################################################################################
set yourtoolchainpath(0) "/mnt/Xilinx/Vivado/2018.2"
set yourtoolchainlicense(0) ""

#
# If you have multiple toolchains, use an array 
#
# set yourtoolchainpath(1) "/mnt/Xilinx/Vivado/2017.4"
# set yourtoolchainlicense(1) ""

# set yourtoolchainpath(2) ""
# set yourtoolchainlicense(2) ""

# This part will register the toolchain
for { set index 0 }  { $index < [array size yourtoolchainpath] }  { incr index } {
	vendors register $yourvendor $yourtoolchain $yourtoolchainpath($index) $yourtoolchainlicense($index)
}

# Shows a list of toolchains registered successfully
puts "This is a list of your installed toolchains."
vendors list