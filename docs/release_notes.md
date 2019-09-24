Release Notes
=============



Please refer to the online documentation for [release
notes](http://support.plunify.com/en/intime-release-notes/) of current
and previous InTime releases.


 {.only}
html

Please refer to the online documentation for [release
notes](http://support.plunify.com/en/intime-release-notes/) of current
and previous InTime releases.

> v1.5.x Releases
> ---------------
>
> ### v1.5.11
>
> #### Changes & Improvements
>
> -   Fixed an issue in intimeclient.jar where connections to the InTime
>     Server were closed prematurely.
> -   Fixed a GUI problem where the hourglass cursor lingered after a
>     recipe was stopped.
> -   Added a feature to intimeserver.jar to use a properties.ini file
>     to set properties.
> -   Updated machine learning mechanisms in Windows environments.
> -   Replaced the eight\_bit\_uc example project with the Vivado
>     built-in BFT example.
>
> ### v1.5.10
>
> #### Changes & Improvements
>
> -   Fixed an issue in setting filter not able to reflect the correct
>     filter.
>
> ### v1.5.9
>
> #### Changes & Improvements
>
> -   Fixed an issue in export result.
> -   Fixed an issue when reopening example project and receipe is
>     defaulted to custom flow.
> -   Added a new feature to refresh result history.
> -   Added feature to print more information when agent not able to
>     start.

-   Added feature to disallow project with CPLD devices.

    > ### v1.5.8
    >
    > #### Changes & Improvements
    >
    > -   Fixed an issue in Maximum Runtime.
    >
    > ### v1.5.7
    >
    > #### Changes & Improvements
    >
    > -   Fixed Fmax issue for Vivado.
    > -   Fixed exported results have duplicate columns.
    > -   Added Strategies cancel feature in Private Cloud Console.
    >
    > ### v1.5.6
    >
    > #### Changes & Improvements
    >
    > -   Added new result column for Fmax.
    > -   Fixed an issue in Effort level exploratiion recipe for
    >     Arria 10.
    >
    > ### v1.5.5
    >
    > #### New Features
    >
    > -   Added Deep Dive machine learning recipe for ISE and Vivado
    >
    > #### Changes & Improvements
    >
    > -   Removed Public cloud from the list of run targets.
    > -   Removed Worst Slack from the Recipe goal in order to focus on
    >     TNS as the optimization target.
    > -   Added new result columns for all components of Worst Slack
    >     like Worst Setup, Worst Hold etc.
    > -   Fixed setting filters display not in right order.
    > -   Fixed an issue in Quartus toolchain where it does not detect
    >     the service pack correctly.
    >
    > ### v1.5.4
    >
    > Internal release.
    >
    > ### v1.5.3
    >
    > #### Changes & Improvements
    >
    > -   Implemented backup file detection for older ISE projects where
    >     source files were not detected correctly.
    > -   Added workaround for ISE project archival of Coregen files.
    > -   Fixed an issue in no toolchain found message in InTime Server.
    >
    > ### v1.5.2
    >
    > #### Changes & Improvements
    >
    > -   Implemented backup file detection for older ISE projects where
    >     ISE did not keep track of all source files.
    >
    > ### v1.5.1
    >
    > #### New Features
    >
    > -   User-controllable Post-placement Power Optimization and
    >     Post-route Physical Optimization settings.
    >
    > #### Changes & Improvements
    >
    > -   Fixed error where project files could not be found when
    >     opening ISE and Vivado example projects.
    >
    > ### v1.5.0
    >
    > #### New Features
    >
    > -   New \"Deep Dive\" recipe narrows down and focuses on
    >     known-good setting regions based on existing results, so that
    >     results can converge faster.
    > -   Added an automatic timeout (30 seconds) to the Upgrade IP
    >     dialog box (continues without upgrading by default).
    > -   Users can now double-click on any result to jump to its
    >     Selected Results tab, in order to view detailed results and
    >     errors (if any)..
    > -   If setting filters are already specified when a user starts a
    >     job, a confirmation request appears.
    > -   Added a feature to gather all relevant log files into a single
    >     archive so that users can access logs in one place.
    >
    > #### Changes & Improvements
    >
    > -   Displays date/time in yyyy-MM-dd HH:mm:ss format when showing
    >     results, regardless of system locale.
    > -   Fixed a bug that made it impossible to select and delete
    >     multiple results at the same time.
    > -   Fixed an issue in the Results Analysis -\> Design Analysis
    >     section where results are not refreshed in some cases.
    > -   Added more flexibility to Vivado recipes in terms of whitelist
    >     usage.
    >
    > v1.4.x Releases
    > ---------------
    >
    > ### v1.4.9
    >
    > #### Changes & Improvements
    >
    > -   Vivado 2016.2 updates.
    >
    > ### v1.4.8
    >
    > #### Changes & Improvements
    >
    > -   Fixed bug with archival and extraction of ISE projects where
    >     source files were not archived correctly by ISE.
    >
    > ### v1.4.7
    >
    > #### Changes & Improvements
    >
    > -   Regenerate IP targets appropriately for IP cores because
    >     Vivado does not archive all the required IP files.
    >
    > ### v1.4.6
    >
    > #### Changes & Improvements
    >
    > -   Vivado 2016.1 updates.
    > -   Quartus updates for project archival.
    >
    > ### v1.4.5
    >
    > #### Changes & Improvements
    >
    > -   Added support for Quartus 16.0.0.
    >
    > ### v1.4.4
    >
    > #### Changes & Improvements
    >
    > -   Added support for Quartus 15.1.1, 15.1.2.
    >
    > ### v1.4.3
    >
    > #### Changes & Improvements
    >
    > -   Changed the logging format in intimeserver.jar to
    >     significantly reduce the log size.
    > -   Added support for Vivado 2016.1.
    > -   Quartus enhancement: Show sorted failing paths in the Selected
    >     Results section of the GUI, when a result is selected.
    >
    > ### v1.4.2
    >
    > #### Changes & Improvements
    >
    > -   Optimized the Extra Optimization flow by not re-implementing
    >     if there were no changes in a design checkpoint's settings.
    > -   Fixed a bug in the Extra Optimization settings whereby
    >     combination of settings did not use the latest design
    >     checkpoint as a starting point.
    >
    > ### v1.4.1
    >
    > #### Changes & Improvements
    >
    > -   Fixed bug in the Private Cloud where SOF files were not
    >     returned properly to the user's local directories.
    >
    > ### v1.4.0
    >
    > #### New Features
    >
    > -   Added support for Vivado 2015.4.2.
    >
    > #### Changes & Improvements
    >
    > -   Fixed bug in the InTime server where under certain conditions,
    >     agents launched by LSF were not terminated.
    > -   Individual Extra Optimization recipes (PPO, POD, PLU1) have
    >     been integrated into a single Extra Opt Exploration recipe.
    > -   Users can use the new InTime Defaults Extra recipe to
    >     automatically run extra optimizations on the best result.

v1.3.x Releases
---------------

> ### v1.3.6
>
> #### New Features
>
> -   Added support for Vivado 2015.4.1.
>
> ### v1.3.5
>
> #### Changes & Improvements
>
> -   Fixed bug in the Private Cloud strategy timeout mechanism.
>
> ### v1.3.4
>
> #### New Features
>
> -   Added support per strategy timeout in Private Cloud mode.
> -   Added support for schematic-based projects in ISE.
>
> #### Changes & Improvements
>
> -   Fixed bug in the generation of power reports in ISE
> -   Implemented workaround for an IP regeneration bug in Vivado 2014.2
>
> ### v1.3.3
>
> #### New Features
>
> -   Added support for Quartus v15.0.1, v15.0.2 and v15.1.0.
> -   Added support for Vivado 2015.3 and 2015.4.
> -   Added Vivado strategies and recipes for timing and area closure
>     \-- \"Extra Optimization\"
> -   Added \"Ignore DRC Errors\" switch to disable INBB-*, MDRV-* DRC
>     errors at customers' requests, in order to work around
>     implementation errors.
> -   Added -stop switch to gracefully terminate the InTime Server.
> -   Added support for TCL.PRE and TCL.POST options so that users can
>     carry forward their custom commands onto InTime generated
>     strategies.
> -   Added extra way of detecting the user's home directory in
>     UNIX/Linux environments to support older Linux distributions.
> -   Added Export to PDF feature for Results Analysis graphs and
>     charts.
> -   Added retry mechanism and error detection string in InTime Server.

#### Changes & Improvements

> -   Enhanced automatic clean-up after each compilation run in Private
>     Cloud mode, so that intermediate files will not take up excessive
>     disk space.
> -   Fixed bug where MAX\_BRAM and MAX\_DSP settings generation
>     resulted in invalid setting value warnings.
> -   Speeded up result extraction process when determining the current
>     results of your design.
> -   Improved scheduling algorithm when distributing compilation runs
>     to different server machines to prevent jobs from being starved of
>     attention.
> -   Changed Recipe Categories and Names to make their usage more
>     intuitive.
> -   Improved messages reported by the Extra Optimization Recipes to
>     make the start and end of each round easier to comprehend.
> -   Use virtual drive mapping in Windows environments to work around
>     Vivado's path length limitation
>     (<http://www.xilinx.com/support/answers/52787.html>).
> -   Fixed instances where duplicate settings were generated in new
>     strategies.
> -   Speeded up the process of applying strategies so that the wait
>     time for strategy generation is reduced.
> -   Handle missing clock skew values for a post-synthesis and
>     pre-implementation design.
> -   Set strategy option to Default for all new strategies to ensure
>     that options are set to known values.
> -   Fixed bug where overfitted utilization percentages were not
>     reported correctly.
> -   In Tcl Console mode, the \<Down\> arrow now clears the prompt.

### v1.3.2

#### New Features

-   

    Added support for Quartus v14.1.1, v15.0.0.

    :   -   Added support for Vivado 2015.1.
        -   Initial Vivado support is out, starting from Vivado version
            2014.2
        -   Added new panel in the Analysis section to display logic
            delay vs routing delay ratios.
        -   Added command shortcuts in the Private Cloud Console to make
            it easier to perform common, repetitive queries and tasks.
        -   Added support for Japanese keyboards.
        -   Added a new \"Tag\" property to a build result and display
            it in the project history. This allows user to enter a
            custom string as a tag for the each strategies.
        -   Added context menu option in the project history pane,
            \"Remote Job Download\" \> \"Download and Overwrite
            Results\"
        -   Added .server.properties.set command for the InTime Server
            for users to specify the license file.
        -   Added capability for the user to place a \<Custom
            Strategy\>.strategy file containing custom strategies in the
            project directory. These customized strategies are then used
            when the Custom Flow recipe is executed.

#### Changes & Improvements

> -   This release adds more unit tests across the board.
> -   The Export Results to CSV option now exports errors for strategies
>     which failed or had incomplete results, as well as resource
>     utilization details.
> -   Added support for ASTEC-X X client software.
> -   Added Copy and Paste context menu options in the Tcl and Private
>     Cloud Consoles.

#### Tcl Changes

-   New commands:

    > -   
    >
    >     `project info toolchain_version`
    >
    >     :   -   `flow recipe is_user_defined <recipe_tcl_alias>`
    >         -   `flow recipe is_experimental <recipe_tcl_alias>`
    >         -   `strategy tag set <tag_value>`
    >         -   `strategy tag remove`
    >
-   Improved commands:

    > -   
    >
    >     `flow run_recipe` will now return the correct return code if the recipe fails.
    >
    >     :   -   `flow recipes list` is now `flow recipes`
    >         -   `flow recipes is_supported` is now
    >             `flow recipe is_supported`
    >         -   `flow recipes is_user_recipe` is now
    >             `flow recipe is_user_recipe`
    >         -   `flow recipes is_exeprimental` is now
    >             `flow recipe is_exeprimental`
    >         -   `flow recipe_errors` is now `flow recipe errors`
    >         -   `flow was_stopped` is now `flow recipe stopped`
    >         -   `flow get was_stopped` has been deprecated.
    >         -   `flow was_stopped` has been deprecated.
    >         -   Optional argument -toolchain\_version
    >             \<toolchain\_version\> added to
    >             `project extract <archive> <destination directory>`
    >             command.
    >         -   Optional argument -overwrite added to
    >             `results download <job_id> <run_target> -wait command-toolchain_version <toolchain_version>`
    >             command.
    >
#### Resolved Issues

-   Fixed issue where the database worker thread wasn't terminating
    properly when connecting to a different database.
-   

    Fixed issue in the vendor config page where some vendor modification Tcl commands were executed twice in a row when the user edited paths and changes were not saved.

    :   -   Fixed bug in plots where results which did made timing was
            showed as positive values instead of 0.

### v1.3.1

#### New Features

-   This release introduces a new timing closure goal in InTime which
    focuses on the Worst Case Slack of the design, in addition to the
    previous goal which focused on the Total Negative Slack.
-   InTime's now supports the use of a free standing InTime licensing
    server (without private cloud capabilities). In cases where private
    cloud capabilities is required, it is now also possible to use
    separate licensing and private cloud servers.
-   Added support for doing Quartus timing analysis with different speed
    and temperature grades compared to the device used for map and fit.
    This method allows using a slower speed grade than the actual device
    used in hardware for the map and fit stages, causing these
    algorithms to work harder at timing closure. Timing analysis is
    however still being done using the speed and temperature grades of
    the device used in hardware.
-   Added support for Quartus v14.0.1 and v14.0.2.
-   It is now possible to specify a custom user recipe's path where
    user recipes can be placed. This path can be configured in the
    InTime settings dialog or using the new
    `misc set_path user_recipes <path>` Tcl command. By default the
    custom recipes path is defined as `<home>/plunify/recipes`.
-   Added a new `-tclargs` command line argument which can be used to
    forward arguments to scripts ran with the `-s` command line
    argument.
-   Added a new `-custom_logs_path` command line argument which can be
    used to specify a custom path where InTime and InTime Agent will
    place all generated log files.
-   Added a new *Routing Effort Level Exploration* recipe for supported
    Quartus devices.

#### Changes & Improvements

-   When using a common user runs database (-custom\_runs\_db argument)
    and opening the design between different machines, InTime will now
    properly migrate results to the new session from previous sessions.
    This includes the flow configuration which was used in the previous
    session.
-   Changed SEED range in Quartus from 1,2,..,100 to 1,2,..,200 plus
    200,300,..,1000.
-   The *Existing Results* parent revision property can now be used
    along with custom parent revisions.
-   Improved toolchain auto detection. No longer attempt to register
    toolchains if they are already registered removing the error
    messages in the log.
-   InTime will now detect custom license files specified within the
    Quartus GUI when registering such Quartus installations.
-   Numerous improvements to the exporting of results to .csv files.
-   Validation of license file in vendors settings page now takes care
    or license file entries with multiple entries. Also, it is now
    possible to register and update vendor toolchain entries with
    license file paths containing multiple licenses. To do this, use a
    comma separator in the respective Tcl commands.
-   Workers now only use toolchains registered as part of the global
    toolchain configuration.
-   PDF versions of the InTime documentation and guides are now
    available in the `/docs` directory of the InTime installation.

#### Tcl Changes

-   New commands:

    > -   `results add single <strategy_name> <job_id>`
    > -   `project info remote_to_local_job_id <job_id>`
    > -   `project info local_to_remote_job_id <job_id>`
    > -   `misc find_path <user_recipes,runs_db>`
    > -   `misc set_path <user_recipes> <path>`
    > -   `project setting_filters save_template <file_path>`
    > -   `project setting_filters apply_template <file_path>`
    > -   `project setting_filters load_template <file_path>`
    > -   `strategy results -field <Field Name>`
    > -   `strategy settings -all`
    > -   `strategy settings -non_default`
    > -   `strategy settings -default`
    > -   `strategy settings -list_default`
    > -   `strategy settings -value <Setting Name::Step>`
    > -   `strategy settings -default_value <Setting Name::Step>`
    > -   `strategy settings -possible_values <Setting Name::Step>`
    > -   `flow get remote_job_id`
    > -   `vendors unregister -all`
    > -   `misc config get <user/global>`

-   Improved commands:

    > -   `flow recipes list` will now report the tcl alias names,
    >     instead of the file names of the recipes.
    > -   `flow run_recipe <name>` now accepts the tcl alias instead of
    >     the recipe's file name.

#### Resolved Issues

-   Fixed issues where error messages for failing strategies that were
    run on remote targets did not show correctly back at the source.
-   Fixed issues where recipes which are limited to specific device
    families were not filtered correctly for some families.
-   Fixed issues where the InTime GUI was did not indicate that InTime
    was busy while it was launching and initializing.
-   Fixed issue where selection in plots was not always sync'ed back to
    the project history.
-   Fixed issues with project history when the runs database becomes
    very big.
-   Fixed issue with the `flow run_recipe` Tcl command not working in
    scripts run using the `-s` command line argument.
-   Added a workaround to Quartus archiver not correctly archiving
    `.hex` files.
-   Fixed issue with duplicate strategy detection: Strategies which
    failed will now also be considered as duplicates.
-   Fixed issue with where \"Jobs\" condition in the training data
    filter were not handled correctly in some scenarios.
-   Fixed issues with *Implement Base Revision Only* recipe not working
    correctly when trying to run the base revision on a remote target.
-   Fixed Perl installation issues some users experienced on Windows.
-   Fixed numerous issues with log verbosity used by agents.
-   Fixed refreshing issues in plots, resulting in overlaying plots in
    some scenarios.
-   Fixed issue where maximum job runtime was not always respected by
    agents.
-   Fixed issue where parent revision with remote target's settings are
    not imported.
-   Fixed issue where training data filter was not initialized correctly
    for new projects.
-   Fixed bug where last selected recipe was not saved for a project
    when InTime was closed while a project was opened.

### v1.3.0

#### New Features

-   This version introduces support for LSF based environments, allowing
    agents to be started dynamically as required.
-   Support for multicast detection of InTime server was added.
-   Support for automatic keyboard layout adjustments for different
    remote desktop clients was added.
-   Added support for Quartus II v14.1.

#### Changes & Improvements

-   Added new `-no_global_config` argument to InTime. When specified the
    global configuration's server and client parameters will not be
    fetched on startup.
-   Improved handling of scenarios where an user opens the same project
    from a different machine. InTime will now give the option to migrate
    previous results to the new machine.
-   Added new button to InTime Agent's window to open session log.
-   Updated Chinese (zh\_CN) translation.
-   Big documentation overhaul.

#### Tcl Changes

-   New commands:

    > -   `results count_duplicates <job_id>`

-   Improved commands:

    > -   Extended \"results summary\" command with new \<type\> filter
    >     which can be used to filter based on result types
    >     (parent,leaf,root,all).
    > -   Extended \"misc find\_path\" command with new \"runs\_db\"
    >     option to find path of runs database used for current session.

#### Resolved Issues

-   Fixed issue where license file editing did not work for existing
    toolchains in the *Vendor Toolchains* settings page.
-   Fixed results sorting issues in project history. Best results used
    as parents for subsequent jobs will now displayed in the correct
    place in the history tree.
-   Fixed issues where InTime did not clean up all temporary files it
    created.
-   Fixed confusing description for *Seeded Effort Level Exploration
    Recipe*.
-   Fixed numerous concurrency issues on settings files in some
    environments.
-   Fixed regression where *Synthesis Exploration Recipe* explored
    `SEED` property instead of `SYNTHESIS_SEED` property.
-   Fixed issues where the *Change* column was not populated for remote
    jobs where the parent was also run on the remote target.
-   Fixed issue where worker details were not shown for parent revisions
    ran locally.
-   Fixed issue where *InTime Default Recipe* continued to the next
    round even if all strategies in the current job failed.
-   Fixed issue with default line wrapping in the InTime GUI's session
    log display.

v1.2.x Releases
---------------

### v1.2.3

#### New Features

-   Added support for Quartus v14.0.1 and v14.0.2.
-   Added support to spawn private cloud workers during remote job
    submission. This allows integration of the private cloud run target
    into existing LSF environments.

#### Changes & Improvements

-   The session log window can now be frozen (thus it won't
    automatically scroll to the latest message).
-   The line wrapping of the session log window can now be controlled.
-   If a previously valid license has become invalid, the manage
    licenses dialog will now allow to reset it.
-   New dialog will notify users when no valid license has been found
    after InTime starts up.
-   Default revision in QuartusII example project now uses Cyclone IV
    device. For versions of Quartus which does not support this device,
    the *Current Project* \> *Change Default Revision* action can be
    used to switch back to the Cyclone III device revision.

#### Resolved Issues

-   Fixed keyboard layout issues when using InTime through TightVnc
    remote access.
-   Fixed critical issue with machine learning introduced in v1.2.0.
-   Fixed issue where wrong next round parents were selected in *InTime
    Default* recipe in some cases.
-   Fixed issue where recipe details widget progress was lost at the end
    of a recipe.
-   Fixed issue where *Finalize Job* flow step showed that it failed
    when a job was stopped.
-   Fixed issue where jobs that ran more than 24 hours were not
    displayed correctly.
-   Fixed issue with the return value of the *flow run* tcl command.
-   Fixed crash when changing custom parent revision job in the GUI.
-   Fixed numerous issues with parent revision property introduced by
    new project specific flow configurations in v1.2.2.
-   Fixed issue where private cloud workers would fail to archive
    results for some revisions in specific cases.

### v1.2.2

#### New Features

-   The QuartusII backend now uses the more familiar TNS timing
    performance indicator by default, instead of InTime's Timing Score
    indicator. Users who prefer to use Timing Score can revert from the
    new QuartusII settings dialog.

#### Changes & Improvements

-   When submitting a Plunify Cloud job, the user is notified that the
    design will be submitted to AWS and given the option to switch the
    run target if that was not the intention.
-   InTime Agent: Improved handling of cases where any of the startup
    states fails (network test, verify license, test file transfer).
-   Improved the `job summary` command. It now provides statistics etc.
    for the job as well.
-   Much improved InTime settings dialog, especially the Vendor
    Toolchains page.
-   InTime will now warn the user when using a toolchain version for
    which no license was specified. This can be turned off in the new
    general settings page.

#### Resolved Issues

-   Fixed current task's text being clipped in recipe details widget.
-   Fixed concurrency issue between private cloud workers.
-   Fixed issue where some design information was not correctly
    extracted in specific scenarios.
-   Private cloud workers will no longer attempt to do first results
    extraction round as we know there won't be any results to extract.

### v1.2.1

#### Changes & Improvements

-   Project opening improvements:

    > -   The project is now added to recent list of projects even if it
    >     fails to open.
    > -   It is now possible to cancel opening of projects while they
    >     are busy being opened.
    > -   A message box asking if the existing project must be closed
    >     before opening a new project is no longer shown. In tcl mode
    >     however, \"project open\" fails until \"project close\" was
    >     called first.

-   Custom parent revision improvements:

    > -   Custom parent revisions are now indicated using a star icon.
    > -   A new action in the project history's toolbar allows
    >     selecting the custom parent revision in the project history
    >     (only when set).
    > -   A new \"Unset Custom Parent Revision\" action was added to the
    >     project history's context menu.

-   Improved setting filters widget:

    > -   Setting filter verification is now performed everytime the
    >     filters are modified, giving immediate feedback if change
    >     results in an invalid filter combination.
    > -   Setting filter verification warns about more possible invalid
    >     configurations.
    > -   Multi-column sort is now used.

-   Flow configuration improvements:

    > -   Flow configurations are now project dependent.
    > -   Added new [-custom\_flow\_config]{.title-ref} InTime command
    >     line argument which can be used to specify a custom flow
    >     configuration file to be used instead of the new project
    >     dependent configurations.

-   Improved opening of example project by giving the option to open the
    existing example if it was previously extracted.

-   Added new tcl only flow property called `remote_job_polling_policy`
    which provides control over polling operation after a remote job was
    distributed.

-   Renamed \"Generated Programming Files\" flow configuration property
    to \"Create Bitstreams\".

-   The parent revision's \"Missing Results\" property is now only
    available through the Tcl console.

-   Added new [-no\_global\_toolchains]{.title-ref} InTime command line
    argument which can be used in a Private Cloud environment. When
    used, the client won't fetch and apply toolchains specified by the
    global server configuration.

#### Tcl Changes

-   New commands:

    > -   `strategy set_active`
    > -   `strategy set_no_active`
    > -   `strategy settings <-list_all,-list_non_default,-count>`
    > -   `strategy results <-brief,-verbose,-errors>`
    > -   `strategy export target_file <-results_csv,-summary_xml>`
    > -   `flow active_config_file`
    > -   `job summary <job_id>`
    > -   `log`
    > -   `logError`
    > -   `logWarning`

-   Deprecated commands:

    > -   All flow configuration restore point commands are no longer
    >     available.

#### Resolved Issues

-   Fixed issue where flow configuration and project's setting filters
    were not restored correctly when the InTime process was killed while
    a recipe was running.
-   Fixed issue where results export csv file's headers and columns
    were misaligned.
-   Fixed issue where worker details for local runs did not include any
    tool versions.
-   Fixed bug in goal analysis plot where it added wrong reference
    result horizontal and vertical lines on the plot if the benchmark
    result did not have results for the selected goals.
-   Fixed issue with seeded effort level exploration recipe where it did
    not stop correctly while busy with seed exploration rounds.
-   Fixed incorrect sorting in project history for numbers with
    different number of decimal points.
-   Fixed issues with `flow toolchain_steps` tcl command and
    sub-commands.
-   Handle cases where the .intime project file does not exist / was
    removed better.
-   Fixed console still showing on Windows when no -mode is specified.
-   Fixed remote job ID shown as local job id in table view project
    history mode.
-   Fixed issue where learning did not work correctly for private cloud
    jobs.
-   Fixed issues where some design information was not correctly
    extracted in some cases.
-   Fixed issue where \"Jump To Next/Previous Job\" actions were always
    disabled in the project history's toolbar.
-   Fixed issue where \"Finalize Job\" flow step were not run when a
    recipe was stopped.
-   Fixed issue default values of \"Concurrent Runs\" and \"Goal Based
    Target\" flow configuration properties were not correctly restored
    when restoring the default flow configuration.
-   Fixed issue in flow configuration where default concurrent run limit
    was set to max instead of 1 for local run target.
-   Fixed issues with detection and usage of global server
    configurations.

### v1.2

#### New Features

-   Added a new
    `recipes-seeded-effort-level-exploration`{.interpreted-text
    role="ref"} recipe which combines techniques used in the
    `recipes-effort-level-exploration`{.interpreted-text role="ref"} and
    `recipes-placement-seed-exploration`{.interpreted-text role="ref"}
    recipes.

-   The private cloud run target now uses a much improved queuing
    mechanism where strategies in a job are handed out one-by-one,
    instead of splitting the job between workers at the start of the
    job. This results in an infrastructure in which network problem has
    much less of an effect on the number of affected strategies.

-   A number of new features were added to make finding strategies/jobs
    in the project history easier:

    > -   Associated job ids are now displayed in the headers of recipe
    >     rounds in the recipe overview widget.
    > -   The best result indication now also shows details about the
    >     best result in the current selection tree.
    > -   Multi-column sorting is now supported.
    > -   A new toolbar next to the project history makes it easier to
    >     navigate the project history, including actions such as:
    >     Switching between flat and tree view representation of the
    >     history, jump to next/previous job, jump to busy runs,
    >     expand/collapse all etc.

#### Changes & Improvements

-   Added help button to \"Private Cloud Console\" tab which will open a
    new section of documentation devoted to private cloud
    administration.
-   Improved InTime client's detection and usage of global server
    configurations.
-   Added a new `runRecipe` tcl command which can be used to run recipes
    using the Tcl interface. This function will provide more detailed
    output compared to `flow run_recipe`.
-   Private cloud workers can now be terminated remotely from the server
    admin console.
-   Many smaller changes and polishing touches.

#### Tcl Changes

-   New commands:

    > -   `project info last_job_id`
    > -   `project info all_job_ids`
    > -   `project info first_job_id`
    > -   `project info next_job_id <ref_job_id>`
    > -   `project info previous_job_id <ref_job_id>`
    > -   `misc exec <R,perl> /home/user/my_script -args -arg1 arg1_value -arg2`
    > -   `misc find_path <scripts,recipes,intime_log,intime_agent_log,user_home,dot_plunify,dot_plunify_user,session_tmp_dir,project_dir>`
    > -   `flow recipes is_supported <recipe_name>`

-   Improved commands:

    > -   `vendors fetch_global_config` has a new -force argument to
    >     force an update even if the configuration on the server did
    >     not change.
    > -   `recipes list` has new \<supported,all\> arguments. In
    >     addition it now only lists supported recipes by the open
    >     project (if any).
    > -   `results add last_job` now perform consistantly for all jobs.
    >     In addition it can now be used even after a project was closed
    >     and reopened.

-   Deprecated commands:

    > -   `results add flow <flow_id>`

#### Resolved Issues

-   Fixed issue where Altera Quartus archive correction changed the
    order of sourced files in some scenarios.
-   Fixed issues with Quartus projects using custom
    PROJECT\_OUTPUT\_DIRECTORY assigments.
-   Fixed numerous issues with `-ip` and `-comport` arugments for both
    the client and the agent.
-   Fixed issue where additive settings scope did not work for custom
    strategies.
-   Fixed issue where learning did not work for very big project
    histories.
-   Fixed issue where `control_reuse_synthesis_results` property was
    disabled in effort level recipes.
-   Fixed problem where errors were listed in reverse order for workers
    that failed.

v1.1.x Releases
---------------

### v1.1.10

#### New Features

-   Added a new flow configuration property to control if evaluation IP
    should be allowed in the design.
-   InTime now provides a new popup containing details about the Quartus
    project revision used to base its strategies on. In addition, it is
    possible to change this revision from within InTime while a project
    is opened.

#### Changes & Improvements

-   It is now possible to enter `double` values in the \"Goal Based
    Target\" property editor in the GUI.
-   InTime now checks the Quartus toolchain version used to open the
    project against the previous version used to open the project. If
    its different, it will provide a warning and give appropriate
    options to the user.
-   Session specific override arguments for private cloud configuration
    were added to InTime, namely: `-ip` and `-comport`.
-   Improved behaviour of action to reopen project with a different
    toolchain version.
-   Detailed worker machine information is now available under the
    \"Selected Results\" tab for both local and private cloud
    strategies.
-   The InTime Agent GUI was improved. It will now show details of
    background operations it is doing (heartbeats etc.).
-   Improved the way InTime determines which toolchain version to use
    when opening projects. The prompt to choose the version to use will
    be displayed in fewer cases.
-   Warning about more possible \"no effect\" entries during setting
    filter verification.
-   InTime now tags the settings it adds to .qsf files.

#### Tcl Changes

-   New commands:

    > -   `run_target set private_cloud ip <value>`
    > -   `run_target set private_cloud comport <value>`

-   Improved commands:

    > -   `project open_last` will now use the toolchain version from
    >     the previous time the project was opened to open the project.
    > -   `project <open,open_dir> <file>` has a new
    >     `-toolchain_version` parameter which can be used to specify
    >     the toolchain version that must be used to open the project.

#### Resolved Issues

-   Fixed regression introduced in v1.1.9 where the selected results tab
    did not show errors for failed strategies anymore.
-   Fixed issue where prediction models were not run in some scenarios.
-   Fixed issue where Quartus parent revision settings were not imported
    correctly.
-   Fixed issue where strategies were not marked as being stopped
    properly when the remote download was stopped while the java
    downloader was busy.
-   Fixed issue where the InTime command window on Windows was hidden in
    `-tcl` and `-batch` modes.
-   Fixed some issues with setting filtering after a project was opened.

### v1.1.9

#### New Features

-   Added new \"Existing Results\" and \"Missing Results\" flow
    configuration properties to allow more control over how existing and
    missing results for the initial compilation must be handled.
-   Added support for Altera Quartus v13.1.3 and v13.1.4.

#### Changes & Improvements

-   InTime optimizations all around, resulting in a much smoother and
    faster user experience.
-   

    Improvements to reported runtime for strategies:

    :   -   The runtime is now updated in the project history while the
            strategies are running, giving an indication of the elapsed
            time. Previously the total runtime was only shown after
            strategies completed and were successful.
        -   The runtime is more accurate now, showing the total runtime
            InTime took to run the strategy, instead of just the runtime
            of the strategy in the vendor toolchain.

-   When the full project history is cleaned and \"Remove Everywhere\"
    is selected, the `<job_dir>/plunify.jobs` directory is also removed.
    However, a new prompt confirms the action.
-   Renamed \"Generic Flow\" recipe to \"Custom Flow\".

#### Tcl Changes

-   New commands:

    > -   `results remove <job_id>`
    > -   `project info device`
    > -   `project info device family`
    > -   `project info device part`
    > -   `project info device speed`
    > -   `project info device package`
    > -   `project info revisions`
    > -   `flow toolchain_steps list <match_expr>`
    > -   `flow toolchain_steps toggle <step_name> <enable,disable>`
    > -   `flow toolchain_steps is_custom_supported`
    > -   `flow toolchain_steps set_custom <custom_step_name>`
    > -   `flow toolchain_steps get_custom`
    > -   `flow toolchain_steps set_custom_args <custom_step_args>`
    > -   `flow toolchain_steps get_custom_args`
    > -   `flow toolchain_steps clear_custom`
    > -   `flow toolchain_steps clear_custom_args`

-   Improved commands:

    > -   `project settings_filters <list> add -step <step_name>` will
    >     now add all settings associated with the specified step.

-   Deprecated commands:

    > -   `results clear` was replaced by `results remove all`

#### Resolved Issues

-   Fixed issue where InTime could hang when stopping a local job during
    the preparation stages of strategies.
-   Fixed issue where the InTime flow did not always stop when parent
    revision analysis did not produce any results.
-   Fixed issue where Quartus setting defaults were not initialized
    correctly on Linux.
-   Fixed issue where stopping the polling operation of a remote job was
    reported as an error.
-   Fixed issue where cleaning on private cloud workers did not respect
    the \"Goal based target\" set for the job at the source client.
-   Fixed issue where \"No\" button was not working in prompt asking if
    you want to wait for a remote job to finish.
-   Fixed issue where the crash reporter did not restore the InTime
    session correctly on some Linux distributions.
-   Fixed issue where InTime could clean up wrong .sdc files for some
    Quartus revisions.
-   Fixed issue where private cloud workers did not send some heartbeats
    in some situations.
-   Fixed issue where license file path for vendor toolchains was not
    always looked up correctly on private cloud workers.
-   Fixed regression introduced in v1.1.8 where Quartus archive
    extraction correction was not applied correctly anymore.
-   Fixed regression introduced in v1.1.8 where it was no longer
    possible to change a vendor toolchain's license file path in the
    InTime settings page when using a private cloud global
    configuration.

### v1.1.8

#### New Features

-   It is now possible to rerun existing strategies using the new
    `recipes-rerun-strategies`{.interpreted-text role="ref"} recipe.

-   Introduced new [Rounds]{.title-ref} flow configuration property
    which controls the number of rounds a recipe should run.

-   Numerous new features and improvements for the private cloud run
    target:

    > -   Details of the worker running each strategy is now displayed
    >     in the \"Selected Results\" tab at the source.
    > -   The project history now gives a clear picture of what is
    >     happening with each strategy in the private cloud (up to the
    >     level of displaying the current implementation step for
    >     running strategies).
    > -   It is now possible to specify a global private cloud
    >     configuration (including server parameters, worker parameters
    >     and toolchains on a shared map drive) on the server and all
    >     workers will automatically use this shared configuration. This
    >     greatly simplified initial configuration of the private cloud.

#### Changes & Improvements

-   The CSV file generated by results exporting now also includes the
    strategy's settings used to get the result.
-   Recipes will now be filtered and customized based on support for the
    current project's toolchain version and device family.
-   When recipes block/control flow configuration properties, the value
    displayed when the recipe is selected will reflect the value that
    will be used by the recipe.

#### Tcl Changes

-   New commands:

    > -   `flow rerun`
    > -   `flow_steps prepare_rerun_strategies`
    > -   `results add project_history`
    > -   `results add training_data`
    > -   `results add all`
    > -   `results export <filename>`
    > -   `vendors fetch_global_config`

#### Resolved Issues

-   Fixed issue where the \"met\_goal\" clean state was not respected on
    private cloud workers.
-   Fixed numerous issues with the Private Cloud Console which was
    introduced in v1.1.7.
-   Fixed issue where stopping during training data preparation did not
    abort the flow immediately.
-   Fixed issue where right click context menu in the project history
    was outdated in some cases.

### v1.1.7

#### New Features

-   Added support for Altera Quartus v13.1.2 and v14.0.

-   Added a new Private Cloud Console tab inside InTime to allow
    management of private cloud jobs directly from within InTime.

-   Added new ways to use InTime strategies in your projects:

    > -   Export strategy to Tcl script to be sourced at a later time.
    > -   Export strategy to a new revision in the current project.
    > -   Export strategy to an existing revision in the current
    >     project.

-   Much improved project setting filter management:

    > -   Added a new Setting Filters widget allowing easy configuration
    >     and validation of a project's setting filters. Access it
    >     under *Current Project* -\> *Setting Filters*.
    > -   Added the ability to create and re-use setting filter
    >     templates.
    > -   Added the ability to create synthesis and routing specific
    >     setting filter templates based on previously run strategies.

-   It is now easy to find the best result in the project history with
    details about the best result in a project being displayed just
    above the project history.

-   Added a new `recipes-effort-level-exploration`{.interpreted-text
    role="ref"} recipe which can be used when educated and seed recipes
    produce a result which is close to meeting the design goal, but not
    meeting the goal.

-   Big number of improvements and new features in InTime Private Cloud
    configurations, including support for Sun Grid Engine.

#### Changes & Improvements

-   Cleaning of generated files for different run states can now be
    controlled through new GUI flow configuration properties.
-   Improved selection mechanism to allow selection of points in design
    analysis graphs.
-   When exporting strategies to CSV files, an additional column
    containing the default value of each setting was added.
-   Added a new script which allows users to access the Private Cloud
    administration console in user mode was added.
-   Simplified outlier management in the Multiple Job Analysis plot.
    There are now just two options, *Show Outliers* and *Hide Outliers*.
-   When re-opening the example design, you will now be prompted to ask
    if the existing example must be overwritten.
-   Improved use of settings in educated recipes for Quartus backend.
-   The default training data results limit was increased from 100 to
    300 and can be customized if required.
-   Numerous improvements to cleaning of files generated by InTime.
-   Details about single results selected in the goal comparison plot
    will now be displayed at the top of the plot.
-   Added automatic file transfer verification for private cloud
    deployments when the InTime Agent starts up. The file transfer test
    is now also performed when verifying the private cloud configuration
    in the Private Cloud setting dialog.
-   The maximum strategy runtime behaviour in the private cloud run
    target now matches the behaviour for local run targets.
-   Duplicate strategy detection now gives information of which result
    the new strategy is a duplicate of.
-   Changed default maximum strategy run time from 24 to 12.
-   InTime now stores all data required to learn from past jobs in the
    user's runs database instead of depending on specific report files
    to remain on disk.
-   Renamed `base_revision_run_target` property to
    `initial_compilation`. Also, renamed the `none` option of this
    property to `skip`.

#### Tcl Changes

-   Improved Tcl integration:

    > -   In the Tcl application mode the command history is now saved
    >     between sessions.
    > -   In both the Tcl and GUI application modes the Tab key can now
    >     be used to auto-complete InTime and Tcl commands.

-   New commands:

    > -   `flow get default_revision_name`
    > -   `project setting_filters verify`

-   Improved commands:

    > -   `project settings_filters <list> clear` got additional
    >     parameter to allow clearing subsets of settings in the filter.

#### Resolved Issues

-   Fixed numerous issues with the synthesis reuse flow for Altera
    Quartus.

-   Fixed issue where interconnect results were not available for Altera
    Stratix V devices.

-   Fixed issue where flow configuration validation allowed synthesis
    reuse to be used with a `restrictive` settings scope. This is not an
    allowed flow configuration.

-   Fixed issue where properties controlled by the selected recipe were
    not always disabled as expected.

-   Resolved issue where specific settings (for example
    ENABLE/DISABLE\_DA\_RULE) in Quartus .qsf files caused parent
    revision analysis to fail.

-   Fixed issue where opening a new project which has never been opened
    in InTime caused the GUI to switch to Results Analysis mode after
    the project was opened.

-   Fixed issue where whitelist was incorrectly cleared by seed
    exploration recipes. This resulted in whitelisted seed values being
    ignored.

-   Resolved issues where locklisted properties were not respected in
    all cases.

-   No longer show LM\_LICENSE\_FILE specified as a port as not existing
    (red).

-   Fixed issue where the Goal Comparison analysis plot could cause
    InTime to crash for some result sets.

-   Fixed issue where the project history no longer showed results for a
    result which was selected as the parent revision and then failed.

-   Fixed issue where some child processes spawned by InTime on Linux
    were not always killed properly.

-   Fixed issue where settings for parent revision was not imported from
    the project file when base revision run target was set to remote.

-   Fixed issue in agent's server configuration when launched in
    background mode. It prompted for the comport and fileport only when
    they were actually defined, not when they were not defined.

-   Fixed issues on Linux where modal dialogs did not stay on top of the
    application, making it appear that InTime is hanging.

-   Numerous resolved issues for private cloud run target:

    > -   Fixed issue where `tmp_<pid>` directories were not removed
    >     properly by agents.
    > -   Fixed issue where cleaning on worker was not done properly
    >     when a job was stopped or cancelled from the source.
    > -   Fixed issue where Critical Path Analysis did not work for the
    >     private cloud run target.
    > -   Fixed incorrect run state (white run not started icon used)
    >     for parents in multiple iteration recipes when using the
    >     private cloud run target.
    > -   Fixed wrong path of worker's log file returned to source for
    >     each strategy.

### v1.1.6

#### New Features

-   Critical path analysis was added in a new recipe finalization flow
    step. The critical path analysis will identify bottlenecks in the
    design, listing paths which occurs most frequently across all InTime
    strategies. In this version this information is saved to a .xml file
    in the job directory for user analysis.

-   Results analysis mode overhaul:

    > -   Much improved analysis mode which uses a new tabbed interface.
    > -   InTime will save a project's current analysis (analyzed
    >     results + selections) and restore it the next time the project
    >     is opened.
    > -   New fanout analysis plot.
    > -   New routing interconnect analysis plot.
    > -   Selections are sync'ed between all plots and the project
    >     history.
    > -   Details of the selected result(s) are now also shown in the
    >     results analysis mode.

-   The details shown for selected results was expanded to show much
    more verbose information about the strategy's results.

-   InTime will now automatically open the previous project you were
    working on. This can be disabled under File-\>Projects.

-   Reusing of synthesis results is now also supported for
    multi-iteration strategies.

-   A new *Educated Routing Exploration* recipe was added to make it
    easy to do routing only exploration. The old *Educated Exploration*
    recipe was renamed to *Educated Full Exploration* to signify the
    difference between the two.

-   Custom flow
    `advanced-concepts-flow_control-techniques-hook-scripts`{.interpreted-text
    role="ref"} are now supported.

#### Changes & Improvements

-   Quality of result improvements:

    > -   Learning will be able to produce improvements even if none of
    >     the initial educated strategies generated could improve on the
    >     parent revision.
    > -   Prediction models are more accurate now, resulting in jobs
    >     with lower medians compared to v1.1.5.

-   The colouring used and changes column in the project history are now
    relative to the root of the recipe, not the parent making it much
    easier to see which strategies caused actual improvements.

-   Added keyboard shortcuts (F6-F10) to analyze results and add results
    to analysis.

-   InTime now supports multiple result sets. Recipes will therefore now
    longer overwrite the user's current analysis when they complete.

-   The old *Educated Seed Exploration* recipe was removed. The same
    effect can be achieved by running the educated and seed recipes in
    the desired order.

-   The default value of the *Generate Programming Files* property was
    changed to `true`.

-   Project setting filters modification tcl commands will now verify
    that only valid setting and setting values are entered by the user.

-   Changed the name of the *Clock Domain Analysis* plot to *FMax
    Analysis*.

#### Tcl Command Set Changes

-   New commands:

    > -   `flow get next_local_job_id`
    > -   `flow get recipe_root_local_job_id`
    > -   `flow_steps initialize_job`
    > -   `flow_steps prepare_training_data`
    > -   `flow_steps download_results`
    > -   `flow_steps post_recipe_analysis`
    > -   `flow_steps finalize_job`
    > -   `results current_tcl_set_name`
    > -   `results activate_tcl_set`
    > -   `results restore_default_tcl_set`
    > -   `misc settings` and friends
    > -   `project setting_filters available_settings`

-   Deprecated commands:

    > -   `results learn` was replaced by `flow_steps learn`

#### Resolved Issues

-   Fixed issue where InTime did not generate strategies for Quartus
    13.0.1sp1.
-   Fixed issue where exporting of a strategy and a strategy's results
    used the same file name.
-   Fixed issue where incorrect settings were used in strategies
    generated for STRATIXIII devices.
-   Fixed issue where FMax analysis plot was not always shown.
-   Correctly list \"Critical Warning\" messages from Quartus as
    warnings in InTime.
-   Fixed issue where Restrictive settings scope was not working for
    Oneshot and Custom strategy algorithms.
-   Fixed multiple project distribution issues caused by inconsistencies
    in the Quartus archiver.
-   Fixed issue in the results analysis mode where the selected result
    detail indication box were cut off for some result set ranges.

### v1.1.5

#### New Features

-   Added new *InTime Default* recipe which is ideal for first time
    calibration, calibration and exploration of designs which are
    optimized by InTime for the first time. This recipe is now selected
    by default.
-   It is now possible to perform routing-only educated design
    exploration by setting the *Reuse Synthesis Results* property to
    while running the *Educated Exploration* recipe.
-   It is now possible to export data to csv files using a new actions
    under the *Export* menu of the project history right-click menu.
-   Added option to prompt for toolchain version to use when multiple
    toolchain versions are defined. This option can be enabled through
    the *Vendor Toolchains* settings page.

#### Changes & Improvements

-   When stopping a recipe which has an active remote job associated
    with it, the option is now given to cancel the remote job as well,
    or to just stop the recipe locally.

-   Numerous improvements to the InTime GUI, mainly focusing on making
    recipes easier to understand and to display better on smaller
    screens.

    > -   Improved recipe selection: The recipe selection combo box now
    >     displays a categorized tree of available recipes along with
    >     short descriptions of each recipe.
    > -   The recipe outcome widget at the bottom of the recipe details
    >     now gives a link which can be used to analyze the recipe's
    >     results (if any).
    > -   A description for the selected recipe is now shown directory
    >     under the selection combo box. This description ends with a
    >     link which will open the help for the recipe.
    > -   A few things moved around as well as elided text used for long
    >     project names in order to display better on smaller screens.

-   When running multiple iteration educated algorithm recipes, the
    cal\_low/high strategies will only be used if learning actually
    happened in the previous iteration.

-   The product update display will now also provide links to detailed
    release notes as well as release blog posts for each release.

-   The multiple job analysis plot now excludes the parent result for
    each job. This gives a more accurate representation of the job's
    performance.

-   The goal based results plot employs better default scaling of axis
    by default.

-   Flow evaluation prompts will now automatically select their default
    option after 30 seconds.

-   A progress bar is now shown indicating the progress of InTime's
    initialization operations where it is opened.

-   Added new menu item which can be used to open the Plunify Blog under
    the *Help* menu.

-   Improvements made to the accuracy of the prediction models
    introduced in v1.1.3.

-   Handle cases where a job's directory already exists better.

-   Default value of run count changed to 10.

#### Resolved Issues

-   Fixed the following issues encountered while distributing Quartus
    designs to applicable run targets:

    > -   Work around issue in the Quartus archiver where `.mif` files
    >     are not correctly packaged in some situations.
    > -   Work around issue in the Quartus archiver where `.hdl.mif`
    >     files are not correctly packaged in some situations.
    > -   Work around issue in the Quartus archiver where `.sdc` files
    >     which are not referenced by the .qsf are not correctly
    >     packaged in some situations.
    > -   Fixed permissions issue resulting from wrong working directory
    >     being used while extracting .qar files in some cases.

-   Fixed issue with *Continuous Learning* recipe where it could
    possible not restore the flow configuration properly in some cases.

-   When pasting into the Tcl console, it will no longer change the font
    of the console to match that of the copy operation's source.

-   Fixed issue where the *Oneshot* strategy algorithm did not support
    synthesis reuse properly.

-   Fixed issue where the *Stop InTime* button was enabled for some
    tasks which could not be stopped.

-   Fixed issues with the application of the educated adjustment filter.

-   Fixed issue where some learning modules were missing from the
    Windows installers.

-   Fixed issue where learning attempted to learn from results sets
    which contained only root/parent results and then failed.

-   Fixed issue with multiple results job analysis plot where it
    displayed jobs which did not have any valid results for the current
    goal.

-   Fixed issue where *Goal Based Target* property was not correctly
    restored when InTime was opened.

-   Fixed issue where cancelling a private cloud job from the worker's
    side causes the worker GUI to go into an unusable state.

-   Properly time out on InTime's side when the private cloud server is
    over utilized and not responding to requests.

### v1.1.4

This release resolves important issues which were present in v1.1.3.

#### Changes & Improvements

-   When the base revision fails because it can't fit, InTime will now
    show the estimated over-utilization in the project history.
-   Numerous stability improvements and polishing.

#### Resolved Issues

-   Fixed issues experienced by users on CentOs 6.x.

### v1.1.3

#### New Features

-   Added Chinese (Simplified) translation which will automatically be
    used on systems with zh locales.
-   Added new prediction models to improve effectiveness of generated
    educated recipes.
-   Added new design goal comparison plot.

#### Changes & Improvements

-   The current implementation stage of strategies are now shown in the
    project history, making it easier to see what InTime is doing while
    strategies are evaluated.
-   The project history now uses coloured backgrounds for results in
    order to easily identify which strategies improved in multiple
    benchmarks (timing score, area, power).
-   When strategies are too aggressive on designs with high utilization,
    InTime will now clearly indicate the utilization of the over
    utilized device logic.
-   The 'Remote Job Max Time' flow property was changed to 'Strategy
    Maximum Runtime' and now applies to all run targets.
-   The educated weights adjustment filter got a new Jobs filter which
    can be used to restrict learning outcomes applied to specific jobs.
-   Numerous improvements to workers in private cloud configurations.

#### Resolved Issues

-   Fixed numerous InTime issues with Altera QuartusII projects
    containing Qsys designs.

### v1.1.2

#### New Features

-   Added new area and power utilization goals, including machine
    learning to improve device utilization.
-   Added action to project menu which allows reopening of the current
    project using a different toolchain version.
-   Added action to project history right-click menu which allows
    learning from the selected job.
-   Added the ability to cancel Plunify Cloud jobs from within InTime.
-   Added new Fmax vs. Clock Domain analysis.
-   Added support for Quartus v13.1.1.
-   The private cloud license (floating license) can now be configured
    in the Manage Licenses dialog, and when configured details of the
    license are shown.

#### Changes & Improvements

-   Improvements to multiple job analysis.

### v1.1.1

-   New easy to use analysis actions were added to the right click menu
    in the project history.
-   New actions were also added to the right click menu to view strategy
    build logs and to open the working directory of a strategy.
-   It is now possible to export a strategy to a csv file.
-   It is now possible to apply a strategy to an existing vendor
    toolchain project revision.
-   The placement seed exploration recipe will now reuse synthesis
    results.
-   Added new clean configuration which allows control over the
    housekeeping tasks done by InTime when strategy runs complete.
-   Much improved results analysis mode.
-   Many improvements under the hood, especially to learning algorithms.
-   Added new Implement Base Revision Only recipe which can be used to
    just run the current project revision on the desired run target
    (local or remote) without generating and evaluating any strategies.
-   Added new Strategy Scope flow configuration property to control if
    strategy settings should be restricted to only the strategy, or to
    the strategy + parent revision.
-   Improvements to project whitelists and blacklist, including a new
    locklist which can be used to lock down settings to specific values.

### v1.1.0

First official release.

'