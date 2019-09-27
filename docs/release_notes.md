Release Notes
=============

For the latest release notes, please refer to [https://support.plunify.com/en/intime-release-notes/](https://support.plunify.com/en/intime-release-notes/)


### 2.6.13 Release Notes

The following new features, improvements, and fixes are available:  
**New**

- Increased range of placement explorations via netlist analysis, to get larger timing variations
- Enabled custom Vivado hook scripts to be invoked to perform specific initialization steps e.g. setting the maximum number of CPU threads for a project.

Improvements

- Updated “Hot Start” strategies with updated benchmark data based on newer device families.
- Added analysis of multi-die timing and utilization reports.

Fixes

- Corrected a concurrent build issue where some distributed processes were not started in parallel.
- Corrected a mistake in displaying Job IDs.
- Cleaned up display fonts in Linux.

### 2.6.12 Release Notes

The following new features, improvements, and fixes are available:  
**New**

- Introduced beta support for Vivado non-project mode Tcl scripts.
- Added feature to select ‘Extra Opt’ strategies.
- Added support for Quartus Prime Pro 19.1.1, 19.1.2, 19.2.0, 19.2.1, 19.2.2

Improvements

- Save intermediate checkpoints so that optimization can start at any point in a strategy (Vivado only).
- Use non-optimized registers and cells for ‘Placement Exploration’ in order to avoid cases where circuits elements were dynamically optimized away.

Fixes

- Rectified an issue where the Tcl and Private Cloud Console were not displayed in the InTime GUI.
- Fixed an issue where icons were missing from the automated  notification email.

### 2.6.11 Release Notes

The following new features, improvements, and fixes are available:  
**New**

- Added support for Vivado 2019.1
- Added feature to save the top ‘N’ (user-configurable, defaults to 999) checkpoints for a project.

Improvements

- Updated “Hot Start” strategies for Quartus Prime Pro 19.1.0.
- Reduced timing summary report file size to minimize impact on diskspace.

Fixes

- Fixed an issue where project-specific toolchain .ini files were out of sync.
- Rectified an error that occurs when running Quartus builds in parallel in an InTime Private Cloud environment.

### 2.6.10 Release Notes

The following new features, improvements, and fixes are available:  
**New**

- Added admin page for setting up license, toolchains.
- Added Plutil.sh and Plutil.bat tool to check license usage.
- Added number of Design Check Point (DCP) files to retain after a job completes.
- Added a -wd argument in InTime Server to allow the user to specify the log file directory.

Improvements

- Removed Power as one of the optimization Goals.
- Improved the InTime Server installer to allow the user to choose the type of server installation.

Fixes

- Fixed a problem where creating a directory may fail for InTime Server.

### 2.6.9 Release Notes

The following new features, improvements, and fixes are available:  
**New**

- Ability to automatically retry individual builds when specific errors e.g. licensing failures are detected. Users are able to use regular expressions to define the type of build errors that they want InTime to recognize in order to retry the build.
- Denote builds with unrouted nets with a purple icon in the InTime GUI.

Improvements

- Removed result reporting commands to speed up implementation time.
- Set the ‘Regenerate IP Targets’ Flow Property to False by default as most users have already generated output products for IP cores before using InTime. Not regenerating saves time.
- Improved readability of user messages output by the Plunify Cloud plugin.
- Changed InTime Default strategy names to ‘idefault_1’, ‘idefault_2’, … , ‘idefault_<N>’ to associate them better with the recipe.
- Removed spurious email notification warnings.
- Reduced the severity of unrouted nets from an Error to a Warning, in accordance with Vivado behavior.
- Made the number of runs in the Vivado Hot Start recipe changeable by the user, in case compute resources are insufficient.

Fixes

- Rectified an issue that caused design runs to be flagged erroneously as out-of-date.
- Corrected a bug that did not properly validate IP addresses containing leading 0s.
- Fixed an issue with the synthesis retry mechanism.
- Increased the range of allowed InTime Server port numbers in the InTime GUI.
- Fixed a problem with recognizing Vivado Answer Record patches.

### 2.6.0 through 2.6.8 Release Notes

Licenses for 2.6.x are required. Please make a copy of the .plunify folder if you are upgrading from an older version. The following new features, improvements, and fixes are available:  
**New**

- Added Private Cloud support for file clean-up
- Import/Export Wizard for transferring learning data between InTime clients
- Support for Vivado 2018.2.x
- **New** Incremental Compilation recipe (Vivado only)
- Support for Plunify Cloud as an InTime Run Target
- The Explorer Recipe in Vivado is replaced with the Hot Start Recipe

Improvements

- Usability enhancements for Plunify Cloud plugins
- Extended wait time for worker availability in the InTime Agent to handle slow networks
- Improved Extra Opt Recipe with new strategies and finer controls for maximum iterations and termination condition
- Results exported from InTime now contains Worst Hold Slack (WHS) information
- The Private Cloud .result command shows post-placement Worst Negative Setup Slack (WNS) and Total Negative Slack (TNS)
- Disabled “Export Tcl” option while a strategy is running to prevent state corruption
- Stop InTime runs if there is a routing problem e.g. unrouted nets
- Reduced result extraction time when “Skip Parent Revision” is enabled.
- Improve CPU/RAM utilisation reporting by averaging across multiple CPU cores.
- Display post-placement timing results in gray in the Run History window.
- Updated Hot Start Recipe with latest training data.
- Make each Flow Property category collapsible.
- QR code for exporting results now contains the MAC address

Fixes

- Fixed usability issues in Plunify Cloud plugins
- Fixed an issue with detecting the last-used Vivado version
- Fixed a crash that happened because of RSS feeds
- Fixed a GUI refresh problem where the Maximum Runtime was not updated in batch mode
- Fixed a Deep Dive recipe issue that caused it not to use the best results for analysis
- Fixed a GUI bug showing unknown characters
- Fixed a parsing bug for monitoring of bsub messages to determine job success/ failure
- Fixed a Placement Exploration issue with using a Plunify Cloud parent
- Fixed a Placement Exploration bug in replicating cells.
- Fixed a problem with Vivado directives and non-directive when using the Settings Filter Locklist.
- Show all failing setup and hold paths for all models for Intel designs
- Standardize sorting between Settings Filters and selected results.

### 2.5.x Release Notes

Licenses for 2.5.x are required for this version. Please make a copy of the .plunify folder if you are upgrading from an older version. The following new features, improvements and fixes are included:  
**New**

- Speed up turnaround time by automatically stopping builds based on post-placement timing estimates.
- Reduce bandwidth demand and result download time by adding an option to download results without downloading compilation output files e.g. netlists.
- Support for Quartus Prime Pro 17.1, Vivado 2017.3 and Vivado 2017.4.
- Resume a recipe after a stop or crash.

Improvements

- Automatically adjust input ranges for the Clock Margin Exploration recipe (Vivado).
- Dynamically change the maximum run time for Private Cloud jobs.
- Added optimization strategies to the Extra Opt recipe (Vivado).
- Deep Dive recipe now warns users about insufficient number of results, instead of reporting an error.
- Faster communication between the InTime agent and the InTime server.
- InTime terminates faster when an invalid parent revision is selected.

Fixes

- Fixed a bug where Vivado processes were not terminated properly.
- Remedied an issue where InTime reported an error when the optimization Goal was met.
- Fixed a display problem where the InTime splash screen was not always at the top.
- Rectified an error in the Re-run Strategies recipe where the wrong strategies were re-run.
- Grey out invalid properties according to different Run Targets.
- Corrected a bug where the Power column values were blank for Arria 10 designs.
- Fixed an issue where user-defined tags for results were wrongly deleted.
- Rectified a bug in which the “Just Compile My Design” recipe could not execute on the Private Cloud.

### 2.4.x Release Notes

Licenses for 2.4.x are required for this version. Please make a copy of the .plunify folder if you are upgrading from an older version. The following new features, improvements and fixes are included:  
**New**

- Added support for Stratix 10 device family in Quartus Prime Pro 17.1 (Early Access)
- Added .result command in the Private Cloud Console to display result in a formatted table.
- Enable the user to choose a specific clock for the Fmax display.
- Support for a “<port number>@<IP>”-type license string in the LM_LICENSE_FILE environment variable to specify the port and location of InTime Server.
- Added -tc argument to InTime for quickly specifying the target toolchain.

Improvements

- Better error handling with more informative messages and stack traces.

Fixes

- Rectified an issue with the Clock Margin recipe (for Vivado) which led to invalid strategies after generation and export.
- Fixed a bug in InTime Server where a worker was assigned a JobID 0.
- Fixed a display bug whereby a textbox turned black in color after applying a verification code.
- Corrected Fmax calculation in cases where timing slack is positive (timing has already passed).

### 2.3.0 Release Notes

Licenses for 2.3.x are required for this version. Please make a copy of the .plunify folder if you are upgrading from an older version. The following new features, improvements and fixes are included:  
**New**

- Support for Quartus Standard 17.0.0 and Quartus Pro 17.0.0.
- **New** clock margin exploration recipe.
- Add line number beside session log.

Improvements

- InTime will now stop if Disk quota exceeded is detected.

Fixes

- Fixed an issue where project path with blank space.

### 2.2.3 Release Notes

Licenses for 2.2.x are required for this version. Please make a copy of the .plunify folder if you are upgrading from an older version. The following new features, improvements and fixes are included:
Fixes

- Fixed an issue regarding JobID was not returned correctly.

### 2.2.2 Release Notes

Licenses for 2.2.x are required for this version. Please make a copy of the .plunify folder if you are upgrading from an older version. The following new features, improvements and fixes are included:
Fixes

- Fixed an issue regarding GUI freezes sometimes.

### 2.2.1 Release Notes

Licenses for 2.2.x are required for this version. Please make a copy of the .plunify folder if you are upgrading from an older version. The following new features, improvements and fixes are included:
Improvements

- Enhanced results-syncing speed
- Improved Vivado design compilation time by removing extraneous steps.
- Improved Vivado placement exploration recipe and supported design without requiring false path.

Fixes

- Fixed an issue regarding improper detection of RAMB36/FIFO elements in Vivado utilization reports.
- Fixed an issue where the goal-met check at the beginning of a new round used the wrong result for comparison.
- Fixed a case when InTime was not able to handle a corrupted Vivado project.

### 2.2.0 Release Notes

Licenses for 2.2.x are required for this version. Please make a copy of the .plunify folder if you are upgrading from an older version. The following new features, improvements and fixes are included:  
**New**

- Support for Vivado 2017.1.
- Evaluation users can now generate a dynamic code in order to export a result for verification purposes.
- Option to right-click on a revision and create the programming file (Vivado-only).
- Users can now specify synthesis and implementation run names to be used in the strategy export scripts.

Improvements

- Enhanced results-syncing interface to make it simpler to use.
- Significantly reduced the runtime of Extra Opt Exploration (Vivado-only) operations by re-using routed netlists when possible.
- Made it easier to solve overfitting issues automatically by adding more settings that are beneficial for resource utilization.
- Make license usage reports for the Private Cloud available via a web browser.

Fixes

- Fixed an issue where the PLACEMENT_TYPE setting had more possible values than planned.
- Fixed a problem where the Goal Based Target from the parent revision was used for the current revision.

### 2.1.0 Release Notes  
**New**

- Revamped mechanism for syncing results between multiple users, machines and projects to make it much easier than before.

### 2.0.1 Release Notes

Licenses for 2.0.x are required for this version. Please make a copy of the .plunify folder if you are upgrading from an older version. The following new features, improvements and fixes are included:
Fixes

- Fixed an issue where the Quartus Automatic Placement recipe stalls on a corner case.

### 2.0.0 Release Notes

Licenses for 2.0.x are required for this version. Please make a copy of the .plunify folder if you are upgrading from an older version. The following new features, improvements and fixes are included:  
**New**

- Auto Placement in Quartus Prime Pro (see an overview here).
- Tcl script to censor relevant sections of InTime logs for ease of feedback.
- Enable the user to associate projects together to share learning insights (Quartus only).
- Better keyboard support for Linux Operating System.
- View license usage report in InTime Server.

Improvements

- Placement Exploration (original blog post) now checks Site Type before assigning a new placement location.
- Placement Exploration now generates placements without the need for previous InTime-compiled results.
- Output error if a Private Cloud worker is running out of disk space before starting compilation.
- Make automatic design overfit adjustments persistent across multiple InTime rounds.
- Inherit Auto Placement settings from parent revision(s).
- Increased the range of possible adjustments for Placement Exploration.

Fixes

- Fixed an issue where a Vivado parent revision results were not re-used when the design was unchanged.
- Fixed an issue where ISE and Vivado results were not displayed correctly when the compilation failed to complete.
- Fixed an issue where design compilation fails if the Quartus project has user-defined partitions.
- Fixed an issue where a DCP project was unnecessarily re-implemented during Extra Opt Exploration.

### 1.6.0 Release Notes

Licenses for 1.6.x are required for this version. Please make a copy of the .plunify folder if you are upgrading from an older version. The following new features, improvements and fixes are included:  
**New**

- Automatic Placement adjustments for Quartus-II / Quartus Prime Standard Edition designs to improve timing performance.
- Automatic Placement exploration for Vivado designs to improve timing performance.
- Auto-correction of resource over-fitting for Quartus-II and Quartus Prime designs.
- Support for Vivado 2016.4 and Quartus Prime Standard and Pro Edition 16.1.

Improvements

- Imposed a 1-hour timeout on the downloading of files by Private Cloud worker processes, so that if the network becomes bogged down, compilation jobs can still continue.
- Speeded up build runtimes via better use of CPU threads.
- Separated the license server and job controller components of the InTime Server, in order to reduce the burden on the license machine.
- Improved color coding for the results displayed in the InTime client for ease of interpretation.
- Made error and warning messages easier to understand in general.
- Merged the Vivado Directive Exploration and Non-directive Exploration recipes into the InTime Default recipe for greater ease of use.

Fixes

- Added support for the Exceed X-client in the JP locale.
- Worked around a bug in Vivado where paths to .coe (IP Coefficient) files were set incorrectly.
- Fixed an issue where generated results in a Vivado project were not copied to the compilation processes.
- Corrected issues with compilation of DCP projects in Private Cloud mode where the job was unable to proceed to the subsequent round despite having valid results.

### 1.5.13 Release Notes

Licenses for 1.5.x will be valid for this version. Please make a copy of the .plunify folder if you are upgrading from an older version. This version includes the following fixes, improvements and new features.  
  
**New**

- Support for Quartus Prime Pro Edition (16.0 only).
- Added “Memory Usage” and “Concurrent Build Overview” options to the Private Cloud Console menu for quicker access to this information.
- Worst Slack values in the results panel are now color-coded
- (Green: better than the original result; yellow: worse; white: unchanged).
- Long column headings in the results panel are now wrapped to the next line for ease of viewing.
- Added the build number to the InTime installer’s display, so that it is easier to distinguish between InTime versions.

Improvements

- Improved accuracy of the Deep Dive algorithm in ISE designs, for faster timing closure.

Fixes

- The Vivado Extra Optimization recipe now clears the “strategy prefix” field properly.
- Fixed a bug where the sorting by area in the Goal-based plots was not done correctly.
- Timing estimates are now displayed in grey in the results panel.

### 1.5.11 Release Notes

Licenses for 1.5.x will be valid for this version. We encourage you to make a copy of the .plunify folder if you are upgrading from an older version. This version includes the following fixes and features.  

**New**

- Display failing paths in “selected result” tab for Vivado results
- Show interim results for “Extra Optimization” recipe even when it times out or error out
- Enable auto maximum run time

Fixes

- Learning bug that happened only on Windows OS
- InTime does not inherit existing directives from parent revisions correctly
- Some errors in ISE  not flagged properly
- Stop Recipe does not terminate processe properly
- Vivado 2016.x does not compile example project properly as it was generated from older Vivado versions
- File conflicts when InTime agents are cleaning up files, causing new runs to fail
- Vivado results export bug if root parent has non-default directives
- Synthesis Exploration not working when using Vivado 2016.x
- Cursor remained as an hourglass after “Stop Recipe”
- License information length can cause connection to reset or timeout

Changed

- Added a feature to intimeserver.jar to use a properties.ini file to set properties.
- Improved logging and test scripts for InTime Agent for troubleshooting
- Settings filters are cleared when InTime is stopped
- Enabled a timeout for some dialog boxes
- Do not show Pulse Width for ISE results
- Updated QuartusII settings in InTime
- Disabling “re-run” results for custom parent revision
