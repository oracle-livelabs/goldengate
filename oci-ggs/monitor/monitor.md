# Monitor Extracts and Replicats

## Introduction

In this lab, you learn to monitor the Extract and Replicat processes that were created and run in the previous lab.

Estimated time: 2 minutes

Watch the video below for a quick walk through of the lab.
[Watch the video](videohub:1_fpr4rutd)

### About Performance Monitoring

Monitoring the performance of your GoldenGate instance ensures that your data replication processes are running smoothly and efficiently. You can monitor performance in both the Oracle Cloud Infrastructure (OCI) GoldenGate Deployment Console as well as in the Oracle Cloud Console on the Deployment Details page.

### Objectives

In this lab, you will:
* View charts and statistics using the Performance Metrics Server in the GoldenGate deployment console
* Use Metrics on the Deployment Details page in the Oracle Cloud Console to determine overall instance health and utilization.

### Prerequisites

In order to complete this lab:
* You should have completed the preceding lab
* Have both an Extract and Replicat running

## Task 1: Perform inserts to the source database

[](include:01-perform-inserts-source-db.md)

## Task 2: Using the Performance Metrics Server

1.  In the GoldenGate deployment console, click **Performance Metrics Server**, and then click **EXT**.

    ![Performance Metrics Service page - EXT highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/monitor/images/05-01-perf-serv.png " ")

    > **Note:** *You can also view performance details for the Administration, Distribution, and Receiver Servers, as well as any processes created.*

2.  Click **Database Statistics**.

    ![Database Statistics page](https://oracle-livelabs.github.io/goldengate/ggs-common/monitor/images/05-03-db-stats.png " ")

    Here, you can view the real time database statistics, such as Inserts, Updates, Deletes, and so on.

## Task 3: Viewing GoldenGate metrics in the Oracle Cloud console

1.  On the OCI GoldenGate Deployments page, select **OCI GoldenGate Deployment**.

2.  On the OCI GoldenGate Deployment details page, scroll down to the **Metrics** section.

    ![Metrics on Deployment Details page](https://oracle-livelabs.github.io/goldengate/ggs-common/monitor/images/05b-02-metrics.png " ")

3.  Review the **DeploymentInboundLag** and **DeploymentOutboundLag** charts.

4.  Refresh your view after 5 minutes to see updated metrics.

In this lab, you learned to monitor performance in the OCI GoldenGate deployment console and in the Oracle Cloud console.

(Optional) You may now **proceed to the next lab.**

## Learn more

* [Monitor performance using the Oracle Cloud console](https://docs.oracle.com/en/cloud/paas/goldengate-service/vddvk/index.html#articletitle)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Denis Gray, Database Product Management & Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, March 2024
