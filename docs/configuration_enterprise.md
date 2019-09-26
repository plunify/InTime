InTime Configuration for Multiple Seats 
==========================================

The InTime enables the use of multiple networked machines or a server farm for design optimization. This mechanism is enabled by specifying "Private Cloud" as a run target in [Flow Properties](flow_properties.md). Multiple architectures, such as LSF and SGE, are supported.

## Private Cloud Configuration Overview

Below is a typical deployment scenario for multiple InTime workers. 

Roles           | Description
----------------|-------------------
InTime Server   | Manages the job scheduling, collating results and license management.
InTime (Worker) | Workers receives job assignments from the Server and runs them.
InTime (Client) | Client submits jobs (FPGA projects) to the Server and collates the results.

![Private Cloud network Architecture](images/configuration/Client_Worker_Server.png)

Below is a scenario of how a project is submitted over the the network to multiple machines

1. The user starts an InTime Client. User opens a project and submits a job to the InTime Server. Usually this job has multiple revisions or strategies.
2. The InTime Server accepts this job and assigns a *job ID* to it. 
3. The InTime Server queues the job and assigns individual strategy/revision to available InTime Workers.
4. When the InTime Worker has completed their assigned strategy, the results are sent back to the InTime Server.
5. InTime Server will mark the job as completed when all the results are back.
6. InTime client will receive a notification in its next polling request. It will download the results, update the history and complete the job.

### InTime Server Admin Console 

The InTime Server provides an administration console for configuration tasks. Launch the Admin Console before continuing:
```bash
$ pwd
/home/intime/intimeserver

$ ./admin_console.sh
InTime Server version: 1.1.0
Git: v1.2.0 (Build cd64f0b)
Type ".help" for instructions. For help on any command, type ".help.<command>"

user>
```

After launching the console, enter Admin mode using the `.admin`
command:
```
user>.admin
admin>
```

To leave `Admin` mode and return to `User` mode, type `.user`. To exit the Admin Console when in User mode, type `.exit`.  
For more information on the features, see the [Private Cloud Administration](private_cloud_administration.md) documentation.


## Configure Build Environment

To configure all the InTime clients/workers in one operation, InTime uses a setting called "global configuration". All the InTime clients/workers will fetch the environment configuration, such as FPGA tools location, from this setting.  

In this example, the FPGA tool is installed at `/mnt/opt/Vivado/2019.1` and the tool license is a floating one located at `2100@192.168.10.2`.

![Configure global toolchain](images/configuration/global_set_toolchain.png)

To check your what has been confgured, just type `global.toolchain`

```
admin> global.toolchain

+-----+-------+--------+-----------+--------------------------------+-------------------+
| NO. | OS    | VENDOR | TOOL      | PATH                           | LICENSE           |
+-----+-------+--------+-----------+--------------------------------+-------------------+
| 1   | LINUX | Altera | QuartusII | /mnt/opt/Altera/13.1.2/quartus | 2100@192.168.10.2 |
+-----+-------+--------+-----------+--------------------------------+-------------------+
```

The InTime Clients and Agents in the network will automatically fetch the toolchain information when required. Agents will poll and refresh this information at regular intervals, but if a Client is already running while the Server configuration was being changed, the user must manually fetch the updated information. Alternatively, restart the Client if possible.

To view the rest of the global configuration commands, use the `.global` command:

    user.global
    +-----------------------+---------------------------------------------+
    | USAGE                 | DESCRIPTION                                 |
    +-----------------------+---------------------------------------------+
    | .global.client_action | show configured client settings for workers |
    | .global.setting       | show configured setting for workers         |
    | .global.toolchain     | show configured toolchains for workers      |
    +-----------------------+---------------------------------------------+

## Configure Working Directory 

Each worker requires a location where the build is first saved and compiled. This is called the "working directory". By default the working directory is located at `<user home>/plunify`. To change the working directory, use `.global.set.jobsdir` in Admin mode.

```
user> .admin
admin>.global.set.jobsdir=<new working directory path>
```

<!--
Log file directory: 

When starting an Agent, add a -custom\_logs\_path \<new logfile path\argument to specify a new location for the
    logfiles. Make sure the user has write permission in the new path.


Typically the default values for the USER\_HOME environment variable is:

On Linux, /home/\<username\>. On Windows, C:\\Users\\\<username\>.

InTime saves logfiles to
/home/\<username\>/.plunify/\<username\>\_\<macaddress\>/log/ in Linux
and to
C:\\Users\<username\>\\.plunify\\\<username\>\_\<macaddress\>\\log in
Windows.

When you start Private Cloud builds, a working directory will be used to
write temporary build files. The default location is
/home/\<username\>/plunify (Linux) and C:\\Users\\\<username\>\\plunify
(Windows).

If disk space on USER\_HOME is limited, do the following to change the
logfile and working directories:
-->

## Configure InTime Agent 

To let InTime Server knows the availability of InTime workers within the network, the InTime Agent application needs to be started. The InTime Agent is a background process that notifies the InTime Server that a Worker is available/busy/completed.

There are 2 ways to run the agents
1. Manually starting each agent 
2. Via a LSF/SGE/PBS network environment

### Start Agent Manually

The manual way to start an Agent is log onto each build machine and run the `start_agent.sh` script. For example:
```
$ ./intime_agent.sh -ip 192.168.10.1 -comport 39940 -mode background -platform minimal &
```

Below is an explanation of the arguments used in the command.  

Arguments | Description
----------|--------------
ip        | This is the InTime Server IP address
comport   | This is the network port required to connect to the server.
mode      | "background" means it is running as Tcl or a batch
platform  | Minimal. This is say there is no GUI.

The trailing **&** allows `intime_agent.sh` to run in daemon mode, so if you close the terminal, the process will still continue to run. 

!!! tip "Terminate InTime Agent"
    To stop the `intime_agent.sh` process, use the `.intime.set.terminate` command in the server's admin console.


### Start Agent Dynamically (LSF / SGE / PBS) 

InTime supports 3 workload management platforms - LSF, SGE and PBS.
For LSF, SGE or PBS users, the job submission command-line arguments for:

1.  LSF which uses `bsub`.
2.  SGE which uses `qsub`.
3.  Torque PBS which also uses `qsub` but with different arguments.

Below is an overview of how InTime, InTime Server interacts with these platforms.


### Advanced Configuration for LSF / SGE / PBS

Environment variables like USER\_ARGS, INTIME\_HOME, INTIME\_SERVER, etc. are referenced in the following examples. Some of them are specified automatically and you *only* need to configure `USER_ARGS`.

The paragraphs below the command examples explains these variables.

For LSF:- (all on the same line) :

    bsub ${USER_ARGS} ${INTIME_HOME}/intime_agent.sh -mode background -platform minimal 
    -ip ${INTIME_SERVER} -comport ${INTIME_PORT} -remote_job ${REMOTE_JOB_ID} 
    -max_runs ${AGENT_MAX_RUNS} -no_agent_limit 

For SGE:- (all on the same line) :

    qsub ${USER_ARGS} -sync n -S /bin/sh ${INTIME_HOME}/intime_agent.sh
        -intime_home /opt/tools/intime -mode background -platform minimal 
    -ip ${INTIME_SERVER} -comport ${INTIME_PORT} -remote_job ${REMOTE_JOB_ID} 
    -max_runs ${AGENT_MAX_RUNS} -no_agent_limit 

For PBS:- (all on the same line, no space after commas) :

    qsub ${INTIME_HOME}/intime_agent.pbs -v INTIME_HOME=${INTIME_HOME},
        IP=${INTIME_SERVER},COMPORT=${INTIME_PORT},REMOTE_JOB=${REMOTE_JOB_ID},
        MAX_RUNS=${AGENT_MAX_RUNS}

Each of these commands submits a request to start an InTime Agent in the
LSF / SGE / PBS queue. Once the request is serviced, an Agent will start
on the respective machine and the InTime Server will be able to assign
builds to it. This is basically all that you need to use InTime with a
job management system, but specifying the arguments *correctly* is key.
You may have to specify additional arguments that are specific to your
environment (discuss with your IT administrator if necessary).

Consider the commands in more detail:

-   `bsub` or `qsub` arguments specific to your environment *must* be
    inserted before the `intime_agent.sh` command, using the
    `${USER_ARGS}` environment variable.
>
-   PBS uses a supplied script called intime\_agent.pbs to start jobs.
    The arguments used are similar to LSF and SGE except that you do
    not need to specify `${USER_ARGS}`.
>
-   Each command contains macros in the form of `${<MACRO_NAME>}`
    which is resolved by InTime before executing the command. The
    following macros are available:
>
        INTIME_SERVER     : The InTime Server IP/hostname.
        INTIME_PORT       : The InTime Server communication port.
        REMOTE_JOB_ID     : The remote job ID of the current job.
        LOCAL_JOB_ID      : The local job ID of the current job.
        JOB_DIR           : The local working directory of the current job.         
        USER_HOME         : The user's home path on the InTime Client machine.
        INTIME_HOME       : The InTime installation directory.
        PROJECT_DIR       : The current project's directory.
        PROJECT_NAME      : The current project's name.
        USER_ARGS         : Any user specific arguments (queue names, priorities etc.)
    >
        AGENT_MAX_RUNS    : Max runs for agent when action's trigger is "Concurrent Runs".
        REVISION_NAME     : The revision name when action's trigger is "Revision".
>
-   In addition, there are additional arguments for the InTime Agent
    which gives you more control over its behavior; Specifically:
>
        -no_agent_limit
        Allows multiple Agents run on the same machine. 
        By default only one Agent is allowed to run on a single machine. 
    >
        -max_runs <count>
        Limits this Agent to the specified number of runs. 
        When the runs are done, the Agent will terminate itself.
    >
        -remote_job <remote_job_id>
        Restricts this Agent to service a particular build job. The InTime Server will 
        only assign jobs which have the specified ID to this Agent. 
>
These arguments make the agents very flexible and adaptable to many
different environments, but also can make the configuration process a
little daunting for the user.

In the example above, the spawned Agent will only service the specified
build job and will automatically terminate as soon as the required
number of builds have completed.


Once you are ready, begin the dynamic InTime Agent configuration via the
following steps:

### Step 3.2.1: Configure Agents for LSF

Open an InTime Server Admin Console
(`private_cloud_launch_admin_console`{.interpreted-text role="ref"}) and
run the `.global.set.client_action` command. The example below shows how
to specify your `bsub` command.

    user.admin
    admin.global.set.client_action

    Enter action type, use .end to exit session.
    Types: ('1' for for Job Initialization) [1]

    admin.type1

    Enter Operating System, use .end to exit session.
    Operating System: ('1' for Linux, '2' for Windows) [1]

    admin.os1

    Enter script to execute, use .end to exit session.

    admin.execbsub

    (Optional) Enter script arguments, use .end to exit session.

    admin.args${USER_ARGS} ${INTIME_HOME}/intime_agent.sh -mode background 
    -platform minimal -ip ${INTIME_SERVER} -comport ${INTIME_PORT} 
    -remote_job ${REMOTE_JOB_ID} -max_runs ${AGENT_MAX_RUNS} -no_agent_limit

    Enter trigger based on the type, use .end to exit session.
    Triggers: ('1' for Single, '2' for Revision, '3' for Concurrent Runs) [3]

    admin.trigger3

    (Optional) Enter working directory, use .end to exit session.

    admin.directory>

    Enter option to abort a job if it fails, use .end to exit session.
    Abort job if fail: ('1' for yes, '2' for no) [1]

    admin.option1

    Enter a number for the order in which the script will be executed, 0 first to be executed, use 
    .end to exit session. [4]

    admin.order0

    Action Type       : init
    Operating System  : linux
    Execute           : bsub
    Arguments         : ${USER_ARGS} ${INTIME_HOME}/intime_agent.sh -mode background 
    -platform minimal -ip ${INTIME_SERVER} -comport ${INTIME_PORT} 
    -remote_job ${REMOTE_JOB_ID} -max_runs ${AGENT_MAX_RUNS} -no_agent_limit
    Trigger type      : con_runs
    Working Directory :
    Abort job if fail : 1
    Order             : 0

    Save to session? ('y' for Yes or 'n' for No) [y]

    admin.confirmy

    Add more client settings? ('y' for Yes or 'n' for No) [y]

    admin.confirmn
    admin>

### Step 3.2.2: Configure Agents for SGE

Open a Server Admin Console
(`private_cloud_launch_admin_console`{.interpreted-text role="ref"}) and
run the `.global.set.client_action` command. The example below shows how
to specify your `qsub` command.

Do *not* use the -terse argument, and note that InTime looks for the
return string, \"Your job X (\"intime\_agent.sh\") has been submitted\"
in order to verify successful job submission. With the -sync n argument,
qsub exits with exit code 0 as soon as the job is submitted
successfully. In the example below, InTime is installed at
/opt/tools/intime.

    user.admin
    admin.global.set.client_action

    Enter action type, use .end to exit session.
    Types: ('1' for for Job Initialization) [1]

    admin.type1

    Enter Operating System, use .end to exit session.
    Operating System: ('1' for Linux, '2' for Windows) [1]

    admin.os1

    Enter script to execute, use .end to exit session.

    admin.execqsub

    (Optional) Enter script arguments, use .end to exit session.

    admin.args${USER_ARGS} -sync n -S /bin/sh ${INTIME_HOME}/intime_agent.sh
        -intime_home /opt/tools/intime -mode background 
    -platform minimal -ip ${INTIME_SERVER} -comport ${INTIME_PORT} 
    -remote_job ${REMOTE_JOB_ID} -max_runs ${AGENT_MAX_RUNS} -no_agent_limit

    Enter trigger based on the type, use .end to exit session.
    Triggers: ('1' for Single, '2' for Revision, '3' for Concurrent Runs) [3]

    admin.trigger3

    (Optional) Enter working directory, use .end to exit session.

    admin.directory>

    Enter option to abort a job if it fails, use .end to exit session.
    Abort job if fail: ('1' for yes, '2' for no) [1]

    admin.option1

    Enter a number for the order in which the script will be executed, 0 first to be executed, use 
    .end to exit session. [4]

    admin.order0

    Action Type       : init
    Operating System  : linux
    Execute           : qsub
    Arguments         : ${USER_ARGS} -sync n -S /bin/sh ${INTIME_HOME}/intime_agent.sh
        -intime_home /opt/tools/intime
    -mode background -platform minimal -ip ${INTIME_SERVER} -comport ${INTIME_PORT} 
    -remote_job ${REMOTE_JOB_ID} -max_runs ${AGENT_MAX_RUNS} -no_agent_limit
    Trigger type      : con_runs
    Working Directory :
    Abort job if fail : 1
    Order             : 0

    Save to session? ('y' for Yes or 'n' for No) [y]

    admin.confirmy

    Add more client settings? ('y' for Yes or 'n' for No) [y]

    admin.confirmn
    admin>

### Step 3.2.3: Configure Agents for PBS

Open the Server Admin Console
(`private_cloud_launch_admin_console`{.interpreted-text role="ref"}) and
run the `.global.set.client_action` command. The example below shows how
to specify your `qsub` command.

    user.admin
    admin.global.set.client_action

    Enter action type, use .end to exit session.
    Types: ('1' for for Job Initialization) [1]

    admin.type1

    Enter Operating System, use .end to exit session.
    Operating System: ('1' for Linux, '2' for Windows) [1]

    admin.os1

    Enter script to execute, use .end to exit session.

    admin.execqsub

    (Optional) Enter script arguments, use .end to exit session.

    admin.args${INTIME_HOME}/intime_agent.pbs -v INTIME_HOME=${INTIME_HOME},
    IP=${INTIME_SERVER},COMPORT=${INTIME_PORT},REMOTE_JOB=${REMOTE_JOB_ID},
    MAX_RUNS=${AGENT_MAX_RUNS}

    Enter trigger based on the type, use .end to exit session.
    Triggers: ('1' for Single, '2' for Revision, '3' for Concurrent Runs) [3]

    admin.trigger3

    (Optional) Enter working directory, use .end to exit session.

    admin.directory>

    Enter option to abort a job if it fails, use .end to exit session.
    Abort job if fail: ('1' for yes, '2' for no) [1]

    admin.option1

    Enter a number where script will be executed, 0 first to be executed, use 
    .end to exit session. [4]

    admin.order0

    Action Type       : init
    Operating System  : linux
    Execute           : qsub
    Arguments         : ${INTIME_HOME}/intime_agent.pbs -v INTIME_HOME=${INTIME_HOME},
    IP=${INTIME_SERVER},COMPORT=${INTIME_PORT},REMOTE_JOB=${REMOTE_JOB_ID},
    MAX_RUNS=${AGENT_MAX_RUNS}
    Trigger type      : con_runs
    Working Directory :
    Abort job if fail : 1
    Order             : 0

    Save to session? ('y' for Yes or 'n' for No) [y]

    admin.confirmy

    Add more client settings? ('y' for Yes or 'n' for No) [y]

    admin.confirmn
    admin>

### Step 3.2.4: Verify Configuration

Use the `.global.client_action` command in the Server Admin Console to
view the actions that you created. You can also verify them using the
InTime Client as described in
`private_cloud_client_actions_verify`{.interpreted-text role="ref"}.

### Step 3.3: Verifying Agent Status {#private_cloud_start_agents_verify}

In the Server Admin Console
(`private_cloud_launch_admin_console`{.interpreted-text role="ref"}),
type `.status` to list active Agents.

    user.status
    +-----+--------------------+-------+--------+--------+-------+--------+-----------------+
    | NO. | CLIENTID           | JOBID | USERID | STATUS | ALIVE | B.LIST | LAST_HEARTBEAT  |
    +-----+--------------------+-------+--------+--------+-------+--------+-----------------+
    | 1   | user_192_168_2_211 | 2915  | user   | BUSY   | YES   | NO     | 08:43 (00m:48s) |
    | 2   | user_192_168_2_211 | 2915  | user   | BUSY   | YES   | NO     | 08:43 (00m:36s) |
    +-----+--------------------+-------+--------+--------+-------+--------+-----------------+
    2 rows (0.01 sec), 2014-12-10 08:44:14

Next, use `.toolchain` to verify if all Agents successfully received and
applied the FPGA tools' information from the Server.

    user.toolchain
    +-----+--------------------+-------+--------+--------+-------+--------+-----------+---------+
    | NO. | CLIENTID           | JOBID | USERID | STATUS | ALIVE | VENDOR | TOOL      | VERSION |
    +-----+--------------------+-------+--------+--------+-------+--------+-----------+---------+
    | 1   | user_192_168_2_211 |       | user   | FREE   | YES   | ALTERA | QUARTUSII | 13.1.2  |
    | 2   | user_192_168_2_212 |       | user   | FREE   | YES   | ALTERA | QUARTUSII | 13.1.2  |
    +-----+--------------------+-------+--------+--------+-------+--------+-----------+---------+
    2 rows (0.01 sec), 2014-12-10 08:48:41

Agents can be terminated using the `.intime.set.terminate` Admin Console
command. See the *Private Cloud Administration* documentation for more
information.

Step 4: Client Configuration {#private_cloud_client_configuration}
----------------------------

Finally, configure your InTime Client for use in your Private Cloud.

### Step 4.1. Specify InTime Server Information

Starting from InTime 2.4 and above, if you specify the InTime Server as
part of the LM\_LICENSE\_FILE environment variable (Format:
<39940@x.x.x.xwhere x.x.x.x is the Server IP), the InTime Client
automatically picks up the required information. Otherwise, please
specify the Server IP address and communications port (\"comport\")
information in the dialog shown below.

    [user@host]$ export LM_LICENSE_FILE=39940@192.168.2.210:21000@192.168.0.1:21001@192.168.0.2
    [user@host]$ /mnt/opt/tools/intime/intime.sh

Open the settings dialog using *File* \*Settings* and then select *Run
Targets*. Under the *Private Cloud* tab enter the Server IP and comport,
then click *Test And Configure* as shown in
`Figure #figure-configure-client-server-address`.

 {#figure-configure-client-server-address}
![Specify InTime Server Information in the InTime
Client](images/configuration/setup_client_server_address.png)


!!! tip
    If your Server was started with multicast enabled, the above fields will
be set automatically.


If you are running the InTime Client in commandline mode, the following
Tcl commands can be used to set the server address.

    run_target set private_cloud ip <value>
    run_target set private_cloud comport <value>

Once specified, perform a network connection test:

    plunifyrun_target test_connection private_cloud
    Successfully received response from InTime Server v1.1.0   

### Step 4.2. Verify FPGA Tools' Setup {#private_cloud_client_configuration_verify_toolchains}

Verify your toolchains in the InTime Client by going to *File* \>
*Settings* and then selecting *Vendor Toolchains*. Click on *Fetch
Global Configuration* to see the toolchains configured on your Server,
as shown in `Figure #figure-toolchains-not-fetched`.

 {#figure-toolchains-not-fetched}
![Registered Toolchains Within InTime
Client](images/configuration/global_config_toolchains_not_fetched.png)


`Fetch Global Configuration` pulls informations about the FPGA tools
that you configured in previous steps, as shown in
`Figure #figure-toolchains-fetched`{.interpreted-text role="num"}. This
figure shows many different FPGA tool versions configured in an example
setup. The specific FPGA tool configured in the example
`private_cloud_setup_global_configuration`{.interpreted-text role="ref"}
is highlighted.

 {#figure-toolchains-fetched}
![Configured Toolchains Appear After A Fetch
Operation](images/configuration/global_config_toolchains_fetched.png)


Make sure all the toolchains needed by the Client and build workers
(note that they are tagged using the *Global-config* tag in the first
column).

When running the InTime Client in commandline mode, the following Tcl
command can be used to fetch the toolchain configuration.

    plunifyvendors fetch_global_config
    Successfully fetched and applied global vendor configuration.   

To view the toolchains which have been fetched, use the following
command:

    plunifyvendors list
    To register new environments, use "vendors register <vendor_name<toolchain<install_path
    <license_file>".

    Registered Local Tools:
    altera
      quartusii
        11.0.0sp1
          Install path: D:/tools/Altera/Quartus/11.0sp1/quartus
          License path: 2100@intime.com
          Category    : Auto-detected
        13.0.0
          Install path: C:/tools/Altera/Quartus/13.0/quartus/
          License path: unconfigured
          Category    : Global-config

!!! tip
    It is possible for the user to register additional toolchains which are
only installed on specific machines where the InTime Client is running
along with the globally configured toolchains. In those cases, the build
workers will not be able to use those toolchains.


### Step 4.3. Verifying Private Cloud Setup on the Client {#private_cloud_client_actions_verify}

!!! tip
    If you skipped
`private_cloud_start_agents_dynamically`{.interpreted-text role="ref"},
continue to `private_cloud_client_submit-test-job`{.interpreted-text
role="ref"}.


Now that you have configured Agents to start dynamically as described in
`private_cloud_start_agents_dynamically`{.interpreted-text role="ref"},
use the InTime Client to test your configuration.

Open the settings dialog using *File* \*Settings* and then selecting
*Run Targets*. Under the *Private Cloud* tab click on *Test And
Configure*. All commands configured in the Server will be listed in the
sequence in which they will be executed, as shown in
`Figure #figure-configure-verify-client-actions`.

 {#figure-configure-verify-client-actions}
![Verify Configured
Commands](images/configuration/global_config_client_actions_fetched.png)


Click the *Details* button next to each command to view more information
about it.

### Step 4.4. Submit A Test Job {#private_cloud_client_submit-test-job}

Finally, submit a test job using the InTime example design to verify
that everything was set up correctly.

Open the example project using the *File* \*Open Example Project* \>
\<example for your FPGA tool\menu action. Once the example is open,
submit a test job using the following steps as shown in
`Figure #figure-private-cloud-submit-test-design`:

-   Update the flow configuration's properties to match the
    following:
>
        Run Target      : Private Cloud
        Runs Per Round  : 10
        Rounds          : 1
        Concurrent Runs : 2
>
-   Open the *Private Cloud Console* and type `.status` to verify that
    the needed agents are alive and free.
>
-   Make sure the *InTime Default* recipe is selected.
>
-   Finally, click on the *Optimize* button to submit the test job.
>
 {#figure-private-cloud-submit-test-design}
![Ready To Submit Test
Job](images/configuration/example_run_quartus.png)


Clicking the *Optimize* button triggers the following steps:

-   The current revision in the project will be implemented locally
    (referred to as the `parent revision`).
-   When the parent revision has completed, InTime will generate 10
    new strategies.
-   InTime will archive the design along with its generated
    strategies. The archive is sent to the Server which will queue
    workers and distribute the design to workers as needed.
-   After the job is submitted, InTime will prompt you asking if it
    should constantly poll the Server for results. If you click *Yes*,
    it will poll and wait for all results to be returned from the
    server.

Next, in the *Private Cloud Console* type `.status` again as shown in
`Figure #figure-private-cloud-submit-test-design-in-progress`. Notice that the build workers will start executing and the
project history indicates that progress is being made on the individual
strategies.

 {#figure-private-cloud-submit-test-design-in-progress}
![Test Job In
Progress\...](images/configuration/example_run_quartus1.png)


!!! tip
    When submitting a job, two Job IDs are created and used \-- the
`Local Job ID` is generated by the InTime Client on the machine from
which the builds are submitted. During submission the Server assigns a
`Remote Job ID` which is unique within the Private Cloud. The Client
shows both IDs in the project's job history, making it easy to track
down a job using either ID.


If all builds complete without errors, you should see the results as
shown in
`Figure #figure-private-cloud-submit-test-design-results`. If any build failed (indicated with an orange circle),
select the result and select the *Selected Results* tab to view the
errors.

 {#figure-private-cloud-submit-test-design-results}
![Expected Results Of Test
Job](images/configuration/example_run_quartus2.png)


If this test is successful, you are ready to build your designs to the
InTime Private Cloud. Please review the InTime Quick Start Guide to
familiarize yourself with the Client itself.
'