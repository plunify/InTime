Deciding which recipe to use
============================

The InTime flow is executed using Tcl scripts called *Recipes*. These
scripts abstract the flow details and allows you to run different
variations of the InTime flow through a one-button-click approach. For
an overview of the InTime flow, see `intime_flow`{.interpreted-text
role="doc"}.

InTime ships with ready-to-use recipes. Each recipe attempts to reach
the design goal in a different way, and knowing which recipe to run for
a specific design stage or problem is important. To start a recipe in
the InTime GUI, just click the *Optimize* button.

When using command line mode, use the following commands.

    # List the available recipes:
    plunify> flow recipes list
    "intime_default" "placement_seed_exploration" ...

    # Run a recipe:
    plunify> flow run_recipe intime_default

\newpage

Machine Learning Approach
-------------------------

InTime provides a *new* approach in achieving timing closure without
making changes to a design's RTL. To demonstrate this approach and how
it can be used as a guideline when selecting which recipes to run on
your design, consider a common conventional approach which is to try
multiple *seeds* (or otherwise random design space searches) of the
vendors' implementation algorithms.

When using InTime, the way to view randomized approaches like seeds is
to see them as probabilities. For example, when exploring 1 to 100 seed
values, a variance in the results will occur. This variance determines
the probability of meeting timing. For instance, if the original Total
Negative Slack (TNS) is -1000 and the variance is 100, then seeds are
very unlikely to achieve timing closure.

InTime's approach is to improve the TNS to a suitable level, for
example, -100 and then try Extra Optimization or Placement Seeds. This
way, there is a greater chance of meeting timing. This approach is shown
in `Figure #figure-recipes-intime-approach`.

 {#figure-recipes-intime-approach}
![Demonstrating InTime's Approach To Timing
Closure](images/recipes/recipes_multiple_jobs_analysis.png)


Using this approach, the `recipes_start_here`{.interpreted-text
role="ref"} should be used to improve the original TNS first, followed
by `recipes_next_steps`{.interpreted-text role="ref"}.

!!! tip
    In FPGA tools where the concept of seeds does not exist, InTime's
machine learning recipes should still be used to improve the original
TNS followed by the \"Next Steps\" / \"Last-Mile\" recipes (which use
techniques other than random seeds).


\newpage

Machine Learning Recipes {#recipes_start_here}
------------------------

These recipes, also referred to as *educated recipes*, uses the InTime
machine learning capabilities to learn from previous results' training
data and produce smarter strategies on subsequent runs.

When running these recipes, InTime derives the optimal combination of
settings by using machine learning to understand the correlations
between your design, the settings, the device and sometimes, your FPGA
tool version.

This is enabled by running multiple compilations of the design in
parallel and in different stages. With the results, the learning
algorithms analyze the data, learn from them and save them into the runs
database. This means that the next time an educated recipe is run on a
design, InTime already knows which settings are good for that design.

### Hot Start Recipe {#recipes-hot-start}

This recipe uses new classification techniques to generate the initial
strategies for a project that is being optimized for the first time,
improving the timing performance in a fewer number of
compilations/iterations.

[Tcl execution command:]{.title-ref} `flow run_recipe hot_start`

[Vendor support:]{.title-ref} Quartus-II, Quartus Prime, Vivado

[Number of rounds:]{.title-ref} Uses `rounds` property (Recommended: 1)

\newpage

### InTime Default Recipe {#recipes_intime_default}

This recipe performs first time calibration, exploration and
optimization on a design. This recipe is a good recipe to use on designs
which are run within with InTime for the first time, as well as designs
which have previously been run in InTime but still require further
machine learning optimization before switching to the
`recipes_next_steps`{.interpreted-text role="ref"}.

The expected project history after running this with a default flow
configuration (3 rounds, 10 runs per round) can be seen in the project
history shown in
`Figure #figure-recipes-intime-default-results`.

 {#figure-recipes-intime-default-results}
![Expected Results Of *InTime Default*
Recipe](images/recipes/project_history_intime_default.png)


This recipe is a multi-round recipe which runs multiple iterations of
the `intime_flow`{.interpreted-text role="doc"}. The recipe starts off
with a *calibration round* (job 34), followed by an *exploration round*
(job 35) which is then followed by an *optimization round* (job 36). If
more than 3 rounds are run, the subsequent runs will be *continue
learning* rounds. After learning has completed, the recipe will set the
best result from the previous round(s) as the parent of the new round
(`calibrate_1` in the expected results).

After each round InTime's machine learning algorithms will learn from
the newly generated results, causing *smarter* strategies to be
generated for the next round. The effect of machine learning on a design
can be visualized using the *Multiple Job Analysis* plot in InTime's
\"Results Analysis\" mode. This plot for the expected results shown is
shown in
`Figure #figure-recipes-intime-default-multiple-job-analysis`.

 {#figure-recipes-intime-default-multiple-job-analysis}
![Multiple Job Analysis Plot For *InTime Default* Recipe's Expected
Results](images/recipes/multiple_job_analysis_intime_default.png)


When the machine learning has improved the results' median enough but
has not yet met the design goal, the next step is to use InTime's
`recipes_next_steps`{.interpreted-text role="ref"}.

[Tcl execution command:]{.title-ref} `flow run_recipe intime_default`

[Vendor support:]{.title-ref} ISE, Quartus-II, Quartus Prime, Vivado

[Number of rounds:]{.title-ref} Uses `rounds` property

[Setting filter considerations:]{.title-ref}

The following modifications are made to the project's setting filters
during recipe initialization:

1)  Add toolchain specific setting filter entries as detailed below.

    > *Quartus-II/Quartus Prime:* :
    >
    >     Locklist:
    >     SEED = 31
    >     SYNTHESIS_SEED = 31
    >     ROUTER_EFFORT_MULTIPLIER = 1.0
    >     PLACEMENT_EFFORT_MULTIPLIER = 3.0
    >     ADV_NETLIST_OPT_ALLOWED = DEFAULT
    >     OPTIMIZE_TIMING=NORMAL COMPILATION
    >
    >     Blacklist:
    >     SLOW_SLEW_RATE
    >     PHYSICAL_SYNTHESIS_EFFORT = FAST
    >
    > *Vivado:* :
    >
    >     Whitelist:
    >     All synthesis settings
    >     Directives of all implementation settings

\newpage

### InTime Default Extra Recipe

This recipe behaves the same as the InTime Default Recipe, but it runs
an additional optimization round if the TNS is less than 1001ns, or if
the Worst Slack is less than 0.500ns. The rationale behind this recipe
is that if InTime Default gets you close to meeting the Goal, it is
worth trying a randomized type of optimization.

\newpage

Next Steps / Last-Mile Recipes {#recipes_next_steps}
------------------------------

These recipes can be used when the machine learning recipes has produced
a good result which is very close to achieving the design goals. They
can be used to \"push\" the design over the Finish line, achieving the
design goal.

Although the Next Steps / Last-Mile recipes can be run even if no
machine learning recipes have been run first, in practice you will
typically use the best result from one or more machine learning jobs as
a basis from which the Next Steps recipe's strategies will be
generated. This is referred to as the *parent revision* of the new jobs.

To select the best result from previous machine learning jobs,
right-click on the best strategy and set the result as the parent
revision of the next round as shown in
`Figure #figure-recipes-next-steps-set-custom-parent`. When running InTime in command line mode, the
`flow set parent_revision_name` and `flow set parent_revision_job_id`
commands can be used instead.

 {#figure-recipes-next-steps-set-custom-parent}
![Set Custom Parent
Revision](images/recipes/recipes_set_parent_revision.png){.align-center
width="579px" height="348px"}


Once the custom parent revision has been set, it will be marked with a
star as shown in
`Figure #figure-recipes-next-steps-custom-parent`.

 {#figure-recipes-next-steps-custom-parent}
![Star Icon Used To Indicate Custom Parent
Revision](images/recipes/recipes_set_parent_revision_done.png){.align-center
width="518px" height="96px"}


To illustrate the effect of the custom parent revision, a comparison of
the custom parent and one of the generated strategies are shown in
`Figure #figure-recipes-next-steps-compare-seed`.

 {#figure-recipes-next-steps-compare-seed}
![Comparison Of Custom Parent Revision vs. Strategy
Settings](images/recipes/recipes_seed_parent_compare.png){.align-center
width="644px" height="589px"}


The left column shows the settings of the selected `place_seed_3`
strategy generated by the
`recipes-placement-seed-exploration`{.interpreted-text role="ref"},
while the right column shown the settings of the selected
`cal_speed_tns_low` parent. As expected, only the `SEED` property has a
different value and all other values were based on the custom parent.

\newpage

### Deep Dive Recipe {#recipes-deep-dive}

This recipe analyzes existing results and explores regions close to the
good results so far.

[Tcl execution command:]{.title-ref} `flow run_recipe deep_dive`

[Vendor support:]{.title-ref} ISE, Quartus-II, Quartus Prime, Vivado

[Number of rounds:]{.title-ref} 1

[Goal considerations:]{.title-ref}

This recipe supports only the Speed TNS goal at this time.

> \newpage

### Extra Optimization Recipe {#recipes-extra-opt-exploration}

This recipe iteratively runs placement, physical synthesis, and routing
with different switches to guide the results towards the design goal. In
a typical scenario, iteratively placing a design makes the tools work
harder on optimizing it, improving the timing performance in the
process.

[Tcl execution command:]{.title-ref}
`flow run_recipe extra_opt_exploration`

[Vendor support:]{.title-ref} Vivado

[Number of rounds:]{.title-ref} Uses `rounds` property (Recommended: 1)

\newpage

### Placement Seed Exploration Recipe {#recipes-placement-seed-exploration}

This recipe explores the effect of placement seeds on the design goal.

The expected project history after running this recipe with
`runs_per_round = 10` and a custom parent revision can be seen in the
project history shown in
`Figure #figure-recipes-placement-seed-exploration-results` (job 38).

 {#figure-recipes-placement-seed-exploration-results}
![Expected Results Of *Placement Seed Exploration*
Recipe](images/recipes/project_history_placement_seed_exploration.png)


[Tcl execution command:]{.title-ref}
`flow run_recipe placement_seed_exploration`

[Vendor support:]{.title-ref} ISE, Quartus-II, Quartus Prime

[Number of rounds:]{.title-ref} 1

[Setting filter considerations:]{.title-ref}

The following modifications are made to the project's setting filters
during recipe initialization:

1)  Clear all name-only entries in the whitelist.

2)  Clear all name-only entries in the blacklist.

3)  Clear complete locklist.

4)  Add toolchain specific setting filter entries as detailed below.

    > *ISE:* :
    >
    >     Supported devices:
    >     Spartan3, Spartan3A, Spartan3AN, Spartan3E, Virtex4
    >
    > *Quartus-II:* :
    >
    >     Whitelist:
    >     SEED
    >
    > \newpage

### Synthesis Seed Exploration Recipe {#recipes-synthesis-seed-exploration}

This recipe explores the effect of synthesis seeds on the design goal.
The expected output of this recipe is similar to the
`recipes-placement-seed-exploration`{.interpreted-text role="ref"},
however strategies are named `synth_seed` instead of `place_seed`.

[Tcl execution command:]{.title-ref}
`flow run_recipe synthesis_seed_exploration`

[Vendor support:]{.title-ref} Quartus-II

[Number of rounds:]{.title-ref} 1

[Setting filter considerations:]{.title-ref}

The following modifications are made to the project's setting filters
during recipe initialization:

1)  Clear all name-only entries in the whitelist.

2)  Clear all name-only entries in the blacklist.

3)  Clear complete locklist.

4)  Add toolchain specific setting filter entries as detailed below.

    > *Quartus-II:* :
    >
    >     Whitelist:
    >     SYNTHESIS_SEED

\newpage

### Effort Level Exploration Recipe {#recipes-effort-level-exploration}

This recipe explores the effect of different effort levels on the design
goal.

The expected project history after running this recipe with a custom
parent revision can be seen in the project history shown in
`Figure #figure-recipes-effort-level-exploration` (job 40).

 {#figure-recipes-effort-level-exploration}
![Expected Results Of *Effort Level Exploration*
Recipe](images/recipes/project_history_effort_level_exploration.png)


Note that the expected project history shows the results for the case
where only 1 round was run. In the case where two runs are run, another
job with the best result from job 40 set as its parent will be run.

[Tcl execution command:]{.title-ref}
`flow run_recipe effort_level_exploration`

[Vendor support:]{.title-ref} Quartus-II, Quartus Prime

[Number of rounds:]{.title-ref}

Depends on the device family.

> *Quartus-II:* :
>
>     Stratix-V, Arria-V and Cyclone-V:
>     Round 1: Fixed runs per round of 20
>
>     All other devices:
>     Round 1: Fixed runs per round of 20
>     Round 2: Fixed runs per round of 20

[Setting filter considerations:]{.title-ref}

The following modifications are made to the project's setting filters
during recipe initialization:

> 1)  Clear all entries in project's setting filters.
> 2)  Add toolchain specific setting filter entries as detailed below.
>
> *Quartus-II:* :
>
>     (Round 1)
>     Whitelist:
>     PLACEMENT_EFFORT_MULTIPLIER
>
>     (Round 2)
>     Whitelist:
>     ROUTER_EFFORT_MULTIPLIER

\newpage

### Seeded Effort Level Exploration Recipe {#recipes-seeded-effort-level-exploration}

This recipe performs exploration of seeds on best effort level results
using the following steps:

> -   Explore placement effort levels on design (20 in total).
> -   Selected the best `rounds` effort level results and run
>     `runs_per_round` placement seeds on *each* of them.

The expected project history after running this recipe with a custom
parent revision can be seen in the project history shown in
`Figure #figure-recipes-seeded-effort-level-exploration-results` (jobs 43, 44 and 45) for a flow configuration with
`rounds = 2` and `runs_per_round = 3`.

 {#figure-recipes-seeded-effort-level-exploration-results}
![Expected Results Of *Seeded Effort Level Exploration*
Recipe](images/recipes/project_history_seeded_effort_level_exploration.png)


!!! tip
    When running this recipe, the `runs_per_round` property specifies the
number of seeds that will be run on the top `rounds` effort levels
found.


[Tcl execution command:]{.title-ref}
`flow run_recipe seeded_effort_level_exploration`

[Vendor support:]{.title-ref} Quartus-II, Quartus Prime

[Number of rounds:]{.title-ref} Uses `rounds` property + 1

[Setting filter considerations:]{.title-ref}

The following modifications are made to the project's setting filters
during recipe initialization:

1)  Clear all entries in project's setting filters.

2)  Add toolchain specific setting filter entries as detailed below.

    > *Quartus-II:* :
    >
    >     (Round 1)
    >     Whitelist:
    >     PLACEMENT_EFFORT_MULTIPLIER
    >
    >     (Round 2)
    >     Whitelist:
    >     SEED

\newpage

General Recipes {#recipes_general}
---------------

There are general recipes which have different use-cases as described in
the description of each recipe.

### Just Compile My Design Recipe

This recipe just runs the current active revision in your project on the
run target specified by the `initial_compilation` property.

The expected project history after running this recipe is shown in
`Figure #figure-recipes-just-compile-my-design` (job 41).

 {#figure-recipes-just-compile-my-design}
![Expected Results Of *Just Compile My Design*
Recipe](images/recipes/project_history_implement_base_revision_only.png)


!!! tip
    When the `initial_compilation` property is set to `remote_target`, the
run target specified by the `run_target` property will be used.


[Tcl execution command:]{.title-ref}
`flow run_recipe just_compile_my_design`

[Vendor support:]{.title-ref} ISE, Quartus-II, Quartus Prime, Vivado

[Number of rounds:]{.title-ref} 1

[Setting filter considerations:]{.title-ref} Not modified (used as is)

\newpage

### Rerun Strategies Recipe {#recipes-rerun-strategies}

This recipe allow the user to rerun previously generated strategies. A
typical use case is when a design change is required after timing
closure was achieved on the design using a previous InTime strategy.
After the design was changed, the *good* strategy can be rerun on the
changed design using this recipe.

When this recipe is selected, checkboxes will be shown next to
strategies in the project history, allowing the user to select the
strategies to rerun. This is illustrated in
`Figure #figure-recipes-rerun-strategies-before`.

 {#figure-recipes-rerun-strategies-before}
![Selecting Strategies To Rerun Using *Rerun Strategies*
recipe.](images/recipes/project_history_rerun_checkboxes.png)


The expected project history after running this recipe with the
selection shown in the above figure is shown in
`Figure #figure-recipes-rerun-strategies-results` (job 42).

 {#figure-recipes-rerun-strategies-results}
![Expected Results Of *Rerun Strategies*
Recipe](images/recipes/project_history_rerun_job.png)


[Tcl execution command:]{.title-ref} `flow run_recipe rerun_strategies`

> To select strategies to be rerun using Tcl add the strategies which
> must be rerun to the `run_subset` result set (refer to
> `advanced-concepts-working-with-result-sets`{.interpreted-text
> role="ref"} for more information on result sets).
>
> For example:
>
>     results activate_tcl_set "run_subset"
>     results clear
>     # Add results to rerun to the run subset:
>     results add ...
>     results add ...
>     results restore_default_tcl_set

[Vendor support:]{.title-ref} Vendor independent

[Number of rounds:]{.title-ref} 1

[Setting filter considerations:]{.title-ref} Not used

\newpage

### Custom Flow Recipe

This recipe runs the InTime flow once with the specified flow
configuration. Unlike the other InTime recipes, no properties in the
flow configuration are controlled by the recipe, giving full control to
the user. When using custom strategy algorithms, this recipe should be
used in order to gain control over the `strategy_algorithm` property
which is normally locked and controlled by other InTime recipes.

[Tcl execution command:]{.title-ref} `flow run_recipe custom_flow`

[Vendor support:]{.title-ref} Vendor independent

[Number of rounds:]{.title-ref} Uses `rounds` property

[Setting filter considerations:]{.title-ref} Not modified (used as is)
'