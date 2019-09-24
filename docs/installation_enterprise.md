InTime Group/Enterprise Installation
====================================

This installation guide shows how to install the required components of
the *InTime Group* and *InTime Enterprise* editions.

-   **InTime Group:** Links up multiple computers for faster and better
    results.
-   **InTime Enterprise:** Deploy on private clouds or datacenters,
    centralized control, customization.

These editions require installation of an InTime Server as well as one
or more InTime Workers. For installation instructions for the *InTime
Basic* and *InTime Cloud* editions, please see the *InTime Basic
Installation* guide.

After performing the steps below, please configure your environment as
described in the InTime Configuration Guide.

System Requirements
-------------------

### License Server/InTime Server

The License Server is a service to allow InTime to use floating
licenses. The InTime Server is a service that schedules jobs, and
manages files and other operations. These two services are installed by
default during installation when the default options are selected.

### Operating System (OS)

-   64-bit architectures only
-   Windows / Ubuntu 12.04 and above / RedHat Enterprise 5 and above /
    compatible
-   Other versions are supported upon request.

### Application

1.  InTime Server (Java 1.8.0\_77 JDK will also be installed together)
2.  InTime compiled for the operating system on which the Workers will
    run.

### Hardware

1.  A minimum of 40GB free space is required for InTime Server.

### Network

1.  The InTime Server requires a **static IP address** in order to
    communicate with the Workers.
2.  A/The **MAC address** of the InTime Server machine is required for
    license generation.

### Firewall

1.  Firewall requirements for incoming traffic.

    > a.  Ports 39940, 39941 for workers to communicate with InTime
    >     Server.
    > b.  Port 39942 for the administrative console.

\newpage 

Linux Installation
------------------

### Step 1: Download InTime Server Installer

Download `intimeserver_v<version>_64bit_linux.sh` from the URL provided
by Plunify.

### Step 2: Setup Server Installer Permissions

This is normally installed by an administrator or a privileged user.
Login as a privileged user and set user execute permissions for
`intimeserver_v<version>_64bit_linux.sh`.

In this example, the user is `cadadmin`, and the installation directory
is `/home/cadadmin/intimeserver/`. You can specify any directory for the
installation.

    $ pwd
    /home/cadadmin/intimeserver/
    $ chmod u+x intimeserver_v<version>_64bit_linux.sh

### Step 3: Run Server Installer

Run the `intimeserver_v<version>_64bit_linux.sh` installer file. Use the
default options for full installation. For those user who are planning
to migrate existing database and configurations from an earlier version,
enter the directory of the ealier version for the installer to copy the
files. To install License Server and InTime Server on 2 or more servers,
refer to <https://support.plunify.com> for more information.

    $ ./intimeserver_v<version>_64bit_linux.sh

    Verifying archive integrity... All good.
    Uncompressing Plunify InTime Server version 2.6.10 (Build ccc1cfd).........................
    Installation selection ('1' Full installation InTime Server/License Server, 
    '2' License Server only, '3' InTime Server only) [1] 1
    Installing InTime Server/License Server
    Install for which database? ('1' for SQLite or '2' for MySQL) [1] 1
    Install support for SQLite
    Do you want to clean up(remove) the installer ('y' for Yes or 'n' for No) [n] n
    Use jvm options default(1), minimal(2), optimal(3) (Blank is default) 1
    If you plan to migrate configuration and database from an earlier version of InTime Server 
    installed on another directory, key in the directory to migrate. If you are installing 
    over the existing directory or this is the first time you install InTime Server, 
    press enter to skip [enter]: 
    Skipping.
    InTime Server/License Server installation OK.

    $ 

### Step 4: Verify Server Installation

Verify the installation by inspecting the contents of the `intimeserver`
directory. The expected output is shown below.

    $ pwd
    /home/cadadmin/intimeserver
    $ ls -lsh
    total 1.6M
    4.0K drwxr-xr-x. 6 cadadmin eda 4.0K Jan 30 02:38 acl
    4.0K -rw-r--r--. 1 cadadmin eda   19 Jan 30 02:38 acl.txt
    4.0K -rwxr-xr-x. 1 cadadmin eda  648 Jan 30 02:38 admin_console.sh
    4.0K -rwxr-xr-x. 1 cadadmin eda  711 Jan 30 02:38 admin_console.sh.rl
    4.0K -rw-r--r--. 1 cadadmin eda   30 Jan 30 02:38 admin.txt
    4.0K -rwxr-xr-x. 1 cadadmin eda  329 Jan 30 02:38 backup_intimeruns.sh
    4.0K -rw-r--r--. 1 cadadmin eda 2.5K Jan 30 02:38 CHANGELOG
    4.0K drwxr-xr-x. 2 cadadmin eda 4.0K Jan 30 02:38 conf
     16K -rw-r--r--. 1 cadadmin eda  13K Jan 30 02:38 InTime_icon.png
    1.4M -rw-r--r--. 1 cadadmin eda 1.4M Jan 30 02:38 intimeserver.jar
    4.0K -rw-r--r--. 1 cadadmin eda  287 Jan 30 02:38 intimeserver.properties.bak
    4.0K -rw-r--r--. 1 cadadmin eda  118 Jan 30 02:38 JDBC.properties
       0 lrwxrwxrwx. 1 cadadmin eda   11 Jan 31 01:05 jdk -> jdk1.8.0_77
    4.0K drwxr-xr-x. 8 cadadmin eda 4.0K Mar 21  2016 jdk1.8.0_77
    4.0K -rw-r--r--. 1 cadadmin eda   95 Jan 31 01:05 jvm.options
    4.0K -rw-r--r--. 1 cadadmin eda   95 Jan 30 02:38 jvm.options.default
    4.0K -rw-r--r--. 1 cadadmin eda   94 Jan 30 02:38 jvm.options.minimal
    4.0K -rw-r--r--. 1 cadadmin eda  272 Jan 30 02:38 jvm.options.optimal
    4.0K drwxr-xr-x. 2 cadadmin eda 4.0K Jan 30 02:38 keys
    4.0K drwxr-xr-x. 2 cadadmin eda 4.0K Jan 30 02:38 lib
     12K -rwxr-xr-x. 1 cadadmin eda 8.3K Jan 30 02:38 license_server.sh
    4.0K drwxr-xr-x. 2 cadadmin eda 4.0K Jan 31 01:05 logs
    4.0K -rw-r--r--. 1 cadadmin eda   30 Jan 30 02:38 plunify.args.bak
     24K -rw-r--r--. 1 cadadmin eda  21K Jan 30 02:38 plunify.db.bak
    4.0K -rw-r--r--. 1 cadadmin eda  555 Jan 30 02:38 plunify.errors.bak
    4.0K -rwxr-xr-x. 1 cadadmin eda  455 Jan 30 02:38 plutil.sh
    4.0K drwxr-xr-x. 2 cadadmin eda 4.0K Jan 30 02:38 report_template
    4.0K -rwxr-xr-x. 1 cadadmin eda  335 Jan 30 02:38 restore_intimeruns.sh
     12K -rwxr-xr-x. 1 cadadmin eda 8.1K Jan 30 02:38 server_test.sh
    4.0K -rw-r--r--. 1 cadadmin eda   98 Jan 31 01:05 SQL.properties
     12K -rwxr-xr-x. 1 cadadmin eda 9.3K Jan 30 02:38 start_server.sh
    4.0K drwxr-xr-x. 3 cadadmin eda 4.0K Jan 30 02:38 util
    4.0K drwxr-xr-x. 6 cadadmin eda 4.0K Jan 30 02:38 web
    4.0K drwxr-xr-x. 2 cadadmin eda 4.0K Jan 30 02:38 webapps
    $ 

### Step 5: Install License And Start Server

Put the license file, e.g. *server.lic*, into
`/home/cadadmin/intimeserver/` and launch the InTime Server. To launch
the InTime Server, run the script `./start_server.sh`.

    $ pwd
    /home/cadadmin/intimeserver
    $ ./start_server.sh 

    ----- SHELL SCRIPT VARIABLES -----
    PID [OLD]         = 29016 
    SERVERIP 1        = 192.168.2.100


    $---------- BEGINNING OF LOG FILE ----------
    UTC DATE/TIME: 2015-12-15 02:32:01.269


    $---------- BEGINNING OF LOG FILE ----------
    UTC DATE/TIME: 2015-12-15 02:32:01.269
    Write permission (plunify.db) [  OK  ]
    JDBC (plunify.db)             [  OK  ]
    JDBC (intimeruns.h2.db)       [  OK  ]
    Starting InTime Server        [  OK  ]
    Starting License Server       [  OK  ]
    Starting ACL Server           [  OK  ]
    License server.lic            [  OK  ]
    License has started?          [  OK  ]
    License not expired?          [  OK  ]
    License Mac 08:00:27:70:A5:E2 [  OK  ]
    License features              [  OK  ]

    Admin portal can be accessed at http://localhost:39946/admin

    $ 

!!! tip
    To start/restart the Server at a later time, just run
`./start_server.sh` again. To shut down the server run
`./start_server.sh -stop`


### Step 6: Check Server Status

Check the InTime Server's status.

    $ ps -ef|grep java
    intime    5700     1  2 07:16 pts/3    00:00:03 /home/caadmin/intimeserver/./jdk/bin/java -Xms512m -Xmx1024m -server -Dlogback.configurationFile=/home/caadmin/intimeserver/./conf/logback.xml -DINTIMESERVER_HOME=/home/caadmin/intimeserver/. -classpath /home/caadmin/intimeserver/./intimeserver.jar:/home/caadmin/intimeserver/./lib/* com.plunify.main.InTimeServer -directory /home/caadmin/intimeserver/./plunify_server -licensefile /home/caadmin/intimeserver/./server.lic -log_level info

### Step 7: Automatically Start Server (Optional)

To automatically start the InTime Server when a machine boots up, add
the following line to `/etc/rc.local`.

    $ vi /etc/rc.local
    /bin/su -s /bin/bash -c '/home/cadadmin/intimeserver/start_server.sh' cadadmin

### Step 8: Download Worker Installer

Download `intime_v<version>_64bit_linux.sh` from the URL provided by
Plunify.

### Step 9: Setup Worker Installer Permissions

This can be installed either by an administrator or by a user depending
on the target installation directory. Login as the appropriate user and
set user execute permissions for intime\_v\<version\>\_64bit\_linux.sh.

In this example, the user is `user10`, and the installation directory is
`/home/user10/intime`. You can specify any directory for the
installation.

    $ pwd
    /home/user10/intime/
    $ chmod u+x intime_v<version>_64bit_linux.sh

### Step 10: Run Worker Installer

Run the `intime_v<version>_64bit_linux.sh` installer.

    $ pwd
    /home/user10/intime/
    $ ./intime_v<version>_64bit_linux.sh
    Verifying archive integrity... All good.
    Uncompressing Plunify InTime version <version>..................................
    ................................................................................
    ................................................................................
    ................................................................................

The script extracts installation files and presents a licensing
agreement. Hit \<space\> to scroll down.

    PLUNIFY SOFTWARE LICENSE AGREEMENT REVISION 2014-01-09

    Copyright (c) 2009-2014, PLUNIFY All rights reserved.


    This Software License Agreement (the "Agreement") is a legally binding
    agreement between the User of the software (the "User") and PLUNIFY Pte Ltd
    ("PLUNIFY"), seated at 67 Ayer Rajah Crescent #03-20/22 Singapore 139950. By
    using or installing the software (as updated by PLUNIFY from time to time,
    the "Software"), the User is accepting to be bound by all of the terms and
    conditions of this Agreement.
    --More--

Enter *Y* to accept and continue.

    --------------------------------------------------------------------------------
    Accept the terms of the Plunify End-User Licensing Agreement ('y' for Yes or 'n' for No)? y

    Thank you, proceeding with installation...

    Install default modules (Recommended)? ('y' for Yes or 'n' for No) [y] y
    Installing defaults...


    Installing 64-bit JRE...

    InTime installation complete.

\newpage    

Windows Installation
--------------------

### Step 1: Download Server Installer

Download `intimeserver_v<version>_64bit_win.exe` from the URL provided
by Plunify.

### Step 2: Run Server Installer

Run the installer by double-clicking it on the machine designated as the
server. Select `Full Installation` to install the default. InTime Server
will be installed in the default directory `C:\intimeserver`. The
installer will attempt to overwrite earlier version of libraries and
files, do make sure a backup to this directory before installing.

The Installation Wizard contains the following pages which guide you
through the installation process.

1.  User Account Control page
2.  Welcome page
3.  Installation completed

### Step 3: Install License And Start Server

Request a license from Plunify by providing the MAC address of the
InTime Server machine. After receiving the license file, for example,
`server.lic`, place it in `C:\intimeserver` and launch the InTime
Server.

Open a command prompt and navigate to [C:\\intimeserver]{.title-ref}. To
launch InTime Server, run the `start_server.bat` script

!!! tip
    To start/restart the Server at a later time, just run `start_server.bat`
again in another shell. To shut down the server run
`start_server.bat -stop`


Please ensure that you see the license acceptance message as shown in
the last five lines below in
`Figure #figure-installation-enterprise-license-accepted`.

 {#figure-installation-enterprise-license-accepted}
![License Acceptance
Notification](images/installation/win_intimeserver_run_page_1.png)


A Windows Security Alert may pop up indicating that a Java binary is
running. Click \"Allow access\" as shown in
`Figure #figure-installation-enterprise-windows-security-alert`.

 {#figure-installation-enterprise-windows-security-alert}
![Windows Security
Alert](images/installation/win_intimeserver_run_page_2.png)


### Step 4: Download Worker Installer

Download `intime_v<version>_64bit_win.exe` from the URL provided by
Plunify.

### Step 5: Run Worker Installer

Run the installer by double-clicking on the downloaded file on the
user's machine. The installer wizard contains the following pages which
guide you through the installation process.

1.  Welcome page
2.  Accept license agreement
3.  Choose users
4.  Choose install directory
5.  Choose components
6.  Choose start menu folder
7.  Installation in progress\...
8.  Installation completed

!!! tip
    When installation completes, an uninstaller will be created. The
uninstaller can be accessed either through the created start menu item
or through the \"Add/Remove Programs\" dialog in Windows.

'