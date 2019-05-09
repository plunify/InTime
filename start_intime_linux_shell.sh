#!/bin/bash
export LC_ALL=en_US.UTF-8

###############################################################################################
# Configure your environment here
# You can get a sample intime script, e.g. intimeflow.tcl at https://github.com/plunify/InTime
###############################################################################################

YOURINTIMEPATH=""
YOURPROJECT=""
YOURFPGATOOL=""
YOURTOOLVERSION=""
YOURINTIMESCRIPT=""

# Example Values
# YOURINTIMEPATH="/home/dev2002/intime_v2.6.11/intime.sh"
# YOURPROJECT="/home/dev2002/plunify/examples/vivado/eight_bit_uc_xpr/eight_bit_uc.xpr"
# YOURFPGATOOL="vivado"
# YOURTOOLVERSION="2018.2.0"
# YOURINTIMESCRIPT="/home/dev2002/intimeflow.tcl"

echo " ----------Plunify Pte Ltd----------------"
echo " Starting InTime Shell Script..."

if [ -z "${YOURINTIMEPATH}" ]; then
	echo " [Error] Please specify the InTime installation path. E.g. /mnt/intime.sh"
    exit 1
fi
if [ -z "${YOURPROJECT}" ]; then
	echo " [Error] Please specify your project file name, e.g. /mnt/project/project.xpr or dcp"
    exit 1
fi
if [ -z "${YOURFPGATOOL}" ]; then
	echo " [Error] Please specify your tool, e.g vivado"
    exit 1
fi
if [ -z "${YOURTOOLVERSION}" ]; then
	echo " [Error] Please specify a tool version number, e.g. 2018.2.0"
    exit 1
fi
if [ -z "${YOURINTIMESCRIPT}" ]; then
	echo " [Error] Please specify a InTime Optimization Tcl script, e.g. intimeflow.tcl."
    exit 1
fi


echo "Command Executed:" "${YOURINTIMEPATH}" -mode batch -platform minimal -project "${YOURPROJECT}" -vendor_toolchain "${YOURFPGATOOL}" -vendor_toolchain_version "${YOURTOOLVERSION}" -s "${YOURINTIMESCRIPT}"

"${YOURINTIMEPATH}" -mode batch -platform minimal -project "${YOURPROJECT}" -vendor_toolchain "${YOURFPGATOOL}" -vendor_toolchain_version "${YOURTOOLVERSION}" -s "${YOURINTIMESCRIPT}"

echo " Ending InTime Shell Script..."
echo " ----------------------------------------"
