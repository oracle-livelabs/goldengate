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

## Task 1: Perform Inserts to the source database

1.  Return to the Oracle Cloud console and use the navigation menu to navigate back to **Oracle Database**, **Autonomous Transaction Processing**, and then **SourceATP**.

2.  On the Source ATP Details page, click **Database actions**, and then **SQL**.

3.  Enter the following inserts, and then click **Run Script**:

    ```
    <copy>Insert into SRC_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (1000,'Houston',20,743113);
Insert into SRC_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (1001,'Dallas',20,822416);
Insert into SRC_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (1002,'San Francisco',21,157574);
Insert into SRC_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (1003,'Los Angeles',21,743878);
Insert into SRC_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (1004,'San Diego',21,840689);
Insert into SRC_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (1005,'Chicago',23,616472);
Insert into SRC_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (1006,'Memphis',23,580075);
Insert into SRC_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (1007,'New York City',22,124434);
Insert into SRC_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (1008,'Boston',22,275581);
Insert into SRC_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (1009,'Washington D.C.',22,688002);</copy>
    ```

4.  In the OCI GoldenGate Deployment Console, click the **Extract name (UAEXT)**, and then click **Statistics**. Verify that **SRC\_OCIGGLL.SRC\_CITY** is listed with 10 inserts.

    ![Extract Process Information - Statistics](../../../ggs-common/monitor/images/04-17-ext-stats.png " ")

5.  Go back to the Overview screen, click the **Replicat name (REP)**, and then click **Statistics**. Verify that **SRC\_OCIGGLL.SRC\_CITY** is listed with 10 inserts.

    ![Replicat Process Information - Statistics](../../../ggs-common/monitor/images/01-06-rep-statistics.png " ")

## Task 2: Using the Performance Metrics Service

1.  In the GoldenGate deployment console, click **Performance Metrics Service**, and then click **UAEXT**.

    ![Performance Metrics Service page - EXT highlighted](../../../ggs-common/monitor/images/05-01-perf-serv.png)

    > **Note:** You can also view performance details for the Administration, Distribution, and Receiver Servers, as well as any processes created.

2.  Click **Database Statistics**.

    ![Database Statistics page](../../../ggs-common/monitor/images/05-03-db-stats.png)

    Here, you can view the real time database statistics, such as Inserts, Updates, Deletes, and so on.

4.  Repeat steps 1-3 to view a snapshot of the Replicat's (named **Rep** in our lab) Database Statistics.

## Task 3: Viewing GoldenGate metrics in the Oracle Cloud console

1.  In the Oracle Cloud console navigation menu, click **Observability & Management**, and then under **Monitoring**, click **Metrics Explorer**. 

    ![Metrics Explorer in Oracle Cloud console navigation menu](../../../ggs-common/monitor/images/03-01-metrics-explorer.png " ")

2.  In the Query section, complete the following fields:

    * Compartment: Select your compartment.
    * Metric namespace: Select **oci_goldengate**.
    * Metric name: Select **ExtractLag**.
    * Dimension name: Select **deploymentName**.
    * Dimension value: Select **ggsinstance**.

    ![ExtractLag metrics](../../../ggs-common/monitor/images/03-02-query1.png)

3.  Click **Update Chart**.

4.  Click **Add Query**, and then repeat steps 2 and 3 for Metric name, **ReplicatLag**.

    ![Metrics explorer](../../../ggs-common/monitor/images/03-04-query2.png)

In this lab, you learned to monitor performance in the OCI GoldenGate deployment console and in the Oracle Cloud console.

(Optional) You may now **proceed to the next lab.**

## Learn more

* [Monitor performance using the Oracle Cloud console](https://docs.oracle.com/en/cloud/paas/goldengate-service/vddvk/index.html#articletitle)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Denis Gray, Database Product Management & Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Jenny Chan, October 2023
