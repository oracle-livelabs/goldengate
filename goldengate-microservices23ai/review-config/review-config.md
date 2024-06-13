# Review Configuration

## Introduction

This lab walks you through the steps to instantiate the target database using Oracle Data Pump, and then add and run a Replicat in the Oracle Cloud Infrastructure (OCI) GoldenGate Deployment Console.

Estimated time: 15 minutes

### Objectives

In this lab, you will:
* Instantiate the target database using Oracle Data Pump
* Add and run a Replicat

### Prerequisites

* This lab assumes that you completed all preceding labs
* Your deployment is in the Active state.

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

## Task 4: Navigate Performance Metrics Service

1. On the top navigation, select **Performance Metrics Service**.

    ![Select Performance Metrics Service](./images/04-01-perf-met-serv.png " ")

2. Click **Services**, view the status of all the processes.

    ![Select Replicat](./images/04-02-services.png " ")

3. Click **Services**, view the status of all the processes.

    ![Select Replicat](./images/04-02-services.png " ")

## Task 5: Navigate Receiver Service

You may now **proceed to the next lab.**

## Learn more

* [Add a Replicat for Oracle Database](https://docs.oracle.com/en/cloud/paas/goldengate-service/cress/index.html)

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer
* **Contributors** -  Alex Lima, Database Product Management
* **Last Updated By/Date** - Katherine Wardhana, July 2024