# Review Configuration

## Introduction

In this lab, you learn to monitor the Extract and Replicat processes that were created and run in the previous labs.

Estimated time: 10 minutes

### About Performance Monitoring

Monitoring the performance of your GoldenGate instance ensures that your data replication processes are running smoothly and efficiently. You can monitor performance in the Oracle GoldenGate 23ai Microservices WebUI.

### Objectives

In this lab, you will:
* Review the Oracle GoldenGate Microservices, such as, Administration Service, Distribution Service, Performance Metrics Service, and Receiver Service.
* View charts and statistics using the Performance Metrics Server in the Oracle GoldenGate 23ai Microservices WebUI.

### Prerequisites

* This lab assumes that you completed all preceding labs

## Task 1: Review Extract details

1. On the top navigation, select **Administration Service** and then select **Extracts**.

2. On the Extracts page, select **EEAST**.

    ![Select Extract](./images/01-02-select-extract.png " ")

3. On the **Extract** screen, view the process details such as Encryption, and Status.

    ![Extract page](./images/01-03-extract.png " ")

4. On the **Checkpoint** screen, view the Input Checkpoints, and Output Checkpoints.

    ![Checkpoint page](./images/01-04-checkpoint.png " ")

5. On the **Statistics** screen, view the Data Definition Language (DDL) and Table Statistics. You can organize the statistics based on total, daily, or hourly.

    ![Statistics page](./images/01-05-statistics.png " ")

6. On the **Parameters** screen, view the parameters in use.

    ![Parameters page](./images/01-06-parameters.png " ")

7. On the **Cache Manager Statistics** screen, view the Cache Statistics, and Objects Pool Statistics. You can view the Global Statistics under Runtime Statistics or Cumulative Statistics.

    ![Cache Manager Statistics page](./images/01-07-cache-mngr-stats.png " ")

8. On the **Report** screen, view the Report Files and Discard Files.

    ![Report page](./images/01-08-report.png " ")

9. On the **Integrated Diagnostics** screen, view and add Integrated Diagnostics.

    ![Integrated Diagnostics page](./images/01-09-int-diagnostics.png " ")

## Task 2: Review Replicat details

1. On the top navigation, select **Administration Service** and then select **Replicats**.

2. On the Replicats page, select **RWEST**.

    ![Select Replicat](./images/02-02-select-rep.png " ")

3. On the **Replicat** screen, view the process details such as Encryption, and Status.

    ![Replicat page](./images/02-03-rep.png " ")

4. On the **Checkpoint** screen, view the Input Checkpoints, and Output Checkpoints.

    ![Checkpoint page](./images/02-04-checkpoint.png " ")

5. On the **Statistics** screen, view the Data Definition Language (DDL) and Table Statistics. You can organize the statistics based on total, daily, or hourly.

    ![Statistics page](./images/02-05-statistics.png " ")

6. On the **Parameters** screen, view the parameters in use.

    ![Parameters page](./images/02-06-parameters.png " ")

7. On the **Report** screen, view the Report Files and Discard Files.

    ![Report page](./images/02-07-report.png " ")

8. On the **Heartbeat** screen, view the Heartbeat Information and Latest Heartbeats. Click **See History** to view the replicat's Heartbeats History.

    ![Heartbeat page](./images/02-08-heartbeat.png " ")

## Task 3: Navigate Distribution Service

1. On the top navigation, select **Distribution Service** and then select **Distribution Paths**.

2. On the Distribution Paths page, select **DPEAST**.

    ![Select Distribution Path](./images/03-02-select-dp.png " ")

3. On the **Path Information** screen, view the Basic Information, Filter Rules, Encryption, and Advanced Options.

    ![Path Information page](./images/03-03-path-info.png " ")

4. On the **Path Statistics** screen, view the LCR Table, DDL Table, and Statistics Table. 

    ![Path Statistics page](./images/03-04-path-stats.png " ")

## Task 4: Navigate Performance Metrics Service

1. On the top navigation, select **Performance Metrics Service**.

    ![Select Performance Metrics Service](./images/04-01-perf-met-serv.png " ")

2. Click **Services**, view the status of all the processes.

    ![Select Replicat](./images/04-02-services.png " ")

3. Click **Services**, view the status of all the processes.

    ![Select Replicat](./images/04-02-services.png " ")

## Task 5: Navigate Receiver Service

1. Open the **East** Microservices WebUI.

2. On the top navigation menu, click **Receiver Service**, and then on the left navigation menu, click **Target-Initiated Paths**. 

3. On the Target-Initiated Path page, click **TPEAST**.

    ![Click TPEAST](./images/05-01-tpeast.png " ")

4. On the **Path Information** screen, view the Basic Information, Filter Rules, Encryption, and Advanced Options.

    ![Path Information page](./images/05-04-path-info.png " ")

5. On the **Path Statistics** screen, view the LCR Table, DDL Table, and Statistics Table. 

    ![Path Statistics page](./images/05-05-path-stats.png " ")

6. Open the **West** Microservices WebUI.

7. On the top navigation menu, click **Receiver Service**, and then on the left navigation menu, click **Distribution Paths**. 

8. On the Distribution Path page, click **DPWEST**.

    ![Click DPWEST](./images/05-08-dpwest.png " ")

9. On the **Network Statistics** screen, view the Basic Information, Filter Rules, Encryption, and Advanced Options.

    ![Network Statistics page](./images/05-09-network-stats.png " ")

You may now **proceed to the next lab.**

## Learn more

* [Monitor Processes from the Performance Metrics Service](https://docs.oracle.com/en/middleware/goldengate/core/23/coredoc/monitor-performance-metrics-server.html)

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer
* **Contributors** -  Alex Lima, Database Product Management
* **Last Updated By/Date** - Katherine Wardhana, August 2024