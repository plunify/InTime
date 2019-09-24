Tips and Tricks
===============

Different Ways To Launch InTime {#tips-and-tricks-launching-intime}
-------------------------------

 {#tips-and-tricks-application-modes}
**GUI mode**


The InTime installer creates desktop icons which can be used to launch
the InTime in GUI mode (This is the default mode).

 {#figure-tips-and-tricks-intime-shortcut}
![InTime
Shortcut](images/getting_started/intime_logo_circled_48.png)


**Tcl Console mode**

Tcl Console mode can be enabled using the \"-mode tcl\" commandline
argument. On Linux, the following arguments are also required:
\"-platform minimal\".

For example: :

    intime -mode tcl -platform minimal

**Batch Processing mode**

Batch processing mode can be enabled using the \"-mode batch\"
commandline argument. In this mode, InTime will run the script specified
via the \"-s\" and exit immediately afterwards with an exit code of 0 if
the script ran successfully, or with a non-zero exit code otherwise. On
Linux, the following arguments are also required: \"-platform minimal\".

For example: :

    ./intime.sh -mode batch -platform minimal -s "/home/user/script_to_run.tcl"

Different Ways To Launch InTime Agent
-------------------------------------

**GUI mode**

The InTime installer creates desktop icons which can be used to launch
the InTime Agent in GUI mode (This is the default mode).

 {#figure-tips-and-tricks-intime-agent-shortcut}
![InTime Agent
Shortcut](images/getting_started/intime_agent_logo_circled_48.png)


Depending on the operating system, the InTime Agent GUI will also
register itself in the system tray (Windows, Ubuntu).

**Background mode**

Background mode can be enabled using the \"-mode background\"
commandline argument and opens the Agent as a background process. On
Linux, the following arguments are also required: \"-platform minimal\".

For example: :

    ./intime_agent.sh -mode background -platform minimal

For more information on starting agents see
`private_cloud_start_agents`{.interpreted-text role="ref"}.

Launch InTime / Agent with command line arguments {#tips-and-tricks-running-from-command-line}
-------------------------------------------------

### InTime

InTime provides the following command line arguments: :

    # Print this help message
    -h
    # Print the version of InTime
    -v
    # Specifies a startup script to run
    -s <file_path>
    # Specifies the path to a vendor's project or InTime project file
    -project <file_path>
    # The preferred toolchain version to use for this session
    -vendor_toolchain_version <value>
    # The preferred bin/exe path of the vendor toolchain to use for this session
    -vendor_toolchain_binpath <value>
    # Specifies the default revision/run of the project to work on
    -revision <value>
    # Specifies the mode (Defaults to <gui>)
    -mode <tcl, gui, batch>
    # Specifies a custom target file to which session logging must be done
    -log <file_path>
    # Enables the non database flow where no new results are added to projects' runs databases
    -non_db
    # Specify username for the session
    -username
    # Specify the locale to use for this session (Defaults to system's locale)
    -locale
    # Specify messages to forward to stdout when running in tcl/batch modes (Defaults to <all>)
    -stdout <all, tcl>
    # Specifies the IP address of the server (Defaults to configured IP address)
    -ip
    # Specifies the comport to use for server communication (Defaults to configured comport)
    -comport

### InTime Agent

The InTime Agent provides the following command line arguments:

-   `-h`: Prints an usage help message.

-   `-v`: Prints the version of the agent.

-   `-nolog`: Indicates that the agent should create a session log file
    for this session.

-   `-username <username>`: Specifies username for the session. When not
    specified, the agent will automatically use the username of the
    current user.

-   `-mode <background,gui>`: Specifies the execution mode of the agent.
    The following options are supported (defaults to `gui`).

    > -   `background`: Execute in background mode without showing the
    >     agent's user interface. When using this mode, also add the
    >     following argument to avoid the loading of system display
    >     libraries into memory upon agent startup: `-platform minimal`.
    > -   `gui`: Execute in GUI mode, showing the agent's user
    >     interface.

-   `-locale <locale>`: Specifies the locale for which translations
    should be loaded.

-   `-ip <ip>`: Specifies the IP address of the server for this session.
    When not specified it defaults to the user configured IP address.

-   `-comport <port>`: Specifies the communications port to use for
    communication with the server for this session. When not specified
    it defaults to the user configured port.

-   `-no_agent_limit`: Specifies that multiple agents can run on the
    same machine. By default only one agent is allowed to run on a
    single machine. However in some environments it makes sense to allow
    multiple agents to run on the same machine. When specified, the
    agent's behaviour differs from the default behaviour in the
    following ways:

    > -   No agent lockfile mechanism is used.
    > -   The location of the agent log and configuration files are
    >     stored in an unique location per agent session:
    >     `~/.plunify/<usr>_<mac>_<pid>/` instead of the normally used
    >     `~/.plunify/<usr>_<mac>/` location.
    > -   A concurrent run limit of 1 is *always* used.

-   `-max_runs <count>`: Limits this agent to the specified number of
    runs. When the number of runs have been completed the agent will
    terminate itself. Note that the concurrent run limit of the agent is
    automatically adjusted to respect this limit. Note: When the current
    job is cancelled, the agent will also terminate itself when the
    limit has been reached during the job which is being cancelled.

-   `-remote_job <remote_job_id>`: Limits this agent to a specified
    remote job id. The InTime server will only assign jobs which are
    part of the specified ID to this agent. Note: When the current job
    is cancelled, the agent will terminate itself as it will not be able
    to accept any other jobs and therfore has no reason to stay alive.

These arguments make the agents very flexible and allows their behaviour
to adapt to many different environments. For more information on
starting agents see `private_cloud_start_agents`{.interpreted-text
role="ref"}.

Launch InTime from the FPGA Software {#tips-and-tricks-integration-with_vendor-toolchains}
------------------------------------

### Altera Quartus II

The InTime installers will automatically register a new task within
Quartus to allow the user to launch InTime. In the Quartus *Tasks*
panel, choose the *Plunify* item to get a list of InTime related tasks
as shown in
`Figure #figure-tips-and-tricks-launch-from-quartus`.

 {#figure-tips-and-tricks-launch-from-quartus}
![Launching InTime From Within Quartus
II](images/tips_and_tricks/launch_intime_from_quartus.png)


To avoid concurrency issues InTime will close the project which is
currently open inside Quartus before opening it. If no project is open
inside Quartus, InTime will launch without any open project.

\newpage

Managing Vendor Toolchains
--------------------------

### Setting Default Toolchains {#tips-and-tricks-settings-default-toolchains}

When multiple versions of the same toolchain are registered the default
version to use can be specified for each toolchain. Defaults are set
using the Tcl console, for example:

    # Set the default Quartus version to 13.0.0
    plunify> vendors set_default Altera QuartusII 13.0.0

To see which version is currently set as the default, use the
`vendors list` command and inspect the *User Defined Defaults* section.

    ...

    User Defined Defaults:
    Altera
        QuartusII: 13.0.0

    ...

If no default version is specified for a toolchain for which multiple
version are registered, InTime will use the first toolchain which was
registered. Also see
`tips-and-tricks-settings-default-toolchains-for-a-session-only`{.interpreted-text
role="ref"}.

#### Setting Default Toolchain For A Session Only {#tips-and-tricks-settings-default-toolchains-for-a-session-only}

It is possible to specify the default toolchain to use for a single
session without changing the permanent default version. This can be
achieved using the `-vendor_toolchain_version` and
`-vendor_toolchain_binpath` command line arguments of InTime. To see
which version is currently set as the session only default, use the
`vendors list` command and inspect the *Session Default* section.

    ...

    Session Default:
        -vendor_toolchain_version: 13.0.0

    ...

When using the `-vendor_toolchain_binpath` argument, the directory that
must be specified is one level deeper than the install path that was
used to register the toolchain. For example, if a Quartus II toolchain
was registered with an install path of
`D:/Tools/Altera/Quartus/11.0sp1/quartus`, the correct binpath to
specify is `D:/Tools/Altera/Quartus/11.0sp1/quartus/bin`.

For more details on supported command line arguments see
`tips-and-tricks-running-from-command-line`{.interpreted-text
role="ref"}. Also see
`tips-and-tricks-settings-default-toolchains`{.interpreted-text
role="ref"}.

\newpage

Hook Scripts {#advanced-concepts-flow_control-techniques-hook-scripts}
------------

### Overview

InTime supports customized recipe hook scripts. These allows user
specific .tcl scripts and commands to be executed when running existing
InTime recipes.

Two types of hook scripts exist:

-   **Recipe Initialization** `(initialize_recipe.tcl)`: This .tcl
    script is sourced before the recipe is started.
-   **Recipe Finalization** `(finalize_recipe.tcl)`: This .tcl script is
    sourced after the recipe completed. Note that the script is always
    sourced, even if the recipe failed or was stopped.

Hook script files are searched for in the following paths:

-   **Global**: Global hook scripts executed for all users located in
    `<user_home>/.plunify`.
-   **User Specific**: User specific hook scripts, only executed for the
    current user located in `<user_home>/.plunify/<username>_<mac>`.

The hook scripts have access to the full InTime tcl command set,
allowing them to be very flexible.

### Example: Send email notification when a recipe completes

To demonstrate the usefulness of these hook scripts, consider the
following example recipe finalization script in `finalize_recipe.tcl`
which sends an email notification when the recipe completes on an Linux
system for which `sendmail` was configured correctly.

    # The email header:
    set msg "From: intime@localhost"
    append msg \n "To: your_email@your_company.com"
    append msg \n "Subject: InTime Recipe Completed ([project info name])"

    # Add results of last recipe to the active result set:
    results clear
    results add job [flow get recipe_root_local_job_id] local -r

    # The email body:
    if {[info exists recipe_outcome]==1} {
        append msg \n\n "Your InTime recipe completed: $recipe_outcome."
    } else {
        append msg \n\n "Your InTime recipe completed."
    }
    append msg \n\n "[results summary]"

    # Send the email using sendmail:
    exec /usr/lib/sendmail -oi -t << $msg

\newpage

Working With Result Sets
------------------------

InTime analysis uses the concept of an *active results set*. This allows
the user to add any result from a project's history to the active
results set in order to be analyzed. The analysis takes only results
which are part of this active results set into account.

To add results to the active results set using the InTime GUI, simply
drag and drop results from the project history onto any of the analysis
graphs. When dropping a parent result InTime will ask if only the parent
result or the parent result as well as all results underneath it should
be added. Once added, the graphs will automatically update. To clear the
results set from the GUI, choose *Current Project* \> *Analysis* \>
*Clear Current Analysis*.

When running recipes in InTime, the recipes automatically clear the
results set and add the recipes' results to the active results set.
Therefore, after a recipe completes, switching to the *Results Analysis*
mode will show the analysis of the recipe.

For full control over the active results set the `results` Tcl command
can be used. For an overview of the `results` command, just type the
command without any arguments in the Tcl console.

Creating Custom Recipes {#advanced-concepts-custom-recipes}
-----------------------

InTime supports creation of custom recipes. More information can be
found on Plunify github.

1.  For Vivado, refer to the examples under:
    <https://github.com/plunify/InTime-Vivado>
2.  For Quartus, refer to the examples under:
    <https://github.com/plunify/InTime-Quartus>

A Tcl Reference Guide can also be found at
<https://support.plunify.com/en/doc/intime-doc/tcl-command-reference/>

For more information please get in contact at <help@plunify.com>.

Creating Custom Learning Models {#advanced-concepts-custom-strategy-algorithms}
-------------------------------

InTime supports creation of custom learning models. For more information
please get in contact at <help@plunify.com>.
'