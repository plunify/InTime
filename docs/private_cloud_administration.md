Private Cloud / InTime Server Administration Commands
=====================================================

The InTime Server console allows the user to view the current status of any InTime job. It also has useful commands to query the InTime Server.

There are two modes; In user mode, the command prompt is displayed as
`user>`. In admin mode, the command prompt is displayed as `admin>`.

When in user mode, the user has limited rights to access information on
workers and jobs. When a user goes into admin mode by using `.admin`,
the user can perform tasks like setting up the global toolchain, cancel
jobs and more.

To start a new administrator console in Linux run `admin_console.sh`,
and in Windows use `admin_console.bat` command in intimeserver
directory. :

    $ ./admin_console.sh
    InTime Server version: 1.2.0
    Git: v1.2 (Build 17873da)
    Built on Fri, 03 Oct 2014 15:32:53
    Type ".help" for instructions. For help on any command, type ".help.<command>"

    user>

Please note that admin mode is available to users running
admin_console(.sh/.bat) inside intimeserver. The InTime Server only
allows localhost for admin access by default. The user has to start
InTime Server with an additional argument to make admin mode available
to all users.

To list all the commands, use `.help` in the administrator console. To
exit the administrator console, enter the `.exit` command.

    user> .help
    +------------+------+-----------------------------------------------------+
    | COMMANDS   | MODE | DESCRIPTION                                         |
    +------------+------+-----------------------------------------------------+
    | .help      | user | show list of commands for user mode                 |
    | .whoami    | user | show current login user                             |
    | .admin     | user | enter admin mode                                    |
    | .exit      | user | exit admin console                                  |
    | .date      | user | show current date example .help.date                |
    | .global    | user | show global configuration example .help.global      |
    | .poll      | user | execute commands in polling mode example .help.poll |
    | .server    | user | show information on server example .help.server     |
    |------------|------|-----------------------------------------------------|
    | .file      | user | show latest files example .help.file                |
    | .history   | user | show latest history example .help.history           |
    | .job       | user | show latest job example .help.job                   |
    | .log       | user | show latest log example .help.log                   |
    | .num       | user | show current local/remote job id example .help.num  |
    | .revision  | user | show latest revisions example .help.revision        |
    | .summary   | user | show summary                                        |
    |------------|------|-----------------------------------------------------|
    | .con       | user | show number of concurrent run example .help.con     |
    | .cpu       | user | show workers cpu info example .help.cpu             |
    | .disk      | user | show workers disk info example .help.disk           |
    | .os        | user | show workers os info example .help.os               |
    | .ram       | user | show workers disk info example .help.ram            |
    | .status    | user | show workers status info example .help.status       |
    | .toolchain | user | show workers toolchain info example .help.toolchain |
    | .ver       | user | show workers version info example .help.ver         |
    | .worker    | user | show workers network info example .help.worker      |
    +------------+------+-----------------------------------------------------+

    number of rows (time taken in second)

Enable Private Cloud Console GUI
--------------------------------

For users with the InTime client installed on their machines, the
private cloud console can be accessed from within the InTime GUI by
enabling it under [View] -\> [Private Cloud
Console] as shown below
 
![Enabling The Private Cloud Console
GUI](images/private_cloud_administration/show_private_console.png)


When enabled a new tab will appear providing a private cloud console
within the InTime GUI.

 
![Private Cloud Console
GUI](images/private_cloud_administration/console_tab.png)


### Server related commands

The system administrator can use some of these commands to finer-tune
the InTime Server to better suit the production environment.

Date and time commands
----------------------

Commands to find out the date and time of the InTime Server.

-   `.help.date` Show additional information and commands.
-   `.date` Show the date of InTime Server.
-   `.date.format` Show the date format. The default date format is
    yyyy-MM-dd.
-   `.date.time` Show the time of InTime Server.
-   `.date.time.format` Show the time format. The default time format is
    HH-mm-ss.

<!-- -->

    user> .date
    +------------+
    | DATE       |
    +------------+
    | 2014-10-03 |
    +------------+

    user> .date.time
    +----------+
    | TIME     |
    +----------+
    | 08:16:30 |
    +----------+

    user> .help.date
    +--------------------------------------+-------------------------------------------+
    | USAGE                                | DESCRIPTION                               |
    +--------------------------------------+-------------------------------------------+
    | .date                                | show current date                         |
    | .date.format                         | show current date format                  |
    |--------------------------------------|-------------------------------------------|
    | .date.time                           | show current time                         |
    | .date.time.format                    | show current time format                  |
    +--------------------------------------+-------------------------------------------+

Global configuration commands
-----------------------------

Users can set up toolchains in InTime Server that are required by the
workers. This allows each worker to pull the information when it starts
up.

-   `.help.global` Show additional information and commands.
-   `.global.setting` Show global setting.
-   `.global.toolchain` Show global toolchain.

<!-- -->

    user> .global.setting
    +--------------------------+--------------------------------------------+
    | SETTING                  | VALUE                                      |
    +--------------------------+--------------------------------------------+
    | File transfer port       | 39941                                      |
    | Admin console port       | 39942                                      |
    | File transfer method     | SFTP                                       |
    | Server working directory | /home/intime/intimeserver/./plunify_server |
    | Working Directory        | $USER_HOME/plunify/worker_jobs             |
    | Concurrent job limit     | 4                                          |
    | Log verbosity            | normal                                     |
    | Timestamp                | 2014-10-03T06:06:15                        |
    +--------------------------+--------------------------------------------+

    user> .global.toolchain
    +-----+-------+--------+-----------+-----------------------------+---------------+
    | NO. | OS    | VENDOR | TOOL      | PATH                        | LICENSE       |
    +-----+-------+--------+-----------+-----------------------------+---------------+
    | 1   | LINUX | Altera | QuartusII | /opt/Quartus/13.0.0/quartus | 2500@10.0.0.1 |
    +-----+-------+--------+-----------+-----------------------------+---------------+

    1 row (0.01 sec), 2014-10-03 08:51:57

-   `.global.set.toolchain` Setup new toolchain. (Available in admin
    mode only).
-   `.global.del.toolchain` Remove existing toolchain. (Available in
    admin mode only)

#### Setup new global toolchain

The example below shows how to set up a new toolchain.

    user> .admin
    admin> .global.set.toolchain

    Enter Operating System for tool, use .end to exit session.
    Operating System: ('1' for Linux, '2' for Windows) [1]

    admin.os> 1

    Enter tool, use .end to exit session.
    Tools: ('1' for QuartusII, '2' for ISE, '3' for Vivado)

    admin.tool> 1

    Enter installation path, use .end to exit session.
    For example, /opt/Quartus/13.0.0/quartus

    admin.path> /opt/Quartus/13.0.0/quartus

    Enter license path, use .end to exit session.
    For example, /opt/file.dat for node-locked license,
    port@hostname for floating license(LM_LICENSE_FILE)

    admin.license> 2200@10.0.0.1

    Operating System  : Linux
    Tool              : QuartusII
    Installation path : /opt/Quartus/13.0.0/quartus
    License           : 2500@10.0.0.1

    Save to session? ('y' for Yes or 'n' for No) [y]

    admin.confirm> y

    Add more toolchain? ('y' for Yes or 'n' for No) [y]

    admin.confirm> n
    admin> .global.toolchain

    +-----+-------+--------+-----------+-----------------------------+---------------+
    | NO. | OS    | VENDOR | TOOL      | PATH                        | LICENSE       |
    +-----+-------+--------+-----------+-----------------------------+---------------+
    | 1   | LINUX | Altera | QuartusII | /opt/Quartus/13.0.0/quartus | 2500@10.0.0.1 |
    +-----+-------+--------+-----------+-----------------------------+---------------+

    1 row (0.01 sec), 2014-10-03 08:51:57

#### Change concurrent run for workers

The example below shows how to change the number of concurrent run for
workers. After approximately four minutes, check the new concurrent run
value with the command `.cpu`

    user> .admin
    admin> .global.set.concore=4

    Proceed to set concurrent core? ('y' for Yes or 'n' for No) [y]

    admin.confirm> y

    admin> .global.setting

    +---------------------------------+--------------------------------------------+
    | SETTING                         | VALUE                                      |
    +---------------------------------+--------------------------------------------+
    | File transfer port              | 39941                                      |
    | Admin console port              | 39942                                      |
    | File transfer method            | SFTP                                       |
    | Server working directory        | /home/intime/intimeserver/./plunify_server |
    | Working Directory               | $USER_HOME/plunify/worker_jobs             |
    | Concurrent core for each worker | 4                                          |
    | Log verbosity                   | normal                                     |
    | Timestamp                       | 2014-10-03T06:06:15                        |
    +---------------------------------+--------------------------------------------+

    admin> .cpu

    +-----+---------------------+-------+--------+--------+-------+-----------+---------+---------+---------+
    | NO. | CLIENTID            | JOBID | USERID | STATUS | ALIVE | TYPE      | PHYCORE | CONCORE | MAXCORE |
    +-----+---------------------+-------+--------+--------+-------+-----------+---------+---------+---------+
    | 1   | user10_00505621E3EE |       | user10 | FREE   | YES   | INTEL 2.7 | 4       | 4       | 0       |
    +-----+---------------------+-------+--------+--------+-------+-----------+---------+---------+---------+

#### Change working directory for worker 

The example below shows how to change the working directory for worker.
In normal condition, the working directory for the worker is located in
/USER_HOME/plunify folder. Due to low disk space, the next best
solution is to change the working directory to another location. Let say
the new working directory is located in /tmp/worker_jobs. Make sure
user has permission to write to this new directory and it exists.

    user> .admin
    admin> .global.set.jobsdir=/tmp/worker_jobs

    After 2 heartbeats sent by the worker, perform a .disk command to view the new working directory.
    admin> .disk

    +-----+---------------------+-------+--------+--------+-------+----------+------------------+
    | NO. | CLIENTID            | JOBID | USERID | STATUS | ALIVE | DISK[GB] | DIRECTORY        |
    +-----+---------------------+-------+--------+--------+-------+----------+------------------+
    | 1   | user10_00505622093F |       | user10 | FREE   | YES   | 2.2      | /tmp/worker_jobs |
    +-----+---------------------+-------+--------+--------+-------+----------+------------------+

#### Change log verbosity for worker

Due to low disk space, changing the log verbosity from \"normal\" to
\"low\" helps to reduce the size of worker's log file.

    user> .admin
    admin> .global.set.log_verbosity=low

    Proceed to set log verbosity? ('y' for Yes or 'n' for No) [y]

    admin.confirm> y

    After 2 heartbeats sent by the worker, perform a .ver
    admin> .ver

    +-----+---------------------+-------+-----------+--------+-------+---------------+---------------+-----------+
    | NO. | CLIENTID            | JOBID | USERID    | STATUS | ALIVE | AGENT_VERSION | JAR_VERSION   | VERBOSITY |
    +-----+---------------------+-------+-----------+--------+-------+---------------+---------------+-----------+
    | 1   | user10_00505622093F |       | user10    | FREE   | YES   | 1.3-f3b6d7f   | 1.3.0-6396de8 | LOW       |
    +-----+---------------------+-------+-----------+--------+-------+---------------+---------------+-----------+

#### Retry error string

Some general errors like license not enough may caused the toolchain to
fail. InTime Server has the feature to match the error and perform
another retry. The maximum number of retries is 3. There are a few
standard errors that have been shipped in the installer.

    user> .global.error

    +-----+------------------+----------------------------------------------------------------------------------------------------------+
    | NO. | DATE             | RETRY_ERRORS                                                                                             |
    +-----+------------------+----------------------------------------------------------------------------------------------------------+
    | 1   | 2015-12-09 07:33 | Error (316008): Selected feature of TimeQuest Timing Analyzer is not available with your current license |
    | 2   | 2015-12-09 07:33 | Error (292027): Specified license does not contain information required to run the Quartus II software   |
    | 3   | 2015-12-09 07:33 | Error (10003): Can't open encrypted VHDL or Verilog HDL file                                             |
    | 4   | 2015-12-09 07:33 | Error (119013): Current license file does not support                                                    |
    +-----+------------------+----------------------------------------------------------------------------------------------------------+

#### Edit retry error string

User can add and remove error retry string. The example below shows how
to add new error retry string. When InTime Server found an exact match
on a particular strategy, it will reset that strategy.

    user> .admin
    admin> .global.set.error

    Enter retry error string, use .end to exit session.

    admin.error> License not found

    Add more? ('y' for Yes or 'n' for No) [y]

    admin.confirm> n

    admin> .global.error

    +-----+------------------+----------------------------------------------------------------------------------------------------------+
    | NO. | DATE             | RETRY_ERRORS                                                                                             |
    +-----+------------------+----------------------------------------------------------------------------------------------------------+
    | 1   | 2015-12-09 07:33 | Error (316008): Selected feature of TimeQuest Timing Analyzer is not available with your current license |
    | 2   | 2015-12-09 07:33 | Error (292027): Specified license does not contain information required to run the Quartus II software   |
    | 3   | 2015-12-09 07:33 | Error (10003): Can't open encrypted VHDL or Verilog HDL file                                             |
    | 4   | 2015-12-09 07:33 | Error (119013): Current license file does not support                                                    |
    | 5   | 2015-12-15 02:53 | License not found                                                                                        |
    +-----+------------------+----------------------------------------------------------------------------------------------------------+

Server commands
---------------

Users can query the InTime Server on processor usage, memory usage and
other information.

-   `.help.server` Show additional information and commands.
-   `.server.cpu` Show information on InTime Server CPU.
-   `.server.disk` Show information on InTime Server disk space.
-   `.server.ip` Show information on InTime Server IP address.
-   `.server.jdbc` Show information on InTime Server JDBC settings,
    current supported are sqlite and mysql.
-   `.server.mac` Show information on InTime Server MAC address.
-   `.server.memory` Show information on InTime Server memory usage.
-   `.server.network` Show information on InTime Server network
    information.
-   `.server.os` Show information on InTime Server Operating System
    information.
-   `.server.uptime` Show information on how long has InTime Server been
    running.
-   `.server.git` Show information on InTime Server built information.
-   `.server.lic` Show information on InTime Server license information.
-   `.server.event` Show information on InTime Server events.
-   `.server.version` Show information on InTime Server version.
-   `.server.properties.set` Edit configuration of server. (Available in
    admin mode only)

<!-- -->

    user> .admin
    admin> .server.properties.set.PRIORITY_FLAG=core

-   `.server.properties` Show information on InTime Server settings and
    properties. Some of the properties are read-only (R) and cannot be
    changed. Properties with (RW) are those that can be edited using the
    `.server.set.properties` command.

<!-- -->

    user> .server.properties

    +-----+------------+-------------------------+-----------------------------------------+
    | NO. | READ/WRITE | KEY                     | VALUE                                   |
    +-----+------------+-------------------------+-----------------------------------------+
    | 1   | R          | AUTO_FLAG               | ON                                      |
    | 2   | R          | ADMIN_CONSOLE_PORT      | 39942                                   |
    | 3   | R          | COMMUNICATION_PORT      | 39940                                   |
    | 4   | R/W        | CPUUTIL_FLAG            | OFF                                     |
    | 5   | R/W        | CPUUTIL_LIMIT           | 50%                                     |
    | 6   | R          | FILETRANSFER_PORT       | 39941                                   |
    | 7   | R          | HEARTBEATCHECK_TIME     | 60SECONDS                               |
    | 8   | R/W        | KEEP_FILE_FLAG          | 3DAYS                                   |
    | 9   | R/W        | KEEP_REPORTS_FLAG       | NO                                      |
    | 10  | R/W        | KEEP_SOURCE_FLAG        | YES                                     |
    | 11  | R          | LICENSEEXPIRYCHECK_TIME | 3600SECONDS                             |
    | 12  | R/W        | LICENSEFILE             | /home/intime//intimeserver/./server.lic |
    | 13  | R/W        | LOGLEVEL                | INFO                                    |
    | 14  | R/W        | MATCHUSER_FLAG          | NO                                      |
    | 15  | R/W        | MAX_ADMIN_POLL          | 12                                      |
    | 16  | R/W        | MAX_ADMIN_POLL_INTERVAL | 5SECONDS                                |
    | 17  | R          | MAXTIMECHECK_TIME       | 60SECONDS                               |
    | 18  | R          | MAXTIMECHECK_TIME_JOB   | 15MINUTES                               |
    | 19  | R/W        | MEMUTIL_FLAG            | OFF                                     |
    | 20  | R/W        | MEMUTIL_LIMIT           | 1GB                                     |
    | 21  | R          | MULTICAST               | OFF                                     |
    | 22  | R          | NETWORKWHITELIST_FLAG   | OFF                                     |
    | 23  | R          | QUEUECHECK_TIME         | 33SECONDS                               |
    | 24  | R          | REMOTE_ADMIN            | ADMIN                                   |
    | 25  | R/W        | REVISION_RETRY          | YES                                     |
    | 26  | R/W        | PRIORITY_FLAG           | CORE                                    |
    | 27  | R          | TIME_CHANGE_OFFLINE     | 10MINUTES                               |
    | 28  | R/W        | TIME_REMOVE_RECORD      | 20MINUTES                               |
    | 29  | R          | URL_TIMEOUT             | 30SECONDS                               |
    | 30  | R          | URL_READ_TIMEOUT        | 60SECONDS                               |
    +-----+------------+-------------------------+-----------------------------------------+

#### Server Properties Reference

-   **AUTO_FLAG** Auto assign flag. The InTime Server automatically
    delegates jobs to workers when this is ON. This flag can be changed
    if a Private Enterprise license is in use. Another way to change
    this property is to supply the argument when starting the InTime
    Server. In Private Group license, it is always ON and read-only.
    AUTO_FLAG Value: on/off.

<!-- -->

    $ ./start_server.sh -auto off

-   **ADMIN_CONSOLE_PORT** Admin console port number. Default port for
    admin console is 39942. If this port is being used, users can change
    this property via an argument when starting the InTime Server.

<!-- -->

    $ ./start_server.sh -adminport 15888

-   **COMMUNICATION_PORT** Communication port number. Default port for
    communication is 39940. If this port is being used, users can change
    this property via an argument when starting the InTime Server.

<!-- -->

    $ ./start_server.sh -comport 15666

-   **CPUUTIL_FLAG** CPU utilization flag. InTime Server will use the
    CPUUTIL_LIMIT property when assigning jobs to a worker.
    CPUUTIL_FLAG Value: on/off. Only those workers with utilization
    equal or less than CPUUTIL_LIMIT will be assigned.
-   **CPUUTIL_LIMIT** Value: 0-100. Another way to change this property
    is via an argument when starting the InTime Server.

<!-- -->

    $ ./start_server.sh -cpuutil on -cpulimit 50

-   **FILETRANSFER_PORT** File transfer port number. Default port for
    file transfer is 39941. If this port has been used, it can be
    changed via the appropriate argument when starting the InTime
    Server.

<!-- -->

    $ ./start_server.sh -fileport 15777

-   **KEEP_FILE_FLAG** Keep the uploaded source and report files. The
    default value is 3 days. The file will be kept in the respective
    folder for the specified number of days.
-   **KEEP_REPORTS_FLAG** Keep the uploaded report files. The default
    is NO. InTime Server will remove the report files after
    KEEP_FILE_FLAG days.
-   **KEEP_SOURCE_FLAG** Keep the source files. Default is YES. Change
    the value to NO and InTime Server will remove the source files after
    KEEP_FILE_FLAG days.
-   **LOGLEVEL** The log level of InTime Server. Default is info. The
    log will be rolled over after midnight every day. The logs can be
    found in INTIMESERVER_HOME/logs/intimeserver.log. The rolled-over
    logs will be named intimeserver.yyyy-MM-dd.log
-   **MATCHUSER_FLAG** Match the USERID of worker. Default is YES. Job
    submitted by user will be assigned to workers that are started by
    the same user. If the USERID is blank, InTime Server will ignore
    MATCHUSER_FLAG and proceed to automatically assign the job.
-   **MEMUTIL_FLAG** Memory utilization flag. InTime Server will use
    the MEMUTIL_FLAG when assigning jobs to a worker. MEMUTIL_FLAG
    Value: on/off. Only those workers with memory equal or more than
    MEMUTIL_LIMIT in GB will be assigned jobs.
-   **MEMUTIL_LIMIT** Value in Giga-Bytes (GB). Another way to change
    is to supply the appropriate argument when starting the InTime
    Server.

<!-- -->

    $ ./start_server.sh -memutil on -memlimit 4

-   **REMOTE_ADMIN** InTime Server by default does not allow admin mode
    to be invoked via the admin console, only via the loop-back
    interface or localhost. Another way to change this behavior is via
    an argument when starting the InTime Server.

<!-- -->

    $ ./start_server.sh -remoteadmin admin

-   **PRIORITY_FLAG** InTime Server will usen this value to assign to
    more workers or more CPU cores. The preferred method is to assign to
    more workers. PRIORITY_FLAG Value: worker/core. Another way to
    change this behavior is via an argument when starting the InTime
    Server.

<!-- -->

    $ ./start_server.sh -priority core

### Job related commands

Job commands
------------

-   `.help.job` Show additional information and commands.
-   `.job` Show latest job information.

To see the last four jobs, type `.job4` To see job number 88, type
`.job=88`. Each job has a status, and the types of status are:

**UPLOADING** The project file is being uploaded to the InTime Server.

**NEW** The job has been created, but not assigned to any worker. You
can also use `.job.assign=jobid` to assign the job.

**ASSIGNED** The job is assigned to a worker.

**COMPLETED** The job has completed.

**CANCELLED** The job was cancelled by the user.

**ERROR** The job has an error. Check the InTime log for details.

**QUEUED** The job is currently in the job queue waiting for a worker to
pick it up.

-   `.help.file` Show additional information and commands.
-   `.file` Show the latest file details. It displays the source files
    present and the reports for the last job. The file size is in bytes.
-   `.help.history` Show additional information and commands.
-   `.history` Show the latest job status report sent by InTime.
-   `.help.revision` Show additional information and commands.
-   `.revision` Show the latest job status report sent by the tools. For
    user running InTime in Tcl mode, this feature allows the user to
    view the current process carried out by the tool.
-   `.help.log` Show additional information and commands.
-   `.log` Show latest job log details.

<!-- -->

    user> .job

    +-----+--------------------+-------+---------+--------+-------+--------+---------+-----------+
    | NO. | CLIENTID           | JOBID | P.JOBID | USERID | START | FINISH | TIME    | STATUS    |
    +-----+--------------------+-------+---------+--------+-------+--------+---------+-----------+
    | 1   | user1_22000B40A9E3 | 998   | 997     | user1  | 03:35 | 03:51  | 15m:40s | COMPLETED |
    +-----+--------------------+-------+---------+--------+-------+--------+---------+-----------+

    user> .file

    +-----+---------+-------+---------------------------------------------------------+----------+
    | NO. | TYPE    | JOBID | FILENAME                                                | SIZE[B]  |
    +-----+---------+-------+---------------------------------------------------------+----------+
    | 1   | SOURCE  | 998   | 998_flow_config.ini                                     | 1479     |
    | 2   | SOURCE  | 998   | 998_upload_fileset.txt                                  | 698      |
    | 3   | SOURCE  | 998   | eight_bit_uc.qar                                        | 120502   |
    | 4   | SOURCE  | 998   | eight_bit_uc_fallback.zip                               | 97439    |
    |-----|---------|-------|---------------------------------------------------------|----------|
    |     |         |       | TOTAL                                                   | 215 KB   |
    |-----|---------|-------|---------------------------------------------------------|----------|
    | 1   | REPORTS | 998   | user1_22000A41049F_998_cal_speed_low_fileset.txt        | 541      |
    | 2   | REPORTS | 998   | user1_22000A41049F_998_cal_speed_low_reports.zip        | 17274    |
    | 3   | REPORTS | 998   | user1_22000A41049F_998_cal_speed_low_status.txt         | 1209     |
    | 4   | REPORTS | 998   | user1_22000A41049F_998_g_optimize_13_fileset.txt        | 563      |
    | 5   | REPORTS | 998   | user1_22000A41049F_998_g_optimize_13_reports.zip        | 17102    |
    | 6   | REPORTS | 998   | user1_22000A41049F_998_g_optimize_13_status.txt         | 1221     |
    | 7   | REPORTS | 998   | user1_22000A41049F_998_g_optimize_18_fileset.txt        | 563      |
    | 8   | REPORTS | 998   | user1_22000A41049F_998_g_optimize_18_reports.zip        | 17233    |
    | 9   | REPORTS | 998   | user1_22000A41049F_998_g_optimize_18_status.txt         | 1221     |
    | 10  | REPORTS | 998   | user1_22000A41049F_998_g_optimize_8_fileset.txt         | 561      |
    |-----|---------|-------|---------------------------------------------------------|----------|
    |     |         |       | TOTAL                                                   | 371.5 KB |
    +-----+---------+-------+---------------------------------------------------------+----------+

    user> .history

    +-----+----------+-------+--------+-----------+-------+--------+---------+-----+-------------+
    | NO. | CLIENTID | JOBID | USERID | STATUS    | START | FINISH | TIME    | ROW | REVISIONS   |
    +-----+----------+-------+--------+-----------+-------+--------+---------+-----+-------------+
    | 1   | user1    | 998   | user1  | COMPLETED | 03:35 | 03:39  | 03m:43s | 1   | cal_speed   |
    | 2   | user1    | 998   | user1  | COMPLETED | 03:39 | 03:43  | 03m:34s | 1   | g_opt_8     |
    | 3   | user1    | 998   | user1  | COMPLETED | 03:43 | 03:46  | 03m:10s | 1   | g_opt_13    |
    | 4   | user1    | 998   | user1  | COMPLETED | 03:47 | 03:51  | 03m:39s | 1   | g_opt_18    |
    | 5   | user1    | 998   | user1  | COMPLETED | 03:35 | 03:38  | 03m:07s | 1   | g_opt_1     |
    | 6   | user1    | 998   | user1  | COMPLETED | 03:39 | 03:42  | 03m:30s | 1   | g_opt_6     |
    | 7   | user1    | 998   | user1  | COMPLETED | 03:43 | 03:46  | 03m:31s | 1   | g_opt_12    |
    | 8   | user1    | 998   | user1  | COMPLETED | 03:47 | 03:50  | 03m:26s | 1   | g_opt_17    |
    | 9   | user1    | 998   | user1  | COMPLETED | 03:35 | 03:38  | 03m:14s | 1   | g_opt_2     |
    | 10  | user1    | 998   | user1  | COMPLETED | 03:39 | 03:42  | 03m:14s | 1   | g_opt_7     |
    +-----+----------+-------+--------+-----------+-------+--------+---------+-----+-------------+

    user> .revision

    +-----+-------------------+-------+--------+-----------+----------------+---------------+-------+---------+---------+-------+
    | NO. | CLIENTID          | JOBID | USERID | STATUS    | TOOLCHAIN_STEP | REVISION      | START | UPDATED | TIME    | RETRY |
    +-----+-------------------+-------+--------+-----------+----------------+---------------+-------+---------+---------+-------+
    | 1   | user1_22000A4109F | 998   | user1  | COMPLETED | RUNDONE        | cal_speed_low | 03:34 | 03:39   | 03m:26s | 1/3   |
    | 2   | user1_22000B409D4 | 998   | user1  | COMPLETED | RUNDONE        | g_optimize_1  | 03:34 | 03:38   | 03m:26s | 1/3   |
    | 3   | user1_22000B40A72 | 998   | user1  | COMPLETED | RUNDONE        | g_optimize_2  | 03:34 | 03:38   | 03m:26s | 2/3   |
    | 4   | user1_22000B45123 | 998   | user1  | COMPLETED | RUNDONE        | g_optimize_3  | 03:34 | 03:38   | 03m:26s | 1/3   |
    | 5   | user1_22000B45876 | 998   | user1  | COMPLETED | RUNDONE        | g_optimize_4  | 03:34 | 03:39   | 03m:26s | 2/3   |
    | 6   | user1_22000B45123 | 998   | user1  | COMPLETED | RUNDONE        | g_optimize_5  | 03:34 | 03:42   | 03m:26s | 3/3   |
    | 7   | user1_22000B409D4 | 998   | user1  | COMPLETED | RUNDONE        | g_optimize_6  | 03:34 | 03:42   | 03m:26s | 2/3   |
    | 8   | user1_22000B40A72 | 998   | user1  | COMPLETED | RUNDONE        | g_optimize_7  | 03:34 | 03:42   | 03m:26s | 1/3   |
    | 9   | user1_22000A4109F | 998   | user1  | COMPLETED | RUNDONE        | g_optimize_8  | 03:34 | 03:43   | 03m:26s | 1/3   |
    | 10  | user1_22000B45876 | 998   | user1  | COMPLETED | RUNDONE        | g_optimize_9  | 03:34 | 03:43   | 03m:26s | 2/3   |
    +-----+-------------------+-------+--------+-----------+----------------+---------------+-------+---------+---------+-------+


    user> .log
    HH:mm:ss | UUID     | CLIENTID              | STEP | MESSAGE
    03:34:44 | A-F5F349 | user1_22000B40A9E3    | PASS | Submitting a new job, 998
    03:34:59 | A-F60530 | user1_22000B40A9E3    | PASS | Uploading project file.
    03:35:29 | A-E538BE | user1_22000B451923    | PASS | Downloading revision g_optimize_3
    03:46:37 | A-495FF2 | user1_22000B451923    | PASS | Downloading revision g_optimize_15
    03:46:49 | A-15B1BD | user1_22000B409ED4    | PASS | Finishing revision g_optimize_12
    03:46:56 | A-8BA3B3 | user1_22000B40A572    | PASS | Downloading revision g_optimize_16
    03:46:57 | A-83423A | user1_22000A41049F    | PASS | Finishing revision g_optimize_13
    03:47:17 | A-01411C | user1_22000B409ED4    | PASS | Downloading revision g_optimize_17
    03:47:19 | A-44D36E | user1_22000B458D76    | PASS | Finishing revision g_optimize_14
    03:47:24 | A-86410D | user1_22000A41049F    | PASS | Downloading revision g_optimize_18
    03:47:46 | A-1814D9 | user1_22000B458D76    | PASS | Downloading revision g_optimize_19
    03:50:06 | A-ED9722 | user1_22000B451923    | PASS | Finishing revision g_optimize_15
    03:50:07 | A-D73889 | user1_22000B40A572    | PASS | Finishing revision g_optimize_16
    03:50:43 | A-D24C33 | user1_22000B409ED4    | PASS | Finishing revision g_optimize_17
    03:51:01 | A-843C18 | user1_22000B458D76    | PASS | Finishing revision g_optimize_19
    03:51:03 | A-A0F46B | user1_22000A41049F    | PASS | Completing job 998

### Worker related commands

CPU commands
------------

-   `.help.cpu` Show additional information and commands.
-   `.cpu` Show CPU information of workers.
-   `.con` Show CPU summary of all workers.

Display the workers' physical cores, concurrent core and maximum core
values. The + symbol denotes the total physical cores on that machine.
Under the command `.cpu.jobid` and `.con.userid`, the \* symbol denotes
the total physical cores based on the user account.

Display the workers' CPU type, number of cores and total CPU
utilization. To see more examples of `.cpu`, type `.help.cpu` PHYCORE
refers to physical hardware cores. CONCORE is the number of concurrent
cores that the worker has been configured using .global.set.concore.
MAXCORE is the InTime Server assigned limit on of number of cores to
use.

    user> .cpu

    +----+----------+-------+--------+--------+-------+------+---------+---------+---------+------+
    | NO | CLIENTID | JOBID | USERID | STATUS | ALIVE | TYPE | PHYCORE | CONCORE | MAXCORE | UTIL |
    +----+----------+-------+--------+--------+-------+------+---------+---------+---------+------+
    | 1  | user1    |       | user1  | FREE   | YES   | AMD  | 1       | 1       | 0       | 0    |
    | 2  | user1    |       | user1  | FREE   | YES   | AMD  | 1       | 1       | 0       | 0    |
    | 3  | user1    |       | user1  | FREE   | YES   | AMD  | 1       | 1       | 0       | 0    |
    | 4  | user1    |       | user1  | FREE   | YES   | AMD  | 1       | 1       | 0       | 0    |
    | 5  | user1    |       | user1  | FREE   | YES   | AMD  | 1       | 1       | 0       | 0    |
    +----+----------+-------+--------+--------+-------+------+---------+---------+---------+------+

    user> .con

    +-----+---------------+--------------+------------------+-------+---------+---------+---------+
    | NO. | HOSTNAME      | MAC_ADDRESS  | IP_ADDRESS       | AGENT | PHYCORE | CONCORE | MAXCORE |
    +-----+---------------+--------------+------------------+-------+---------+---------+---------+
    | 1   | 10-231-2-185  | 22000AE702B9 | 10.231.2.185     | 1     | 1 +     | 1       | 0       |
    | 2   | 10-147-29-112 | 22000B41047D | 10.147.29.118    | 1     | 1 +     | 1       | 0       |
    | 3   | 10-183-45-71  | 22000B421BDE | 10.183.45.71     | 1     | 1 +     | 1       | 0       |
    | 4   | 10-167-14-181 | 22000B4516F7 | 10.167.149.181   | 1     | 1 +     | 1       | 0       |
    | 5   | 10-181-21-195 | 22000B458FAD | 10.181.21.195    | 1     | 1 +     | 1       | 0       |
    |-----|---------------|--------------|------------------|-------|---------|---------|---------|
    |     |               |              | TOTAL            | 5     | 5       | 5       | 0       |
    |-----|---------------|--------------|------------------|-------|---------|---------|---------|
    |     |               |              | CONCURRENT_USED  |       |         |         | 0       |
    |-----|---------------|--------------|------------------|-------|---------|---------|---------|
    |     |               |              | CONCURRENT_LEFT  |       |         |         | 100     |
    |     |               |              | CONCURRENT_TOTAL |       |         |         | 100     |
    +-----+---------------+--------------+------------------+-------+---------+---------+---------+

Operating System commands
-------------------------

-   `.os` Show Operating System information of the workers.

<!-- -->

    user> .os

    +-----+----------+-------+--------+--------+-------+--------+--------+--------+---------------+
    | NO. | CLIENTID | JOBID | USERID | STATUS | ALIVE | SYSTEM | ARCH   | KERNEL | DISTRO        |
    +-----+----------+-------+--------+--------+-------+--------+--------+--------+---------------+
    | 1   | user1    |       | user1  | FREE   | YES   | LINUX  | x86_64 | 2.6.18 | CENTOS 5.6    |
    | 2   | user1    |       | user1  | FREE   | YES   | LINUX  | x86_64 | 2.6.18 | CENTOS 5.6    |
    | 3   | user1    |       | user1  | FREE   | YES   | LINUX  | x86_64 | 2.6.18 | CENTOS 5.6    |
    | 4   | user1    |       | user1  | FREE   | YES   | LINUX  | x86_64 | 2.6.18 | CENTOS 5.6    |
    | 5   | user1    |       | user1  | FREE   | YES   | LINUX  | x86_64 | 2.6.18 | CENTOS 5.6    |
    +-----+-------u--+-------+--------+--------+-------+--------+--------+--------+---------------+

Disk and Memory commands
------------------------

-   `.disk` Show the Disk space usage of the workers.
-   `.ram` Show the Memory availability of the workers.

<!-- -->

    user> .disk

    +-----+----------+-------+--------+--------+-------+----------+-------------------------------+
    | NO. | CLIENTID | JOBID | USERID | STATUS | ALIVE | DISK[GB] | DIRECTORY                     |
    +-----+----------+-------+--------+--------+-------+----------+-------------------------------+
    | 1   | user1    |       | user1  | FREE   | YES   | 71.4     | /home/user1/plunify/wrkr_jobs |
    | 2   | user1    |       | user1  | FREE   | YES   | 71.4     | /home/user1/plunify/wrkr_jobs |
    | 3   | user1    |       | user1  | FREE   | YES   | 71.4     | /home/user1/plunify/wrkr_jobs |
    | 4   | user1    |       | user1  | FREE   | YES   | 71.4     | /home/user1/plunify/wrkr_jobs |
    | 5   | user1    |       | user1  | FREE   | YES   | 71.4     | /home/user1/plunify/wrkr_jobs |
    +-----+----------+-------+--------+--------+-------+----------+-------------------------------+

    user> .ram

    +-----+--------------------+-------+-----------+--------+-------+----------+-----------+
    | NO. | CLIENTID           | JOBID | USERID    | STATUS | ALIVE | FREE[GB] | TOTAL[GB] |
    +-----+--------------------+-------+-----------+--------+-------+----------+-----------+
    | 1   | user1_22000AE702B9 |       | user1     | FREE   | YES   | 3.6      | 3.8       |
    | 2   | user1_22000B41047D |       | user1     | FREE   | YES   | 3.6      | 3.8       |
    | 3   | user1_22000B421BDE |       | user1     | FREE   | YES   | 3.6      | 3.8       |
    | 4   | user1_22000B4516F7 |       | user1     | FREE   | YES   | 3.6      | 3.8       |
    | 5   | user1_22000B458FAD |       | user1     | FREE   | YES   | 3.6      | 3.8       |
    +-----+--------------------+-------+-----------+--------+-------+----------+-----------+

Networking commands
-------------------

-   `.worker` Show the hostname, IP address and MAC address of the
    workers.

<!-- -->

    user> .worker

    +-----+----------+-------+--------+--------+-------+----------+--------------+----------------+
    | NO. | CLIENTID | JOBID | USERID | STATUS | ALIVE | HOSTNAME | MAC_ADDRESS  | IP_ADDRESS     |
    +-----+----------+-------+--------+--------+-------+----------+--------------+----------------+
    | 1   | user1_22 |       | user1  | FREE   | YES   | 10-147-2 | 22000B41047D | 10.147.29.118  |
    | 2   | user1_27 |       | user1  | FREE   | YES   | 10-167-1 | 22000B4516F7 | 10.167.149.181 |
    | 3   | user1_2D |       | user1  | FREE   | YES   | 10-181-2 | 22000B458FAD | 10.181.21.195  |
    | 4   | user1_2E |       | user1  | FREE   | YES   | 10-183-4 | 22000B421BDE | 10.183.45.71   |
    | 5   | user1_29 |       | user1  | FREE   | YES   | 10-231-2 | 22000AE702B9 | 10.231.2.185   |
    +-----+----------+-------+--------+--------+-------+----------+--------------+----------------+

Toolchain commands
------------------

-   `.toolchain` Show the vendor, tool and version of the workers.

<!-- -->

    user> .toolchain

    +-----+-----------+-------+--------+--------+-------+-------+--------+-----------+---------+
    | NO. | CLIENTID  | JOBID | USERID | STATUS | ALIVE | COUNT | VENDOR | TOOL      | VERSION |
    +-----+-----------+-------+--------+--------+-------+-------+--------+-----------+---------+
    | 1   | user1_220 |       | user1  | FREE   | YES   | 2     | ALTERA | QUARTUSII | 13.0.0  |
    |     |           |       |        |        |       |       | ALTERA | QUARTUSII | 13.1.2  |
    | 2   | user1_220 |       | user1  | FREE   | YES   | 2     | ALTERA | QUARTUSII | 13.0.0  |
    |     |           |       |        |        |       |       | ALTERA | QUARTUSII | 13.1.2  |
    | 3   | user1_220 |       | user1  | FREE   | YES   | 2     | ALTERA | QUARTUSII | 13.0.0  |
    |     |           |       |        |        |       |       | ALTERA | QUARTUSII | 13.1.2  |
    | 4   | user1_220 |       | user1  | FREE   | YES   | 2     | ALTERA | QUARTUSII | 13.0.0  |
    |     |           |       |        |        |       |       | ALTERA | QUARTUSII | 13.1.2  |
    | 5   | user1_220 |       | user1  | FREE   | YES   | 2     | ALTERA | QUARTUSII | 13.0.0  |
    |     |           |       |        |        |       |       | ALTERA | QUARTUSII | 13.1.2  |
    +-----+-----------+-------+--------+--------+-------+-------+--------+-----------+---------+

Health commands
---------------

-   `.status` Show the health of the workers and if they are alive. It
    shows if the workers are free or busy.

<!-- -->

    user> .status

    +-----+-----------------+-------+--------+--------+-------+--------+--------+-----------------+
    | NO. | CLIENTID        | JOBID | USERID | STATUS | ALIVE | B.LIST | MARKED | LAST_HEARTBEAT  |
    +-----+-----------------+-------+--------+--------+-------+--------+--------+-----------------+
    | 1   | user1_22000AE70 |       | user1  | FREE   | YES   | NO     | NIL    | 03:06 (00m:19s) |
    | 2   | user1_22000B410 |       | user1  | FREE   | YES   | NO     | NIL    | 03:06 (00m:18s) |
    | 3   | user1_22000B421 |       | user1  | FREE   | YES   | NO     | NIL    | 03:06 (00m:18s) |
    | 4   | user1_22000B451 |       | user1  | FREE   | YES   | NO     | NIL    | 03:06 (00m:18s) |
    | 5   | user1_22000B458 |       | user1  | FREE   | YES   | NO     | NIL    | 03:06 (00m:19s) |
    +-----+-----------------+-------+--------+--------+-------+--------+--------+-----------------+

Version commands
----------------

-   `.ver` Show version information of the workers. It has the log
    verbosity of the workers.

<!-- -->

    user> .ver

    +-----+-----------+-------+--------+--------+-------+---------------+-------------+-----------+
    | NO. | CLIENTID  | JOBID | USERID | STATUS | ALIVE | AGENT_VERSION | JAR_VERSION | VERBOSITY |
    +-----+-----------+-------+--------+--------+-------+---------------+-------------+-----------+
    | 1   | user1_220 |       | user1  | FREE   | YES   | 1.2-fa13b7e   | 1.2-a4b0498 | LOW       |
    | 2   | user1_220 |       | user1  | FREE   | YES   | 1.2-fa13b7e   | 1.2-a4b0498 | LOW       |
    | 3   | user1_220 |       | user1  | FREE   | YES   | 1.2-fa13b7e   | 1.2-a4b0498 | LOW       |
    | 4   | user1_220 |       | user1  | FREE   | YES   | 1.2-fa13b7e   | 1.2-a4b0498 | LOW       |
    | 5   | user1_220 |       | user1  | FREE   | YES   | 1.2-fa13b7e   | 1.2-a4b0498 | LOW       |
    +-----+-----------+-------+--------+--------+-------+---------------+-------------+-----------+

Shutdown workers commands
-------------------------

-   `.intime.set.terminate` Mark workers for termination. After two
    heartbeats, a marked worker will terminate.
-   `.intime.del.terminate` Unmark workers so that they will not be
    terminated.

<!-- -->

    user> .admin
    admin> .intime.set.terminate

    +--------+----------------------+--------+--------+-------+--------+--------+-----------------+
    | INDEX. | CLIENTID             | USERID | STATUS | ALIVE | B.LIST | MARKED | LAST_HEARTBEAT  |
    +--------+----------------------+--------+--------+-------+--------+--------+-----------------+
    | 1      | user1_22000AE702B9   | user1  | FREE   | YES   | NO     | NIL    | 03:11 (01m:17s) |
    | 2      | user1_22000B41047D   | user1  | FREE   | YES   | NO     | NIL    | 03:11 (01m:17s) |
    | 3      | user1_22000B421BDE   | user1  | FREE   | YES   | NO     | NIL    | 03:11 (01m:17s) |
    | 4      | user1_22000B4516F7   | user1  | FREE   | YES   | NO     | NIL    | 03:11 (01m:17s) |
    | 5      | user1_22000B458FAD   | user1  | FREE   | YES   | NO     | NIL    | 03:11 (01m:18s) |
    +--------+----------------------+--------+--------+-------+--------+--------+-----------------+

    Enter worker INDEX numbers and/or ranges separated by commas.
    For example, 1,2,3-5
    admin.intime.set.terminate> 1

    Proceed to mark agent to terminate? ('n' for No or 'y' for Yes) [n]

    admin.confirm> y
    admin> .status

    +-----+--------------------+-------+--------+--------+-------+--------+-----------+-----------------+
    | NO. | CLIENTID           | JOBID | USERID | STATUS | ALIVE | B.LIST | MARKED    | LAST_HEARTBEAT  |
    +-----+--------------------+-------+--------+--------+-------+--------+-----------+-----------------+
    | 1   | user1_22000AE702B9 |       | user1  | FREE   | YES   | NO     | TERMINATE | 03:12 (00m:02s) |
    | 2   | user1_22000B41047D |       | user1  | FREE   | YES   | NO     | NIL       | 03:12 (00m:19s) |
    | 3   | user1_22000B421BDE |       | user1  | FREE   | YES   | NO     | NIL       | 03:12 (00m:19s) |
    | 4   | user1_22000B4516F7 |       | user1  | FREE   | YES   | NO     | NIL       | 03:12 (00m:19s) |
    | 5   | user1_22000B458FAD |       | user1  | FREE   | YES   | NO     | NIL       | 03:12 (00m:20s) |
    +-----+--------------------+-------+--------+--------+-------+--------+-----------+-----------------+

    admin>

Blacklist workers commands
--------------------------

User can blacklist workers so that new jobs will not be assigned to
those workers.

-   `.intime.set.blacklist` Blacklist workers. Job will not be assigned
    to the workers.
-   `.intime.del.blacklist` Remove blacklisted workers.

<!-- -->

    user> .admin
    admin> .intime.set.blacklist

    +--------+------------------------+----------+--------+-------+--------+--------+-----------------+
    | INDEX. | CLIENTID               | USERID   | STATUS | ALIVE | B.LIST | MARKED | LAST_HEARTBEAT  |
    +--------+------------------------+----------+--------+-------+--------+--------+-----------------+
    | 1      | user1_22000B412014     | user1    | FREE   | YES   | NO     | NIL    | 09:50 (00m:18s) |
    | 2      | user1_22000B428179     | user1    | FREE   | YES   | NO     | NIL    | 09:50 (00m:18s) |
    | 3      | user1_22000B450FAF     | user1    | FREE   | YES   | NO     | NIL    | 09:50 (00m:22s) |
    | 4      | user1_22000B45186F     | user1    | FREE   | YES   | NO     | NIL    | 09:50 (00m:19s) |
    | 5      | user1_22000B460FAD     | user1    | FREE   | YES   | NO     | NIL    | 09:50 (00m:19s) |
    | 6      | user1_22000B4693FA     | user1    | FREE   | YES   | NO     | NIL    | 09:50 (00m:28s) |
    +--------+------------------------+----------+--------+-------+--------+--------+-----------------+

    Enter worker INDEX numbers and/or ranges separated by commas.
    For example, 1,2,4-6
    admin.intime.set.blacklist> 1-3

    Proceed to set blacklist? ('y' for Yes or 'n' for No) [y]

    admin.confirm> y
    admin> .status

    +-----+---------------------+-------+--------+--------+-------+--------+--------+-----------------+
    | NO. | CLIENTID            | JOBID | USERID | STATUS | ALIVE | B.LIST | MARKED | LAST_HEARTBEAT  |
    +-----+---------------------+-------+--------+--------+-------+--------+--------+-----------------+
    | 1   | user1_22000B412014  |       | user1  | FREE   | YES   | YES    | NIL    | 09:50 (00m:02s) |
    | 2   | user1_22000B428179  |       | user1  | FREE   | YES   | YES    | NIL    | 09:50 (00m:04s) |
    | 3   | user1_22000B450FAF  |       | user1  | FREE   | YES   | YES    | NIL    | 09:50 (00m:04s) |
    | 4   | user1_22000B45186F  |       | user1  | FREE   | YES   | NO     | NIL    | 09:50 (00m:05s) |
    | 5   | user1_22000B460FAD  |       | user1  | FREE   | YES   | NO     | NIL    | 09:50 (00m:04s) |
    | 6   | user1_22000B4693FA  |       | user1  | FREE   | YES   | NO     | NIL    | 09:50 (00m:14s) |
    +-----+---------------------+-------+--------+--------+-------+--------+--------+-----------------+

### Security Commands

In admin console, there are some basic security features built in. When
connecting to the InTime Server admin console from another host, the
user can only be in user mode. To allow a user to perform admin mode
functions, start InTime server with the following option: :

    $ ./start_server.sh -remoteadmin <argument>

**disable** to disable remote admin console, user mode is also disabled.
The only way is go to admin console is from the localhost of the InTime
Server.

**user** to allow only user mode when connect remotely. This is the
default if -remoteadmin is not used.

**admin** to allow both admin and user mode when connect remotely.

Creating a blacklist (hosts.deny)
---------------------------------

In the InTimeServer installation directory, an administrator can create
a hosts.deny file. With this file, an dministrator can specify which
host to deny access to. The format of the file is as follows:

    $ cd INTIMESERVER_HOME
    $ vi hosts.deny

    192.168.2.10
    192.168.5.200/32
    192.168.1.0/24

Format of hosts.deny. The first line blocks host 192.168.2.10. The
second line blocks 192.168.5.200/32. This is a CIDR notation with a mask
of 255.255.255.255. The last line blocks a subnet of 192.168.1.0/24. All
hosts in the range 192.168.1.1 - 192.168.1.254 will not be allowed to
login to admin console.

Creating a whitelist (hosts.allow)
----------------------------------

If the network is too big to deny unwanted hosts, another method is to
create the whitelist. An administrator can create a hosts.allow file. To
enable this feature, the server has to be started with extra argument.
Now all hosts will be blocked by default. Only hosts listed in the
hosts.allow file will be allowed to do remote admin console.

    $ ./start_server.sh -hostsallow on

    $ cd INTIMESERVER_HOME
    $ vi hosts.allow

    192.168.6.1
    192.168.23.9/32
    192.168.8.0/24

Format of hosts.allow. The first line is to allow host 192.168.6.1. The
second line is to allow 192.168.23.9/32. This is a CIDR notation with a
mask of 255.255.255.255. The last line allows a subnet of
192.168.8.0/24. All hosts in the range 192.168.8.1 - 192.168.8.254 will
be allowed to login to the admin console.

If the record appears in both hosts.allow and hosts.deny, the host will
be blocked. hosts.deny has priority. If hosts.allow is turned on, it is
advisable to remove hosts.deny to avoid confusion.
'