Understanding Run Targets
=========================

A run target specifies where and how InTime implements the strategies
generated during `intime_flow`{.interpreted-text role="doc"}. The *Run
Target* (`run_target`) flow property allows the user the specify the
target to use for a specific job.

InTime automatically takes over tasks such as distributing, running,
retrieving results and finally collating the results in a consistent
project history.

Local
-----

The local run target runs strategies on the local machine. The
*Concurrent Runs* (`concurrent_runs`) flow property controls how many
strategies are run in parallel on the local machine. The concurrent run
limit is capped by the number of processors available on the local
machine, or the run limit enforced by the available licenses, whichever
is the greatest.

Private Cloud {#run-targets-private-cloud}
-------------

The private cloud run target allows strategies to be evaluated across
multiple machines within a company's internal network or datacenter.

### Network Architecture

The private cloud architecture consists of a master controller (referred
to as the private cloud server through the documentation), along with
*n* number of clients. The master controller runs the InTime private
cloud server software, while each worker runs an instance of InTime
called the InTime Agent.

A visualization of this architecture is shown in
`Figure #figure-run-targets-private-cloud`.

 {#figure-run-targets-private-cloud}
![Private Cloud Network
Architecture](images/run_targets/private_cloud_network.png)


Any client (typically referred to as the *source* of a job) connected to
this network can submit a new job using InTime. Once submitted, the
private cloud server will auto-assign (or when no workers are available,
queue) the job to a number of workers. Each assigned worker's agent
will download the required files from the server, run the required
strategies and finally upload the results to the server.

While the job is running, InTime running on the source can either
continuously poll the server and download results as they become
available from the workers, or the source can be used for other tasks
and the results can be downloaded at some convenient time in the future.

### Network Components

#### InTime Server (master controller)

The role of the master controller is to accept incoming requests from
the workers. Every time a worker sends a heartbeat to the master, the
master acknowledges and a handshake is established.

The master is listening on 2 ports and it is important for the server's
firewall to accept the incoming connection.

-   **Communication file port:** The port used for InTime communication.
    Make sure firewall or iptables allows incoming for the port.
    Default: `39940`
-   **File transfer port:** The port used for file transfer operations.
    Make sure firewall or iptables allows incoming for the port.
    Default: `39941`

#### Agents (workers)

Agents acts as workers in the private cloud architecture. The following
network parameters needs to be configured for each worker:

-   **Server host address:** The host address of the master controller
    (private cloud server).
-   **Communication file port:** The port used for InTime communication.
    Default: `39440`

The recommended way to specify these parameters is through the `-ip` and
`-comport` arguments of the InTime Agent process. For more information
on starting agents see `private_cloud_start_agents`{.interpreted-text
role="ref"}.

Every time the InTime Agent is launched it will perform a network
connectivity and licensing check which are both required to pass in
order for the agent to launch successfully. Once started, each worker
will send regular heartbeats to the InTime Server to indicate that it is
still alive. For more information see
`private_cloud_configuration`{.interpreted-text role="ref"}.

Plunify Cloud {#run-targets-plunify-cloud}
-------------

The Plunify cloud platform utilizes the Amazon cloud to enable running
of strategies using the massive computing power available by the Amazon
platform. The Plunify cloud works on a credit based pre-paid,
pay-as-you-use model and therefore no InTime license is required to use
Plunify cloud. For more information on how to buy credits as well as
credit pricing, please refer to the [Plunify Credits
Store](https://cloud.plunify.com).

A Plunify user account is required in order to use the Plunify cloud.
When submitting a Plunify cloud job InTime will prompt for the user
credentials of the account to use for the current job. Once
authenticated,the number of credits linked to the account will be
checked and if sufficient credits are available for the job, InTime will
submit the job.
'