InTime Basic Configuration
==========================

The InTime Basic edition allows running your FPGA designs on your local
machine using the *Local* run target.

The following components are present in this flow:

> 1.  InTime installed on the FPGA developer's machine or a shared
>     network drive.
> 2.  One or more FPGA software installations used to build the design.

Configuration is a three step process:

> 1.  Register the local InTime license. See
>     `local_license_registration`{.interpreted-text role="ref"}
> 2.  Register installed FPGA software. See
>     `local_toolchain_registration`{.interpreted-text role="ref"}
> 3.  Run the example design to verify your installation. See
>     `local_review_quickstart`{.interpreted-text role="ref"}

The ensuing sections guide users through the required steps.

Step 1: License Registration {#local_license_registration}
----------------------------

To use the InTime Basic edition a local license is required.

### Step 1.1: Obtain License

Before starting the private cloud server, submit a copy of the server's
MAC address to Plunify to obtain a license file. Copy the license file
to your `intimeserver` directory. For more details, see the *Obtain A
License* section of the InTime documentation.

### Step 1.2: Launch InTime

#### Launch InTime GUI

Start InTime in GUI mode by clicking its desktop shortcut shown in
`Figure #figure-intime-shortcut`{.interpreted-text role="num"}

 {#figure-intime-shortcut}
![InTime
Shortcut](images/getting_started/intime_logo_circled_48.png)


In Linux, use InTime's desktop shortcut or enter in a command terminal:

    $ ~/plunify/intime/intime.sh -mode gui -platform xcb

#### Launch InTime Tcl Command Line Shell

To launch InTime in command line mode, enter the following commands:

    (Windows) C:\plunify\intime\bin\intime.exe -mode tcl
    (Linux) $ ~/plunify/intime/intime.sh -mode tcl -platform minimal

### Step 1.3: Register License

#### Using InTime GUI

To register the obtained license file using the InTime GUI, open InTime
and then open the license management page using the *Help* -\> *Manage
Licenses* menu item.



A video tutorial showing how to register your local license is available
[here](http://plunify.com/docs/intime_video_1.php).


 {.only}
html

A video tutorial showing how to register your local license is available
.


Before registering a license for the first time, the manage license page
will indicate that no license is currently registered as shown in
`Figure #figure-intime-manage-licenses`{.interpreted-text role="num"}.

 {#figure-intime-manage-licenses}
![Manage Licenses In
InTime](images/licensing/manage_license_no_license.png)


To register a license, click *Change License File* and browse to the
obtained license file. If the selected license file is valid, it will be
loaded and its contents shown and InTime will indicate that the license
was successfully verified as shown in
`Figure #figure-local-verified-license`{.interpreted-text role="num"}.

 {#figure-local-verified-license}
![Verified Local
License](images/licensing/manage_license_valid.png)


The *Manage License* widget can be used to view the state of the
registered license at any time. If for some reason the license becomes
invalid over time (license period expires etc.), this will be clearly
indicated on here.

#### Using command line mode

The `license` tcl command provides a set of sub-commands which can be
used to manage the registered license:

    plunify> license
    Current license file for InTime is: D:/lic/license_valid_private_group.lic

    details                   - Displays details about the current local license.
    file_name                 - Returns the file name of the current local license.
    register <license_file>   - Registers a new local license file.
    reset                     - Unregisters the current local license.
    run_target <run_target>   - Checks if local license supports run target.

For example, to register a new license file at
\"/home/user/license.lic\", use the following command:

    plunify> license
    Current license file for InTime is: D:/lic/license_valid_private_group.lic

    details                   - Displays details about the current local license.
    file_name                 - Returns the file name of the current local license.
    register <license_file>   - Registers a new local license file.
    reset                     - Unregisters the current local license.
    run_target <run_target>   - Checks if local license supports run target.

For example, to register a new license file at
\"/home/user/license.lic\", use the following command:

    license register /home/user/license.lic

Step 2: Register FPGA Software {#local_toolchain_registration}
------------------------------

When running and evaluating strategies, InTime launches the applicable
FPGA software in the background. When opening a project, InTime detects
the required vendor toolchain and initializes it. Therefore, the user
must first register the vendor tool before opening any project.

For each tool the following information is required:

-   **Vendor Name:** The name of the tool vendor.
-   **Toolchain Name:** The name of the tool.
-   **Install Path:** The path where this version of the tool is
    installed.
-   **License File:** The path where the license or license server
    associated with this tool can be found. If not specified, InTime
    uses the `LM_LICENSE_FILE` variable in the environment in which
    InTime was launched.

### Register toolchains using the GUI

To register and manage toolchains (your installed FPGA software), open
the *File* \> *Settings* menu and then select *Vendor Toolchains* as
shown in `Figure #figure-intime-toolchains`.

 {#figure-intime-toolchains}
![InTime Toolchain
Management](images/getting_started/settings_vendor_toolchains.png)


New tools can be added either using the auto-detection mechanism or the
*Register Vendor Toolchain* wizard (launched via the Add Toolchain
button). This wizard gives hints on exactly which path in the tool
installation directory needs to be selected. InTime also detects the
tool version automatically. If the wrong directory in the tool
installation tree is selected, an error message will appear.

When attempting to open a project for which the required toolchain is
not registered, InTime gives a notification along with options to either
auto-detect the missing toolchain (when possible), or to launch the
*Vendor Toolchains* settings dialog.

!!! tip
    Auto-detection is only available on Windows at present.


### Register toolchains in command line mode

Vendor toolchain management in the Tcl environment is done using the
`vendors` command. To register new tools use the following commands:

    # Command to auto-detect toolchains (only available on Windows):
    plunify> vendors auto_detect

    # Command to manually register new toolchains:
    plunify> vendors register <vendor_name> <toolchain> <install_path> <license_file>
    # For example (note: toolchain version will be automatically detected):
    plunify> vendors register Altera QuartusII C:/tools/Altera/Quartus/13.0/quartus

For an overview of the `vendors` command, type `vendors` without any
arguments in the Tcl Console. The most useful command is `vendors list`
which gives a quick overview of currently registered toolchains as shown
below:

    plunify> vendors list
    To register new environments, use "vendors register <vendor_name> <toolchain> <install_path> 
    <license_file>".

    Registered Vendor Tools:
    Altera
      QuartusII
            11.0
              Install path: D:/tools/Altera/Quartus/11.0sp1/quartus
              License path: unconfigured
            13.0.0
              Install path: C:/tools/Altera/Quartus/13.0/quartus
              License path: unconfigured

    User Defined Defaults:
    Altera
            QuartusII: 13.0.0

    Session Default:
            -vendor_toolchain_version: 13.0.0

Step 3: Run Example Design {#local_review_quickstart}
--------------------------

After the above configuration steps have been completed, please verify
your installation by running the example design shipped with InTime. The
InTime Quick Start guide provides step-by-step instructions as well as a
quick overview to familiarize yourself with the tool.
'