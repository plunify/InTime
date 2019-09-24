Flow Properties
===============

Before clicking the "Optimize" button, please specify the required
server resource parameters, most importantly, the number of
compilations, the number of rounds to run, and finally the number of
servers (see
`Figure #figure-quickstart-vivado-flow-properties`).

 
![Essential flow
properties](images/quickstart/flow_properties.png)


!!! tip
    When selecting the *Private Cloud* run target, please make sure your
private cloud is properly configured as described in the InTime
Configuration Guide.


Flow properties control the InTime flow (Overview:
`intime_flow`). These properties are
described in the sections that follow.

Not every property applies to all flows, for example, when using the
local run target, properties for remote run targets are not applicable.
In other cases, recipes might override certain configuration properties
and you will not be able to set those. One example is the strategy
algorithm which automatically set to the \"educated\" strategy when
running the `recipes_intime_default`.
InTime disables properties which are not applicable to the current flow
and explains why in each property's tooltip.

When using InTime in Tcl command line mode, you can change flow
properties via the `flow` series of commands. For example:

    # Set the value of a property:
    flow set run_target local
    # Get the value of a property:
    set run_target_value [flow get run_target]
    # Show current flow configuration:
    flow properties

Throughout the sections below, the Tcl names used for property names and
their possible values are shown next to the equivalent InTime GUI
strings, formatted like (`this`).

General Properties 
--------------------------------------------------------

Before clicking the "Optimize" button, please specify the required
server resource parameters, most importantly, the number of
compilations, the number of rounds to run, and finally the number of
servers (see
`Figure #figure-quickstart-vivado-flow-properties`).

 
![Essential flow
properties](images/quickstart/flow_properties.png)


!!! tip
    When selecting the *Private Cloud* run target, please make sure your
private cloud is properly configured as described in the InTime
Configuration Guide.


These properties control the most important aspects of the flow.

-   **Run Target** (`run_target`): Specifies where a job is compiled.
    For details on the different run targets, see
    `run_targets`. Default: depends on the
    available license. When no license is registered the default is
    `plunify_cloud`, otherwise the default is `local`.

    > -   *Local* (`local`): Run all strategies on the machine where
    >     InTime is being run.
    > -   *Private Cloud* (`private_cloud`): Run all strategies using
    >     the InTime `run-targets-private-cloud`.
    > -   *Plunify Cloud* (`plunify_cloud`): Run all strategies using
    >     the `run-targets-plunify-cloud`.

-   **Runs Per Round** (`runs_per_round`): The number of strategies to
    compile per iteration. You can set the number of runs to 0 in which
    case InTime compiles only the parent revision. This lets you manage
    and build up a comprehensive history of all the builds performed on
    a design, even if you are not generating strategies via InTime. Note
    that InTime learns more effectively with a higher number of runs.
    Default: `10`, Valid Range: `0-1000`.

-   **Rounds** (`rounds`): The number of iterations (each iteration
    consists of one or more strategies). Similar to runs per round, the
    more rounds you run, the more effective InTime becomes. Default:
    `3`, Valid Range: `1-100`. The total number of runs will be
    `runs_per_round` \* `rounds`.

-   **Concurrent Runs** (`concurrent_runs`): The number of strategies to
    compile in parallel. The context of concurrency and the default
    value depends on the selected run target:

    > -   *Local*: The number of concurrent runs on the local machine.
    >     Default: `1`.
    > -   *Private Cloud*: The number of workers to assign to this job.
    >     Default: The concurrent run limit of the private cloud
    >     license.
    > -   *Plunify Cloud*: The number of servers to assign to this job.
    >     Default: `100`.

Goal Related Properties 
-----------------------

Properties related to the goals of the InTime flow.

-   **Recipe Goal** (`goal`): Design goal to aim for. Default: `speed`.

    > -   *Speed - TNS* (`speed_tns`): Achieve timing closure by
    >     attempting to minimize the design's *Total Negative Slack
    >     (TNS)* (also referred to as *Timing Score* by some FPGA
    >     software).
    > -   *Area* (`area`): Reduce device utilization.
    > -   *Power* (`power`): Reduce power dissipation.

-   **Goal Based Target** (`goal_based_target`): The target result to
    aim for. Default: `0`. The value represents the following, depending
    on the selected `goal`:

    > -   *Speed - TNS* (`speed_tns`): The TNS to aim for.
    > -   *Speed - Worst Slack* (`speed_worst_slack`): The worst slack
    >     to aim for.
    > -   *Area* (`area`): The device utilization percentage to aim for.
    > -   *Power* (`power`): The power dissipation to aim for.

Parent Revision Properties 
--------------------------

Properties related to the parent revision of each round within a job.
Each round has a parent revision which is the point of reference for
generating strategies and determining result improvements, etc. For
iterative recipes, the parent revision of the very first round is
referred to as the *base* revision (the root of the generated results
tree), while parent revisions of subsequent rounds are called *parent*
revisions. Finally, when opening a project, InTime detects the active
revision / run in the project and keeps track of it. This revision is
referred to as the *default* revision within InTime and is displayed in
the GUI.

-   **Initial Compilation** (`initial_compilation`): The run target to
    use when InTime builds the base revision of the design. Default:
    `local`.

    > -   *Local* (`local`): Build using the machine on which InTime is
    >     running.
    > -   *Remote Target* (`remote_target`): Build using the remote run
    >     target specified by the `run_target` property. When
    >     `run_target` is set to `local`, this option has no effect and
    >     reverts to `local`.
    > -   *Skip* (`skip`): If the base revision's results are not
    >     required, choose this to reduce runtime. Some recipes, such as
    >     the seed exploration recipes, will automatically use this run
    >     target.

-   **Existing Results** (`base_revision_existing_results`): Indicates
    how existing base revision results are handled. Default: `prompt` in
    GUI mode, `rerun` in tcl mode. Note: When `initial_compilation` is
    set to `skip`, this property has no effect.

    > -   *Prompt* (`prompt`): Ask what to do using a message box that
    >     automatically re-uses results after 30 seconds. Note: When set
    >     to this value and InTime is run in tcl Console or batch mode,
    >     InTime will do a `re-use`.
    > -   *Re-use* (`reuse`): Use existing results to save time.
    > -   *Re-run* (`rerun`): Clear existing results and compile again.
    >     Note: If there have been changes to the design, set this
    >     property to `rerun` in order to force an update.

-   **Missing Results** (`base_revision_existing_results`): Indicates
    how missing base revision results must be handled. Default: `prompt`
    in GUI mode, `rerun` in tcl mode. Note: When `initial_compilation`
    is set to `skip`, this property has no effect, also, this property
    is only available through the Tcl command set. Also note that this
    property is only changeable through the Tcl console.

    > -   *Prompt* (`prompt`): Ask what to do using a message that
    >     automatically re-runs the design after 30 seconds. Note: When
    >     set to this value and InTime is run in tcl mode, InTime will
    >     default to `rerun`.
    > -   *Re-run* (`reuse`): Compiles the design on the specified run
    >     target (`initial_compilation`).
    > -   *Stop* (`stop`): Stop the flow (Not recommended).

-   **Name** (`parent_revision_name`): The topmost revision in a series
    of compilations. Initially, this is set to the FPGA project's
    active revision, but subsequently, the user can change it to any
    revision in the project or in its InTime build history. Default: The
    active revision / run of the FPGA project.

-   **Job Id** (`parent_revision_job_id`): When 0, InTime will look up
    the `parent_revision_name` from the project and fails if it does not
    exist. On the other hand, when not 0, InTime will attempt to find a
    job with the ID specified in the project's InTime run history. If
    found, InTime will look for a revision matching
    `parent_revision_name` within that job, and use that strategy along
    with its results as the parent revision for the next revision.
    Default: `0`.

The InTime GUI makes it easy to set any result in a project's history
as the parent revision of the next iteration via right-clicking on the
result in the project history and selecting \"Set As Parent Revision\".
See `recipes_further_exploration` for more
information on setting a custom parent revision.

Flow Control Properties 
-----------------------

Properties which control flow decisions and outcomes.

-   **Stop When Goal Met** (`control_stop_when_goal_met`): When true,
    stop as soon as one of the generated strategies meets the design
    goal. Otherwise, continue until the recipe completes. Default:
    `true`.

-   **Create Bitstreams** (`control_create_bitstreams`): Indicates if
    programming files should be generated for each strategy. Normally it
    does not make sense to do so since programming file generation adds
    to runtime. Default: `false`. A side-effect of setting this to
    `false` is that power estimates will not be done.

    > -   *Altera QuartusII*: When disabled runtimes will be shorter,
    >     but power data will be unavailable.

-   **Reuse Synthesis Results** (`control_reuse_synthesis_results`):
    Indicates if synthesis results should be reused in order to decrease
    build runtimes. When enabled, routing only exploration is done,
    reusing synthesis results from the parent revision. Note that this
    property is automatically enabled/disabled by the *Placement Seed
    Exploration* recipe. Also note the following restrictions:

    > -   It is only supported for the following strategy algorithms:
    >     `educated`, `oneshot`
    > -   It is only supported when `initial_compilation` is set to
    >     `local`.
    > -   It is not available for the `plunify_cloud` run target.

Remote Job Properties 
---------------------

Properties related to jobs being run remotely.

-   **Off-Peak** (`remote_off_peak`): Use a cloud feature called \"Spot
    Instances\" to save 50% of your cloud credits on average. Tradeoffs
    are that servers take longer (up to 30 minutes) to start and builds
    may be terminated. Recommended for non-time-critical jobs. Supported
    remote run targets: `plunify_cloud`. Default: `false`.

-   **Auto-Assign Workers** (`remote_auto_assign`): Indicates if remote
    workers must automatically be assigned. Auto-assignment is always
    done for `plunify_cloud` jobs and `private_cloud` jobs with an
    *InTime Group* license. The ability to control worker assignment
    manually is available only with *InTime Enterprise* licenses.
    Default: `true`.

-   **Server Type** (`remote_server_type`): The type of Amazon servers
    to use for Plunify cloud jobs. For more information on server
    specifications please refer to the [Plunify Credits
    Store](https://cloud.plunify.com). Default: `small`.

    > -   *SMALL* (`small`)
    > -   *MEDIUM\_EX* (`medium_ex`)
    > -   *MEDIUM* (`medium`)
    > -   *LARGE\_EX* (`large_ex`)
    > -   *LARGE* (`large`)
    > -   *XLARGE* (`xlarge`)

Strategy Related Properties 
---------------------------

Properties related to the generation of strategies.

-   **Algorithm** (`strategy_algorithm`): The approach to take. Default:
    controlled by recipe.

    > -   *Educated* (`educated`): This approach uses existing knowledge
    >     in the InTime database to generate strategies which are
    >     optimized for the design. The `training_data_filter` property
    >     controls which correlations to apply when making decisions
    >     during the generation of new strategies.
    > -   *Oneshot* (`oneshot`): This flexible approach uses the
    >     project's *whitelist* and *blacklist* as guides to generate
    >     strategies containing all possible combinations of the
    >     specified tool settings. The seed exploration recipes are
    >     examples of how a oneshot approach can be applied.
    > -   *Custom* (`custom`): Use a strategy that you created. For
    >     information on implementing custom strategy generation
    >     algorithms please refer to
    >     `advanced-concepts-custom-strategy-algorithms`.

-   **Custom Strategy** (`strategy_custom`): The name of the strategy to
    use when `strategy_algorithm` is set to `custom`.

-   **Maximum Runtime** (`strategy_max_runtime`): The maximum allowed
    runtime (in hours) per strategy. Default: `12`, Valid Range: `0-48`.

-   **Strategy Prefix** (`strategy_prefix`): Each generated strategy is
    assigned a unique name within the job's context. The strategy
    prefix property allows control over the name used to derive strategy
    names from. For example, if the strategy prefix is *calibrate*,
    strategy names will typically be *calibrate\_1*, *calibrate\_2* etc.
    Informative prefixes give a better idea of what a recipe does (refer
    to the pre-made recipes in InTime).

-   **Settings Scope** (`strategy_settings_scope`): How strategy
    settings are applied to the parent revision. Default: `additive`.

    > -   *Additive* (`additive`): Add settings defined for the strategy
    >     on top of existing settings of the parent revision. If a
    >     setting exists both in the strategy as well as the parent
    >     revision, the value defined for the strategy will be used.
    > -   *Restrictive* (`restrictive`): Use only settings defined for
    >     the strategy, omitting all existing settings of the parent
    >     revision.

Training Data Filter Properties 
-------------------------------

Training data filter properties determine which previous build results
are used as training data for the machine learning algorithms when
generating strategies for the educated algorithm(s). Default:
`Design&Device&ToolchainVersion`.

-   **Design:** Only apply previous learning outcomes linked to the open
    project's design.

-   **ToolchainVersion:** Only apply previous learning outcomes linked
    to the current vendor toolchain version.

-   **DeviceFamily:** Only apply previous learning outcomes linked to
    the device family of the open project's design. For example:
    `Cyclone II`, `Stratix V`.

-   **Device:** Only apply previous learning outcomes linked to the
    device of the open project's design. For example: `EP2C5F256C6`.

-   **DevicePackage:** Only apply previous learning outcomes linked to
    the device package of the open project's design. For example:
    `FBGA`, `TQFP`.

-   **DeviceSpeed:** Only apply previous learning outcomes linked to the
    device speed grade of the open project's design. For example: `6`,
    `7`.

-   **Jobs:** Only apply previous learning outcomes linked to the
    specified jobs across all designs for which results are stored in
    your InTime runs database. Jobs can be specified using the following
    syntax:

    > 1.  `=1,5,7`: Specify individual jobs as a comma separated list
    >     preceded with `=`.
    > 2.  `!=1,5,7`: Exclude individual jobs by placing a `!` in front
    >     of the job number, for example: `!=1,5,7`
    > 3.  `>5`: Specify job ranges. Supported operators include: `<`
    >     `<=` `>` `<=`.

The educated adjustment properties can be set in the Tcl console via the
`training_data_filter` property. For example: :

    flow set training_data_filter Design&Device&Jobs=5,6
    flow set training_data_filter Design&Device&Jobs>=5
    flow set training_data_filter Design&Device&Jobs!=5,6

Cleaning Properties 
-------------------

Properties which control how InTime does housekeeping and cleans up
files created during the InTime flow.

The following items can be cleaned up per strategy:

-   **Generated Files** (`generated_files`): Files generated while
    creating, running and analyzing strategies. These include all files
    generated by the vendor tool as well as additional files created by
    InTime during result analysis. InTime puts all generated files in
    the *\<project\_dir\>/plunify.jobs/\<job\_id\>* directory. When the
    cleaning properties are not configured to clean the generated files,
    the user can manually inspect and remove the required files from
    this directory at any time. *Note:* InTime keeps specific files for
    each revision in order to learn from the results. Those files are
    not removed when this property is set.
-   **Project References** (`project_references`): Changes made to the
    project that are related to InTime strategies, including new project
    revisions etc.

The files to clean are set per strategy outcome. The following outcomes
can be configured:

-   **Met Goal** (`met_goal`): Strategies which were built and evaluated
    successfully and which met the design goal.
-   **Success** (`success`): Strategies which were built and evaluated
    successfully but which did not meet the design goal.
-   **Stopped** (`stopped`): Strategies which were stopped, either by
    the user or due to another strategy meeting the design goal (see
    `control_stop_when_goal_met` for more information).
-   **Failed** (`failed`): Strategies which failed.

The *Generated Files* cleaning properties are controlled either through
the visual flow properties in the InTime GUI or through the Tcl command
line interface. The *Project References* cleaning properties are only
controlled through the Tcl command line interface. For an overview of
the current clean configuration, use the `flow get clean` command:

    plunify> flow get clean
    Clean operations per strategy outcome:

    met_goal
    -> clean generated_files = false
    -> clean project_references = false
    success
    -> clean generated_files = true
    -> clean project_references = true
    stopped
    -> clean generated_files = true
    -> clean project_references = true
    failed
    -> clean generated_files = true
    -> clean project_references = true

!!! tip
    The above configuration is the default configuration. To restore this
default configuration, use `flow set clean restore_defaults`.


To change the default configuration, use the following command and one
of the specified sub-commands:

    flow set clean <all,generated_files,project_references> <run_state> <true,false>

For example:

    # To keep all generated files:
    flow set clean generated_files all false

    # To keep all generated files only for builds which fail or meet the design goal:
    flow set clean generated_files failed true
    flow set clean generated_files met_goal true

    # To clean everything:
    flow set clean all all true
'