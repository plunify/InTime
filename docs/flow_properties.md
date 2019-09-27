Flow Properties
===============

Before clicking the "Optimize" button, please specify the required
build resource parameters, most importantly, the number of
compilations, the number of rounds to run, and finally the number of
servers or builds in parallel (see
`Figure #figure-quickstart-vivado-flow-properties`).

 
![Essential flow
properties](images/quickstart/flow_properties.png)


!!! tip
    When selecting the *Private Cloud* run target, please make sure your
Private Cloud is properly configured as described in the InTime
Configuration Guide.


Flow properties control the InTime execution sequence (Overview:
`intime_flow`). The following sections explain these properties.

Not every property applies to all flows, for example, when using the
Local run target, properties for Remote run targets are not applicable.
In other cases, Recipes may override certain flow properties
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
build resource parameters, most importantly, the number of
compilations, the number of rounds to run, and finally the number of
servers or builds in parallel (see
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

    > -   *Local* (`local`): Run strategies on a single, standalone machine where
    >     InTime is also being run.
    > -   *Private Cloud* (`private_cloud`): Run strategies in your internal server farm
    >     using the InTime `run-targets-private-cloud`.
    > -   *Plunify Cloud* (`plunify_cloud`): Run strategies on a Plunify-managed cloud
    >     using the `run-targets-plunify-cloud`.

-   **Runs Per Round** (`runs_per_round`): The number of strategies to
    compile per iteration. You can set this number to 0 in which case InTime
    will compile only your original project (the "parent revision"). This lets you manage
    and build up a comprehensive history of all the builds performed on
    a design, even if you are not generating strategies via InTime. Note
    that InTime learns more effectively with a higher number of runs per round.
    Valid Range: `0-1000`.

-   **Rounds** (`rounds`): The number of iterations (each iteration
    consists of one or more strategies). Similar to Runs Per Round, the
    more rounds you run, the more effective InTime's learning capabilities become.
    Valid Range: `1-100`. The total number of runs will be
    `runs_per_round` \* `rounds`.

-   **Concurrent Runs** (`concurrent_runs`): The number of strategies to
    compile in parallel. The context of concurrency and the default
    value depends on the selected run target:

    > -   *Local*: The number of parallel builds on a single machine.
    >     Default: `1`.
    > -   *Private Cloud*: The number of builds across multiple machines to assign to this job.
    >     Default: The concurrent run limit of the private cloud
    >     license.
    > -   *Plunify Cloud*: The number of Plunify Cloud servers to assign to this job.
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

-   **Goal Based Target** (`goal_based_target`): The target result to
    aim for. Default: `0`. The value represents the following, depending
    on the selected `goal`:

    > -   *Speed - TNS* (`speed_tns`): The TNS to aim for.
    > -   *Area* (`area`): The device utilization percentage to aim for.
    
-   **Stop When Goal Met** (`control_stop_when_goal_met`): When true,
    stop as soon as one of the generated strategies meets the design
    goal. Otherwise, continue until the recipe completes. Default:
    `true`.

Parent Revision Properties 
--------------------------

Properties related to the "parent revision" of each round within a job.
Each round has a parent revision which is the point of reference for
generating strategies and determining result improvements For
recipes. The parent revision of the very first round is called the
the *base* or *root* revision (the root of a tree of results).
while parent revisions of subsequent rounds are called *custom parent*
revisions. Finally, when opening a project, InTime detects the active
revision / run in the project and keeps track of it.

-   **Initial Compilation** (`initial_compilation`): The Run Target to
    use when InTime builds the root revision of the design. Default:
    `local`.

    > -   *Local* (`local`): Build using the machine on which InTime is
    >     running.
    > -   *Skip* (`skip`): If the root revision's results are not
    >     required for comparison, choose this option to reduce runtime.
    >     Some recipes, such the seed exploration ones, 
    >     automatically skip building the root revision.

-   **Name** (`parent_revision_name`): The topmost revision in a round
    of builds / strategoes. Initially, this is the FPGA project's
    active revision, but subsequently, the user can change it to any
    revision in the project or in the InTime build history. Default: The
    active revision / run of the FPGA project.

-   **Job Id** (`parent_revision_job_id`): When 0, InTime looks up
    the `parent_revision_name` from the project and fails if it does not
    exist. On the other hand, when not 0, InTime attempts to find a
    job with the ID specified in the project's InTime build history. If
    found, InTime looks for a revision matching
    `parent_revision_name` within that job, and uses that strategy along
    with its results as the parent revision for the next round.
    Default: `0`.

The InTime GUI makes it easy to set any result in a project's history
as the custom parent revision of the next iteration by right-clicking on the
result in the project build history, and selecting \"Set As Parent Revision\".
See `recipes_further_exploration` for more
information on setting a custom parent revision.

Flow Control Properties 
-----------------------

Properties which control flow decisions and outcomes, and may not be
available depending on the FPGA tool.

-   **Stop If Post-Place Timing Is Bad** (`control_stop_when_post_place_timing_bad`):
    Post-placement timing can be a good indicator of final timing, so
    you can reduce your optimization turnaround time by enabling this option
    to terminate builds based on timing results just 
    after placement. Default: `false`.

    > -   *Post-Place TNS Limit(ns)*: (`post_place_tns_limit`) Total
    >     Negative Slack value below which InTime will terminate
    >     any build. Default: `-1000`
    > -   *Post-Place Worst Setup Slack Limit(ns)*: (`post_place_wns_limit`)
    >     Worst Setup Slack value below which InTime will terminate
    >     any build. Default: `-0.9`
    > -   *Post-Place Worst Hold Slack Limit(ns)*: (`post_place_whs_limit`)
    >     Worst Hold Slack value below which InTime will terminate
    >     any build. Default: `-0.9`
    
    When enabled, any of the Limit values meeting the threshold value results in
    InTime terminating the build.

-   **Force Continue** (`control_force_continue_when_no_results`): Normally
    InTime does not proceed to the next round of strategies if there are no
    no results (failed or stopped strategies) in the current round. Toggling
    this property compels InTime to still proceed in such a situation.
    Default: `false`.

-   **Create Bitstreams** (`control_create_bitstreams`): Indicates if
    programming files should be generated for each strategy. Normally it
    does not make sense to do so since programming file generation adds
    to runtime. Default: `false`. For some toolchains, a side-effect of
    setting this to `false` is that power estimates will not be done.

-   **Reuse Synthesis Results** (`control_reuse_synthesis_results`):
    Indicates if synthesis results should be reused in order to decrease
    build runtimes. When enabled, only place & routing exploration is done,
    reusing synthesis results from the parent revision. Default: `false`.
    The following restrictions apply:

    > -   Only supported for `educated`, `oneshot` strategy algorithms.
    > -   Only supported when `initial_compilation` is `local`.
    > -   Not available for the `plunify_cloud` run target.
    
-   **Reuse Routed Netlist** (`control_reuse_routed_netlist`):
    Indicates if the post-route parent revision circuit should be used
    in order to reduce build runtimes. Default: `false`.

-   **Allow Eval IP** (`control_allow_eval_ip`): Trial IP cores usually
    have different timing performance compared to licensed IP cores, and 
    are typically not used for production builds. Enable this property
    to permit the use of trial IP cores. Default: `false`.
    
-   **Ignore DRC Errors** (`control_ignore_drc_errors`): Design Rule
    Checks (DRC) can be deemed excessive at time. Enable this property
    to disregard DRC failures and continue compiling the design. Default: `false`.
    
-   **Regnerate IP Targets** (`control_regen_ip_targets`): Certain IP
    cores can be compiled independently and saved as netlists. InTime archives your
    FPGA project and builds a copy for every InTime strategy. To reduce runtime,
    InTime assumes that every required IP netlist is archived properly.
    If you are encountering synthesis errors about missing modules or netlists,
    enable this property to re-compile all IP cores. Default: `false`.

Strategy Related Properties 
---------------------------

Properties related to the generation of strategies.

-   **Algorithm** (`strategy_algorithm`): The approach to take. Default:
    Controlled by the recipe.

    > -   *Educated* (`educated`): This approach uses existing knowledge
    >     in the InTime database to generate strategies which are
    >     optimized for the design. The `training_data_filter` property
    >     controls which correlations to apply when making decisions
    >     during the generation of new strategies.
    > -   *Custom* (`custom`): Uses strategies that you create. For
    >     information on implementing custom strategy generation
    >     algorithms please refer to
    >     `advanced-concepts-custom-strategy-algorithms`.
    > -   *Oneshot* (`oneshot`): This approach uses the
    >     project's *whitelist* and *blacklist* as guides to generate
    >     strategies containing all possible combinations of the
    >     specified tool settings. The seed exploration recipes are
    >     examples of how this approach works.

-   **Custom Strategy** (`strategy_custom`): The name of the strategy to
    use when `strategy_algorithm` is set to `custom`.

-   **Synthesis Name to Export** (`strategy_export_synth_name`): Allows you
    to specify the synthesis run name when you output an InTime strategy to your project.

-   **Implementation Name to Export** (`strategy_export_impl_name`): Allows you
    to specify the implementation run name when you output an InTime strategy to your project.

-   **Auto Adjust Clock Margin Value** (`auto_clock_margin_adjustment`): Applicable
    only to the Clock Margin Exploration recipe, this property makes InTime
    generate clock margin values for strategies. Default: `True`.

-   **Clock Margin Initial Value** (`clock_initial_value`): Applicable
    only to the Clock Margin Exploration recipe, set this property (in ns) as the starting
    clock margin quantity to explore. Default: `0.05`

-   **Clock Margin Increment** (`clock_increment_value`): Applicable
    only to the Clock Margin Exploration recipe, set this property (in ns) as the
    clock margin quantity to increase for each strategy. Default: `0.05`.

-   **Settings Scope** (`strategy_settings_scope`): How strategy
    settings are applied to the parent revision. Default: `additive`.

    > -   *Additive* (`additive`): Add settings defined for the strategy
    >     on top of existing settings of the parent revision. If a
    >     setting exists both in the strategy as well as the parent
    >     revision, the value defined for the strategy will be used.
    > -   *Restrictive* (`restrictive`): Use only settings defined for
    >     the strategy, omitting all existing settings of the parent
    >     revision.

-   **Strategy Prefix** (`strategy_prefix`): Each generated strategy is
    assigned a unique name within a job's context. This property
    allows control over the name used to derive strategy
    names. For example, if the strategy prefix is *calibrate*,
    strategy names will typically be *calibrate\_1*, *calibrate\_2* etc.
    Informative prefixes give a better idea of what a recipe does (refer
    to the recipes in InTime).
    
-   **Strategy Runtime Unit** (`strategy_time_unit`): Choose how InTime
    monitors build runtime - in Seconds, Minutes or Hours in order to
    terminate builds that exceed a certain runtime. Default: `Hours` 

-   **Maximum Runtime** (`strategy_max_runtime`): The maximum allowed
    runtime (in hours) per strategy. Default: `12`, Valid Range: `0-48`.

-   **Auto-Optimize Max Runtime** (`auto_max_runtime`): Adjust Maximum Runtime
    automatically based on the runtimes of the previous job. Default: `False`.

-   **Auto-Sync Results** (`auto_sync_results`): Match your project path and name
    to existing results in your InTime database, and automatically link matching
    results to your project. Default: `True`.
    
-   **Strategy Retries If Fail** (`strategy_retry_count`): Due to unexpected events
    like machine crashes or network outages, your InTime builds may fail.
    Specify the maximum number of attempts to re-build a strategy. Applies only to
    Private Cloud builds. Default: `3`.

-   **Strategy Start Interval** (`strategy_delay_interval`): In a Private Cloud
    environment, to load balance, you may not want all InTime builds to start simultaneously.
    Specify the number of seconds between the start of each strategy using this property.
    Default: `5` seconds.

Cleaning Properties 
-------------------

Properties which control how InTime does housekeeping for
files created during its flow.

The following items can be cleaned up per strategy:

-   **Generated Files** (`generated_files`): Files generated while
    creating, running and analyzing strategies. These include all files
    generated by the vendor tool as well as additional files created by
    InTime during result analysis. InTime puts all generated files in
    the *\<project\_dir\>/plunify.jobs/\<job\_id\>* directory. When the
    cleaning properties are not set to clean the generated files,
    the user can manually remove files. *Note:* InTime keeps specific files for
    in order to learn from the results. Those files are
    not removed even if you set this property.
-   **Project References** (`project_references`): Changes made to the
    project that are related to InTime strategies, including new project
    revisions etc.

The files to clean are set per strategy outcome. The following outcomes
can be configured:

-   **Met Goal** (`met_goal`): Strategies which are built successfully 
    and which meet the design goal.
-   **Success** (`success`): Strategies which are built successfully
    but which do not meet the design goal.
-   **Stopped** (`stopped`): Strategies which are stopped, either by
    the user or due to another strategy meeting the design goal (see
    `control_stop_when_goal_met` for more information).
-   **Failed** (`failed`): Strategies which failed.

The *Generated Files* cleaning properties are controlled either through
the flow properties in the InTime GUI or through the Tcl command
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

-   **Keep DCPs** (`max_dcp_keep`): Design Checkpoint or netlist files preserve intermediate
    compilation information. Some are saved so that they can serve as custom parent
    revisions for subsequent jobs. In order to conserver diskspace, you can set the
    number of Design Checkpoints to keep on hand. InTime prioritizes these netlists by
    order of Total Negative Slack, Worst Slack and then Area (logic utilization).
    Default: `999`.

Training Data Filter Properties 
-------------------------------

Training data filter properties determine which build results
are used as training data for InTime's machine learning algorithms when
generating strategies. Default:
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
