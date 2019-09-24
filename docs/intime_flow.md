The InTime Flow
===============

![InTime](images/quickstart/intime_overview.jpg)

Tool Flow Overview
------------------

Here are steps which help FPGA designers achieve design goals and
targets in the fastest way possible.

Typical steps in the flow are shown in
`Figure  #figure-intime-flow-overview`{.interpreted-text role="num"}.

 {#figure-intime-flow-overview}
![The InTime Tool
Flow](images/intime_flow/intime_flow.png)


The flow's starting point is an FPGA project created separately in an
FPGA vendor tool.

When InTime starts, it detects existing synthesis and place-and-route
results for the active revision/run (also known as the
`default revision`) in the project before continuing. If results are not
available the user will be prompted to let InTime build the active
revision/run before proceeding. The default revision then becomes the
`base revision` of the strategy evaluation step. Using the base
revision, InTime generates strategies which are optimized for the
design.

In the strategy evaluation step, InTime runs builds for all generated
strategies. Users can define different run targets (local machine,
private server farm, Amazon cloud) to run these builds, effectively
scaling the number of concurrent runs based on the compute resources
available (see `run_targets`{.interpreted-text role="doc"} for details).
Once completed, the results of all strategies are analyzed, collated and
stored in InTime. This way, InTime builds up a comprehensive audit of
all builds performed on all designs.

Before going into more detail, it is worth pausing to look at the
*Strategy Generation* step.

Strategy Generation
-------------------

When InTime generates strategies, it uses built-in knowledge that is
optimized for each design. This knowledge leads to strategies with
higher probabilities of improving the design's performance in order to
meet design goals.
`Figure #figure-intime-flow-strategy-generation` shows how this process works and how it becomes smarter and
better at predicting strategies over time.

 {#figure-intime-flow-strategy-generation}
![Strategy Generation In
InTime](images/intime_flow/strategy_generation.png)


The latest database ships with InTime and is the basis for future
learning. Each time InTime completes a set of builds, it learns from the
results and associates them with the project on which they were based.

Bringing It Together
--------------------

The integrated flow diagram in
`Figure #figure-intime-flow-full`{.interpreted-text role="num"} shows
how strategy generation ties into the tool flow, providing a clearer
picture of how the full InTime flow works.

 {#figure-intime-flow-full}
![The Full InTime Tool
Flow](images/intime_flow/intime_flow_with_learning.png)


Once all strategy outcomes have been evaluated InTime determines if the
design goal and targets have been met. If so, InTime has succeeded. If
not, a next iteration of the flow can be started using the best result
of the previous iteration as the basis (referred to as the *parent
revision* throughout the documentation) upon which subsequent strategies
will be generated.

You can easily customize the flow to cater to the needs of a wide range
of situations and applications. Using a number of carefully selected
`flow_properties`{.interpreted-text role="doc"}, you will be able to
generate strategies in different ways and get to different outcomes. For
example, instead of meeting timing, you can explore various placement
and routing possibilities for utilization.

To abstract the complexities of the customizable flow, InTime uses the
concept of `recipes`{.interpreted-text role="doc"}. Recipes abstract the
flow from the user and provides the user with different customizations
of the InTime flow steps to solve specific design problems.
'