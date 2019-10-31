Running Multiple Jobs
=====================

InTime enables multiple jobs to be run at the same time. This feature provides the flexibility to switch to another job or free up the resources temporary for other tasks. 

To stop a job or switch to another job, just click on the "Stop" button.  


!!! Note "Different Run Targets"
	Stopping a job for different run targets will have different effects. There are 3 types of run targets. To understand more, refer to [Run Target](flow_properties.md#general-properties) flow property.

## Local 

If a `Local` job is stopped, there are 2 options

1. Stop and discard incomplete results
2. Stop and Keep incomplete results

Note that if the results are discarded, the run can be resumed later. If the incomplete results are saved, only a re-run is possible. Completed results will not be affected. In both options, the current job running on the local machine will be terminated. 

A local job can be resumed if these conditions are met 

1. There are strategies which are not started in the job. If a strategy has a result (the strategy icon is either orange or green), it will not be resumed even if it is incomplete. 

2. The parent of the round is the original revision. 

Once the job is stopped, another job or project can be started.

## Private Cloud 

The `Private Cloud` run target allows strategies to be distributed across multiple machines. Typically after distributing the runs to multiple computers, InTime will stay in a loop to monitor the progress of the job. During the monitoring process, InTime will also download any results that are completed and update the history. This monitoring process can be stopped if required. For example, shutting down the computer that InTime is running on, or switching the computer where InTime is running.

If a `Private Cloud` job is stopped, there are 2 options

1. Stop the monitoring process 

2. Stop the job and terminate all the strategies. 

For option 1, the original job will continue to run in multiple computers, only the monitoring is stopped. 

For option 2,  the job is terminated and all the process runnig in the multiple computers will be stopped.

After the job has stopped, the user can switch to a different recipe or project and start a new job. There is no limit on the number of jobs that can be run at the same time. If option 1 is selected, to resume the monitoring of the original job, select the original job in the GUI, right click and choose "Resume". 

For option 2, only runs that do not have a result can be resumed.


## Plunify Cloud

The `Plunify Cloud` platform utilizes public cloud providers, such as Amazon Web Services (AWS) to run FPGA builds in the cloud.  The Plunify Cloud works on a credit based, pre-paid, pay-as-you-use model. A registered user account is required in order to use the Plunify Cloud run target.

Compared to Private Cloud job, after submitting a job, InTime will not monitor the job. Instead when a job completes, an email will be sent to the user email address. Hence, stopping a Plunify Cloud job means terminating all the running builds on the Plunify Cloud. Completed runs will not be affected and results will be available for download.

The "Resume" function is not supported on Plunify Cloud. To resume a run, please use the [Rerun](recipes.md#rerun-strategies) recipe and select the required runs.

For more information on how to buy credits as well as credit pricing, please refer to the [Plunify Credits Store](https://cloud.plunify.com).