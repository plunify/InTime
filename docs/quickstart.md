Quick Start for InTime 
=============================

## 1. Start InTime

After installation, there are 2 ways to run InTime

* Desktop shortcuts for both InTime (and InTime Agent). Double-click the InTime desktop shortcut shown in below. 

	![InTime Desktop Icon](images/quickstart/intime_logo_circled_48.png)
 

* Open a command line terminal and enter the following command: 

    OS | Path
    ---|---
	**Linux** | ```<InTime installation directory>/intime.sh```
	**Windows** | ```<InTime installation directory>/intime.exe ```

Note that there are additional arguments required if you are running in Tcl mode or batch mode. Please refer to this [page](intime_command_arguments.md) for more information about InTime arguments.

---

## 2. Install the InTime license and configure FPGA tool settings 

Do not proceed if you haven't done that. Please refer to [configuration](configuration_basic.md).

---

## 3. Open An Example Project

Once the installed vendor tools have been registered, go to *File* -> *Open Example Project*. A list of possible projects based on your installed toolchain will be displayed.  

![Examples](images/quickstart/example_projects.png)

Select the right project and click to open your FPGA project. If successful, the project name will be displayed, similar to the one shown below
  
![Project successfully opened](images/quickstart/proj_opened.png)

The next step is to select an InTime recipe. A recipe represents a compilation and learning flow. 

- For **Vivado**, proceed to the next [section](#using-vivado).
- For **ISE**, click [here](#using-ise) to jump to this section.
- For **Quartus**, click [here](#using-quartus) to jump to this section.

---

## 4. Select A Recipe 

### Using Vivado  

A list of available recipes for the Xilinx Vivado software is shown below. Click on the "Recipe" dropdown box to view this list.

![Typical Recipe list](images/quickstart/recipes_vivado.png)

For this quickstart, we will select a "**HotStart**" recipe. 

!!! Note "What is the "hotstart" recipe?"
    This recipe predicts the strategies using existing model within InTime. The purpose of this recipe is to quickly get to an optimal result within a shorter time frame by exploring only placement & routing settings.

    This recipe will generate 1 round up to 40 compilations. Even if it does not meet the required timing performance, the data generated establish a baseline of performance and serve a secondary purpose of becoming training data for future rounds. 

!!! tip
    For a new Vivado project, Plunify recommends starting with the *Hotstart* recipe.

**Configure the flow properties**

For the HotStart recipe, configure the following properties below.

* Run Target: **Local**
* Runs Per Round: **20** (You can go up to 47.)
* Rounds: **1** (This is fixed in HotStart.)
* Concurrent Runs: **2** (This can be higher based on your machine's resources.)

![HotStart](images/quickstart/hotstart.png)

if you are running on multiple machines (Private Cloud), update the flow properties to match the following:

    Run Target      : Private Cloud
    Runs Per Round  : 10
    Rounds          : 1
    Concurrent Runs : 2


Once that is done, jump to the "[Start Optimization](quickstart.md#5-start-optimization)" section.

---

### Using ISE

For ISE, we will select the "Default" recipe. This recipe generates different synthesis and implementation options. The purpose of this recipe is to learn about the dependencies between the design and the tool parameters through multiple rounds of compilations. Note that the list of recipes available for ISE is different from other toolchains.

![Default](images/quickstart/recipes_ise.png)


**Configure the flow properties**

For the default recipe, configure the following properties below.

* Run Target: **Local**
* Runs Per Round: **20** (You can go up to 40.)
* Rounds: **3** (More rounds can be configured here.)
* Concurrent Runs: **2** (This can be higher based on your machine's resources.)

![Default](images/quickstart/default.png)

if you are running on multiple machines (Private Cloud), update the flow properties to match the following:

    Run Target      : Private Cloud
    Runs Per Round  : 10
    Rounds          : 1
    Concurrent Runs : 2

Once that is done, jump to the "[Start Optimization](quickstart.md#5-start-optimization)" section.

---


### Using Quartus 
 
For Quartus, we will select the "Default" recipe. This recipe generates different synthesis and implementation options. The purpose of this recipe is to learn about the dependencies between the design and the tool parameters through multiple rounds of compilations. Note that the list of recipes available for Quartus is different from other toolchains.

![Quartus Recipes](images/quickstart/recipes_quartus.png)


**Configure the flow properties**

For the default recipe, configure the following properties below.

* Run Target: **Local**
* Runs Per Round: **20** (You can go up to 40.)
* Rounds: **3** (More rounds can be configured here.)
* Concurrent Runs: **2** (This can be higher based on your machine's resources.)

![Default](images/quickstart/default.png)

if you are running on multiple machines (Private Cloud), update the flow properties to match the following:

    Run Target      : Private Cloud
    Runs Per Round  : 10
    Rounds          : 1
    Concurrent Runs : 2

Once that is done, jump to the "[Start Optimization](quickstart.md#5-start-optimization)" section.

---


## 5. Start Optimization

You are all set! Click on the "Optimize"" button as shown below
    
![Just click to begin!](images/quickstart/start_recipe.png)

You will be prompted to confirm the the flow properties. This is intended as a reminder for users to double check their flow properties, especially properties like "Maximum RunTime". 

![Confirm Properties](images/quickstart/confirm_properties.png)

When InTime is running, the generated strategies and their statuses will automatically refresh in the history. 
  
![Status of each strategy as the job progresses](images/quickstart/see_generated_strategies.png)

For "Private Cloud" setup, Open the *Private Cloud Console* and type `.status` to verify that the needed agents are alive and free.

!!! Note "What is InTime doing?"
    a.  Analyze the design locally. If it is the first time, compile the design once, otherwise re-use existing results.  
    b.  From the database, extract related learning data from previous builds.  
    c.  Generate strategies according to the Runs Per Round and assign a new **Job ID**.  
    d.  Replicate and distribute the project (to 1 or many machines) to compile.  
    e.  When done, extract the results and clean up temporary files.  

Refer to the InTime [Flow Overview](intime_flow.md) for more details. 

--- 

## 6. Analyze Results

 After a successful compilation, a green circle will appear beside each strategy, along with the timing and area results.

![Compilation results](images/quickstart/analyze_result_1.png)

A green highlight means that the result improved and yellow means that it got worse. You can sort the results by clicking the respective column header(s). For more information about what the icons mean, refer to this [page](gui.md#project-history-icons) about project history icons.

Right-click and select "Analyze Job XX + Child Jobs" to see the rate of improvement and results across jobs.
  
![remove results prompt](images/results/right_click_analysis.png) 
 
![results overview](images/analyze/results_overview.png) 

Refer to the [Analyze Results](analyze.md) page for an explanation of all the features.

---

## 7. Export Selected Result

When you have obtained a good result, you can export it to your FPGA software to verify the result. The TNS and WNS values must correspond to those reported by InTime. 

### To XPR project

1. *Right-click* the desired result and choose "Export". In the example below, we choose the revision "explore_1".

2. You can apply the selected strategy to your project as a new revision or to the default revision. See below for all available export options. ![Export result](images/quickstart/export_result_vivado.png)

3. You can accept the default revision name or specify a new one. ![Provide a new revision name](images/quickstart/export_result_newname_vivado.png)

4. After exporting, open this project in your FPGA software. The revision that you exported, *explore\_1*, is now 2 new runs named *explore_synth_1* and *explore\_impl\_1* for the synthesis and implementation portions respectively. ![Switch to the exported revision](images/quickstart/xilinx_vivado.png)

5. To verify the result, re-run your project to check that the timing result is the same as what is reported in InTime. 

### To DCP checkpoint

*Right-click* the desired result and choose **"Save Strategy to Tcl Script..."**. In the example below, we choose the revision "hotstart_3".

You can save the exported Tcl script `apply_hotstart_3.tcl` into any directory. 
![Export result via Save Strategy to Tcl Script](images/quickstart/export_result_vivado_dcp.png)

Make a backup copy of the DCP checkpoint, and open it in Vivado. Go to the Tcl Console and source the exported `apply_hotstart_3.tcl` to apply the strategy and start compiling.

![Apply the exported Tcl script](images/quickstart/xilinx_vivado_tclconsole.png)

Re-run your build to verify the timing results.

### To XISE project

1. *Right-click* the desired result and choose "Export". In the example below, we choose the revision "calibrate_12".

2. You can apply the selected strategy to your project. ![Export result](images/quickstart/export_result_ise.png)
 
3. After exporting, open this project in ISE. ![Switch to the exported revision](images/quickstart/xilinx_ise.png)

4. To verify the result, re-run your project to check that the timing result is the same as what is reported in InTime. You can view the reports provided by the FPGA software to understand more about the design. ![View the result in the FPGA software](images/quickstart/xilinx_ise_TNS.png)


### To Quartus project

1. *Right-click* the desired result and choose "Export". In the example below, we choose the revision "calibrate_175". ![Export result](images/quickstart/export_result_quartus.png)

2. You can apply the selected strategy to your project as a new revision or to the default revision. ![Provide a new revision name](images/quickstart/export_result_newname_quartus.png)

3. After exporting, open this project in your FPGA software. Switch the active revision to the one that you exported. ![Switch to the exported revision](images/quickstart/altera_quartusII.png)

4.  To verify the result, re-run your project to check that the timing result is the same as what is reported in InTime. ![View the result in the FPGA software](images/quickstart/altera_quartusII_TNS.png)
