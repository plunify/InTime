InTime Arguments Reference
===========================

These arguments are used with InTime executable. For example, this command will show the help message
```bash
./intime.sh -h
```

Argument Name | Description
------------- | ------------- 
-h                                | Print this help message
-version                          | Print the version of InTime
-s <file_path\>                   | Specifies a startup script to run
-tclargs                          | Arguments to pass to script specified using -s.
-project <file_path\>             | Specifies the path to a vendor's project or InTime project file
-vendor_toolchain <value\>        | The preferred toolchain to use for this session
-vendor_toolchain_version <value\>| The preferred toolchain version to use for this session
-vendor_toolchain_binpath <value\>| The preferred bin/exe path of the vendor toolchain to use for this session
-revision <value\>                | Specifies the default revision/run of the project to work on
-mode <tcl, gui, batch\>          | Specifies the mode (Defaults to <gui\>)
-log <file_path\>                 | Specifies a custom target file to which session logging must be done
-non_db                           | Enables the non database flow where no new results are added to projects' runs databases
-username                         | Specify username for the session
-locale                           | Specify the locale to use for this session (Defaults to system's locale)
-stdout <all, tcl\>               | Specify which messages forwarded to stdout when running in tcl/batch modes (Defaults to <all\>)
-ip                               | Specifies the IP address of the server for this session (Defaults to configured IP address)
-comport                          | Specifies the comport to use for server communication during this session (Defaults to configured comport)
-custom_flow_config               | Specifies a custom flow config file to use for this session, instead of using project specific flow configurations.
-custom_session_path              | Specifies a custom session path to use for this session, instead of "<user_home\>/.plunify".
-custom_logs_path                 | Specifies a custom location for log files.
-no_global_toolchains             | Specifies that this client should not fetch global toolchains during startup in a private cloud environment.
-no_global_config                 | Specifies that this client should not fetch global parameters during startup in a private cloud environment.
-tc <toolchain\>                  | Specifies the vendor toolchain to be used for this session. Valid toolchain values are vivado, ise, quartusii, quartuspp.
-ssh							  | Use ssh protocol to connect to InTime Server. InTime server must be started with the -ssh argument as well.
-singledb						  | Uses the db file specified under the "singledb" settings in plunify.ini as the db file.  
-platform <xcb, minimal\>		  | Defaults to <xcb\>, which is for GUI mode. Use minimal for Tcl mode.
