Using Hook Scripts 
==================

### Overview

InTime supports customized recipe hook scripts for Vivado and InTime. These allows user specific .tcl scripts and commands to be executed when running existing InTime recipes.

## Recipe hook scripts

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

## Vivado hook scripts

From InTime 2.6.11 onwards, InTime supports 2 types of hook scripts. These hook scripts are required to be placed in the `/.plunify/intime_vivado_hook/` folder. You can use this hook scripts to configure Vivado specific parameters like *maxthreads* 

Filename                     | When is it read
-----------------------------| ----------------
intime_vivado_pre_proj.tcl   | InTime will source this file **before** opening the project. 
intime_vivado_post_proj.tcl  | InTime will source this file **after** the project is opened.
