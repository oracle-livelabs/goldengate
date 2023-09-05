# Explore the Microservices UI

## Introduction

In this lab, you learn to monitor the Extract and Replicat processes that were created and run in the previous lab.

Estimated time: 2 minutes

### About Performance Monitoring

Monitoring the performance of your GoldenGate instance ensures that your data replication processes are running smoothly and efficiently. You can monitor performance in both the Oracle Cloud Infrastructure (OCI) GoldenGate Deployment Console as well as in the Oracle Cloud Console on the Deployment Details page.

### Objectives

In this lab, you will:
* View charts and statistics using the Performance Metrics Server in the GoldenGate deployment console
* Use Metrics on the Deployment Details page in the Oracle Cloud Console to determine overall instance health and utilization.

### Prerequisites

In order to complete this lab, you should have completed the preceding lab and have both an Extract and Replicat running.

## Task 1: Review connections

1.  Open the Extract menu (ellipses) and then click **GoldenGate Console**. 

    ![Click GoldenGate Console for Extract](./images/01-01-extract-gg-console.png " ")

2.  To log in to the GoldenGate console, enter oggadmin for user name and a password, and then click Sign In.

    ![GoldenGate console sign in](./images/01-02-gg-console-signin.png " ")

3. Open the navigation menu and then click Configuration.

    ![GoldenGate console overview](./images/01-03-gg-console-overview.png " ")

4. Click **Connect to database: sb2**. To verify a successful connection, checkpoint and trandata options become available

    ![GoldenGate console overview](./images/01-04-gg-console-configuration.png " ")


## Task 2: Review Extract details

1. On the Overview page, click the E5 Action menu, and select **Details** from the dropdown.

    ![Configuration page](./images/02-01-extract-details.png " ")

2.  On the **Process Information** screen, view the process details such as Trails, Encryption Profile, Managed Options, and Registration Information.

    ![Process Information page](./images/02-02-process-info.png " ")

3.  On the **Checkpoint** screen, view the Checkpoint Basic Information, Input Checkpoints, and Output Checkpoints. 

    ![Checkpoint page](./images/02-03-checkpoint.png " ")

4.  On the **Statistics** screen, view the Data Definition Language (DDL) and Table Statistics. 

    ![Statistics page](./images/02-04-statistics.png " ")

5.  On the **Cache Manager Statistics** screen, view the Current Memory Usage, Current Memory Used Breakdown, Objects Pool Statistics, File Caching, Global Cache Object Statics, and Cache Object Size Distribution. 

    ![Cache Manager Statistics page](./images/02-05-cms.png " ")

6.  On the **Parameters** screen, view the parameters in use. 

    ![Parameters page](./images/02-06-parameters.png " ")

7.  On the **Report** screen, view the extract report.

    ![Report page](./images/02-07-report.png " ")

## Task 3: Review Replicat details

1. On the Overview page, click the R9 Action menu, and select **Details** from the dropdown.

    ![Launch console](./images/03-01-replicat-details.png " ")

2.  On the **Process Information** screen, view the process details such as Encryption Profile, and Managed Options.

    ![Process Information page](./images/03-02-process-info.png " ")

3.  On the **Checkpoint** screen, view the Checkpoint Basic Information, and Input Checkpoints. 

    ![Checkpoint page](./images/03-03-checkpoint.png " ")

4.  On the **Statistics** screen, view the Table Statistics, Parallel Replicat, and Workload Dependency Statistics.

    ![Statistics page](./images/03-04-statistics.png " ")

5. On the **Parameters** screen, view the parameters in use. 

    ![Parameters page](./images/03-05-parameters.png " ")

6.  On the **Report** screen, view the replicat report.

    ![Parameters page](./images/03-06-report.png " ")

7.  On the **Heartbeat** screen, view the Heartbeat Information and Latest Heartbreats. Click **See History** to view the replicat's Heartbeats History.

    ![Report page](./images/03-07-heartbeat.png " ")

## Task 4: Monitor the pipeline

For advanced monitoring you can open the GoldenGate microservices console.

1. In the GoldenGate deployment console, click **Performance Metrics Service**, and then click the Extract process (in this example, E5).

    ![Performance Metrics Service](./images/04-01-performance-metrics-service.png " ")

2. Under **Process Performance**, monitor the performance of the extract.

    ![Process Performace](./images/04-02-process-performance.png " ")

3. Repeat Task 4, steps 1-2, to monitor the performance of the R9 replicat.

## Learn more

* [Monitor performance using the Oracle Cloud console](https://docs.oracle.com/en/cloud/paas/goldengate-service/vddvk/index.html#articletitle)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Alex Lima, Database Product Management & Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, July 2023
