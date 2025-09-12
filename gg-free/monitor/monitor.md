# Explore the Microservices UI

## Introduction

In this lab, you learn to monitor the Extract and Replicat processes that were created and run in the previous lab.

Estimated time: 2 minutes

### About Performance Monitoring

Monitoring the performance of your GoldenGate instance ensures that your data replication processes are running smoothly and efficiently. You can monitor performance in both the Oracle Cloud Infrastructure (OCI) GoldenGate Deployment Console as well as in the Oracle Cloud Console on the Deployment Details page.

### Objectives

In this lab, you will:
* Review the Oracle GoldenGate Microservices, such as, Administration Service, Distribution Service, Performance Metrics Service, and Receiver Service. 
* View charts and statistics using the Performance Metrics Server in the GoldenGate deployment console
* Use Metrics on the Deployment Details page in the Oracle Cloud Console to determine overall instance health and utilization.

### Prerequisites

In order to complete this lab, you should have completed the preceding lab and have both an Extract and Replicat running.

## Task 1: Review GoldenGate Console

1.  From the list of pipelines, select **demo-pipeline**. 

    ![List of pipelines](./images/01-01-pipelines-list.png " ")

2. Open the Extract menu (ellipses) and then click **GoldenGate Console**. 

    ![Click GoldenGate Console for Extract](./images/01-02-extract-gg-console.png " ")

3.  To log in to the GoldenGate console, enter **oggadmin** for your Username. For password, paste the **Global Password** from the Reservation Information. Click **Log in**.

    ![GoldenGate console sign in](./images/01-03-gg-console-signin.png " ")

4. You're directed to the **Administration Service** page. You can view and manage Extract and Replicat process details, reports, and statistics.

    ![GoldenGate console overview](./images/01-04-gg-console-overview.png " ")

5. Select **Distribution Service**. You can view and manage Distribution Paths and Target-Initiated Paths details.

    ![GoldenGate console overview](./images/01-05-dist-services.png " ")

6. Select **Performance Metrics Service**. You can view service and process performance metrics.

    ![GoldenGate console overview](./images/01-06-pms.png " ")

7. Select **Receiver Service**. You can view and manage Distribution Paths and Target-Initiated Paths details, and filter Log Information. You can filter the log information by clicking **Search By** and selecting Severity, Date, and/or Message from the dropdown.

    ![GoldenGate console overview](./images/01-07-receiver-service.png " ")

## Task 2: Review connections

1. On the **Administration Service** screen, click **DB Connections**. Connections listed in **DB Connections** were created in Lab 1 in the GoldenGate Free console.

    ![Adminstrative Service page](./images/02-01-db-connections.png " ")

2. Click **Connect to database: sc2**. To verify a successful connection, checkpoint and trandata options become available.

    ![Adminstrative Service page](./images/02-02-db-connections.png " ")

3.  Redirected to the **Checkpoint** screen.

    ![Checkpoint page](./images/02-03-connect-db.png " ")

4.  Select **Trandata** and on the **TRANDATA Information** search schema, search **HR**. Verify that **HR** is listed with inserts.

    ![TRANDATA page](./images/02-04-trandata.png " ")

## Task 3: Review Extract details

1. Click Extracts, then click the Extract Action menu (in this case, E6), and select **Details** from the dropdown. Extracts listed here were created in Lab 1 in the GoldenGate Free console.

    ![Extracts page](./images/03-01-extract.png " ")

2.  On the Extract screen, view the process details such as registration information, Encryption, and Managed Options.

    ![Extracts page](./images/03-02-process-info.png " ")

3.  On the **Checkpoint** screen, view the Checkpoint basic information, Input Checkpoints, and Output Checkpoints.

    ![Checkpoint page](./images/03-03-checkpoint.png " ")

4.  On the **Statistics** screen, view the Data Definition Language (DDL) and Table Statistics. You can organize the statistics based on total, daily, or hourly.

    ![Statistics page](./images/03-04-statistics.png " ")

5.  On the **Parameters** screen, view the parameters in use. 

    ![Parameters page](./images/03-05-parameters.png " ")

6.  On the **Cache Manager Statistics** screen, view the Cache Statistics, and Objects Pool Statistics. You can view the Global Statistics under Runtime Statistics or Cumulative Statistics. 

    ![Report page](./images/03-06-cache-mgr-stats.png " ")

7.  On the **Report** screen, view the Report Files and Discard Files.

    ![Report page](./images/03-07-report.png " ")

8.  On the **Integrated Diagnostics** screen, view and add Integrated Diagnostics. 

    ![Report page](./images/03-08-integrated-diagnostics.png " ")

## Task 4: Review Replicats details

1. Click Replicats, then click the Replicat Action menu (in this case, R11), and select **Details** from the dropdown. Replicats listed here were created in Lab 1 in the GoldenGate Free console.

    ![Launch console](./images/04-01-replicat-details.png " ")

2.  On the **Process Information** screen, view the process details such as registration information, Encryption, and Managed Options.

    ![Process Information page](./images/04-02-process-info.png " ")

3.  On the **Checkpoint** screen, view the Checkpoint Basic Information, and Input Checkpoints. 

    ![Checkpoint page](./images/04-03-checkpoint.png " ")

4.  On the **Statistics** screen, view the Data Definition Language (DDL), Table Statistics, and Integrated Replicat. You can organize the statistics based on total, daily, or hourly.

    ![Statistics page](./images/04-04-statistics.png " ")

5. On the **Parameters** screen, view the parameters in use. 

    ![Parameters page](./images/04-05-parameters.png " ")

6.  On the **Report** screen, view the Report Files and Discard Files.

    ![Parameters page](./images/04-06-report.png " ")

7.  On the **Heartbeat** screen, view the Heartbeat Information and Latest Heartbeats. 

    ![Heartbeat page](./images/04-07-heartbeat.png " ")

8.  Click **See History** to view the replicat's Heartbeats History.

    ![Heartbeat chart view page](./images/04-08-heartbeat-chart-view.png " ")

9. Click **Table View** to view the replicat's Heartbeats History in a table view.

    ![Heartbeat table page](./images/04-09-heartbeat-table-view.png " ")

10. Click **Integrated Diagnostics** screen, view and add Integrated Diagnostics.

    ![Integrated Diagnostics page](./images/04-10-integrated-diagnostics.png " ")

## Task 5: Monitor the pipeline

1. Click **Performance Metrics Service**, and then click the Extract process (in this example, E6).

    ![Performance Metrics Service](./images/05-01-performance-metrics-service.png " ")

2. Under **Process Performance**, monitor the performance of the extract.

    ![Process Performace](./images/05-02-process-performance.png " ")

3. Under **Thread Performance**, monitor different threads, such as Extract, Service Threads, and Monitoring.

    ![Thread Performace](./images/05-03-thread-performance.png " ")

4. Under **Status and Configuration**, view various Process Messages and Process Status Changes. 

    ![Status and Configuration](./images/05-04-status.png " ")

5. Under **Trail Files**, view the Output Trail File and Trail Checkpoint. 

    ![Trail Files](./images/05-05-trail-files.png " ")

6. Under **Database Statistics**, view the Database Information, Statistics, and Table Statistics. 

    ![Database Statistics](./images/05-06-db-stats.png " ")

7. Under **Procedure Statistics**, view the Procedure Statistics Table. 

    ![Procedure Statistics](./images/05-07-procedure-stats.png " ")

8. Under **Cache Statistics**, view the Cache Manager Statistics and Cache Bucket Statistics.  

    ![Cache Statistics](./images/05-08-cache-stats.png " ")

9. Under **Queue Statistics**, view the various Queue statistics and graphs. 

    ![Queue Statistics](./images/05-09-queue.png " ")

10. Under **Bounded Recovery**, view Bounded Recovery Status, and Bounded Recovery Statistics. 

    ![Bounded Recovery](./images/05-10-bounded-recovery.png " ")

3. Repeat Task 5, steps 1-10, to monitor the performance of the Replicat process (in this case, R11).

## Learn more

* [Monitor performance using the Oracle Cloud console](https://docs.oracle.com/en/cloud/paas/goldengate-service/vddvk/index.html#articletitle)

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer 
* **Contributors** -  Alex Lima, Database Product Management & Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Last Updated By/Date** - Jenny Chan, September 2025
