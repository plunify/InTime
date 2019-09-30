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

For older release notes, please refer to [https://support.plunify.com/en/intime-release-notes/](https://support.plunify.com/en/intime-release-notes/)
