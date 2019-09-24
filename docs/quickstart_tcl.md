Quick Start for InTime in Tcl Mode
====================================

This section is for Xilinx users to get started with InTime using Tcl mode.

## Start InTime 
Using a command line shell, a typical way to start InTime is as such below

```intime.sh -mode batch -project <proj> -s intimeflow.tcl```

* For project-mode, use a XPR file for the ```<proj>``` option.
* For non-project mode-, use the a tcl build script for the ```<proj>``` option.

## Configure the InTime license and FPGA tool 

Do not proceed if you haven't done that. Please refer to [configuration](configuration_basic.md).

## Open An Example project

Once the installed vendor tools have been registered, an example project can be used to explore InTime. Example projects are available for all supported toolchains.

To open an example in the Tcl environment, use the `project open_example` command. For example:
```
    plunify> project open_example quartusii
    Successfully opened example project.
```

## Select a Recipe
---------------

An InTime Recipe represents a compilation and learning flow. For
example, Directive Exploration is a recipe that tries different
compilation \"directives\" in Vivado.

 
![Recipe flow
guide](images/quickstart/recipe_flow_basic_vivado.png)


 
 


!!! tip
    Plunify recommends starting with the *Hotstart* recipe at the beginning.


Based on your design, this recipe generates 3 rounds of compilation
using different synthesis and implementation options. The purpose of
this recipe is to learn about the dependencies between the design and
the tool parameters through multiple rounds of compilations, in order to
get the best timing results possible. A list of available recipes for
the Xilinx Vivado software is shown in
`Figure #figure-quickstart-vivado-recipes`.

 
![Typical Recipe
list](images/quickstart/recipes_vivado.png)


 
html

| 


Set Flow Properties
-------------------

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


 
html

| 


Optimize
--------

1.  Click \"Optimize\" as shown in
    `Figure #figure-quickstart-vivado-start-recipe`.

  
 ![Just click to
 begin!](images/quickstart/start_recipe.png)> 

2.  When InTime is running, the generated strategies and their statuses
    will automatically refresh (see
    `Figure #figure-quickstart-vivado-strategy-status`).

  
 ![Status of each strategy as the job
 progresses](images/quickstart/see_generated_strategies.png)
 

 **What is InTime doing?**

 a.  Analyze the design locally. If it is the first time, compile the
     design once, otherwise re-use existing results.
 b.  From the database, extract related learning data from previous
     builds.
 c.  Generate strategies according to the Runs Per Round and assign a
     new Job ID.
 d.  Look for available servers.
 e.  Replicate and distribute the project for the servers to compile.
 f.  After compilation, extract the results and delete temporary files.
     If any compilation exceeds the maximum specified runtime, stop it>     and clean up.

 
html

| 


Analyze Results
---------------

1.  After a successful compilation, a green circle will appear beside
    each strategy, along with the timing and area results (see
    `Figure #figure-quickstart-vivado-compilation-results`).

  
 ![Compilation
 results](images/quickstart/analyze_result_1.png)> 

2.  A green highlight for the result metric (Timing Score in this
    example) means that the result improved and yellow means that it got
    worse. You can sort the results by clicking the respective column
    header(s).

<a name...></a>

3.  Right-click and select "Analyze Job XX + Child Jobs" to see the rate
    of improvement and results across jobs (see
    `Figure #figure-quickstart-vivado-analysis-options` and
    `Figure #figure-quickstart-vivado-results-analysis`).

  
 ![Analysis
 options](images/quickstart/analyze_result_2.png)
 

  
 ![Results of all
 compilations](images/quickstart/analyze_result_3.png)> 

4.  Select "Multiple Job Analysis" to see the results across rounds as
    shown in
    `Figure #figure-quickstart-vivado-multiple-job-analysis`.

  
 ![Results improved from job to
 job](images/quickstart/analyze_result_4.png)> 

 
html

| 


Export Selected Result
----------------------

When you have obtained a good result, you can export it to your FPGA
software to verify the result. If not, continue to run more rounds.

To export a result for an XPR project,

1.  *Right-click* the desired result and choose "Export". In the example
    below, we choose the revision \"explore\_1\".
2.  You can apply the selected strategy to your project as a new
    revision or to the default revision. See
    `Figure #figure-quickstart-vivado-export-result` for all available export options.

  
 ![Export
 result](images/quickstart/export_result_vivado.png)> 

3.  You can accept the default revision name or specify a new one.

  
 ![Provide a new revision
 name](images/quickstart/export_result_newname_vivado.png)> 

4.  After exporting, open this project in your FPGA software. The
    revision that you exported, *explore\_1*, is now 2 new runs named
    *explore\_synth\_1* and *explore\_impl\_1* for the synthesis and
    implementation portions respectively.

  
 ![Switch to the exported
 revision](images/quickstart/xilinx_vivado.png)> 

5.  To verify the result, re-run your project to check that the timing
    result is the same as what is reported in InTime. You can view the
    reports provided by the FPGA software to understand more about the
    design.

  
 ![View the result in the FPGA
 software](images/quickstart/xilinx_vivado_TNS.png)
 

 The TNS and WNS values are equal to those reported by InTime. (Note:> These values are rounded to 2 decimal places in Vivado)

To export a result for a DCP checkpoint,

1.  *Right-click* the desired result and choose **"Export \> Save
    Strategy to Tcl Script\..."**. In the example below, we choose the
    revision \"explore\_1\".
2.  You can save the exported Tcl script *apply\_explore\_1.tcl* into
    any directory. See
    `Figure #figure-quickstart-vivado-export-result-dcp` for available export options.

  
 ![Export result via Save Strategy to Tcl
 Script\...](images/quickstart/export_result_vivado_dcp.png)> 

3.  Make a backup copy of the DCP checkpoint, and open it in Vivado.
4.  Go to the Tcl Console and source the exported
    *apply\_explore\_1.tcl* to apply the strategy and start compiling.

  
 ![Apply the exported Tcl
 script](images/quickstart/xilinx_vivado_tclconsole.png)> 

5.  The timing result should be the same as what is reported in InTime.

Further References
------------------

In summary, the Quick Start guide shows you how to run InTime, view the
results and export selected ones to your FPGA project. For more details
and tips on InTime features and flows, please refer to the full InTime
documentation (intime.pdf).
'