# Replicate data from target to source

## Introduction

Now that replication is established and verified from the source database to the target database, you can set up bidirectional replication from the target to the source. This lab walks you through the steps create and run an Extract on the target, and create and run a Replicat on the source in the Oracle Cloud Infrastructure (OCI) GoldenGate Deployment Console.

Estimated time: 20 minutes

### About Extracts and Replicats

An Extract is a process that extracts, or captures, data from a source database. A Replicat is a process that delivers data to a target database.

### Objectives

In this lab, you will:
* Add and run an Extract
* Add and run a Replicat
* Verify the replication from Autonomous Data Warehouse to Autonomous Transaction Processing

### Prerequisites

This lab assumes that you completed all preceding labs, and your deployment is in the Active state.

## Task 1: Add and run an Extract

First, create the Extract for the target (ADW) database.

1.  In the navigation menu, click **Extracts**.

2.  On the Extracts page, click **Add Extract** (plus icon).
    
    ![Overview screen](./images/01-01-add-ext.png " ")

3.  In the Add Extract panel, select **Integrated Extract**, enter `EXTB` for **Process Name**, and then click **Next**.
    
    ![Extract information page](./images/01-02-integrated-extract.png " ")

4.  On the Extract Options page, complete the following fields and then click **Next**: 

    * From the **Domain** dropdown, select **OracleGoldenGate**.
    * From the **Alias** dropdown, select **TargetADW**.
    * For Extract **Trail Name**, enter `E2` 

    ![Extract options page](./images/01-06-extract-options.png " ")

7.  On the Managed Options page, enable **Critical to deployment health**, and then click **Next**.

    ![Managed options page](./images/01-08-crit-deploy-health.png " ")

9.  On the Parameter File page, in the text area, add a new line under EXTTRAIL E2, and then add the following:

    ```
    <copy>-- Table list for capture
    table SRCMIRROR_OCIGGLL.*;

    -- Exclude changes made by GGADMIN
    tranlogoptions excludeuser ggadmin</copy>
    ```

    ![Parameter File page](./images/01-10-param-file.png " ")

10. Click **Create and Run**. The EXTB Extract process appears after a few moments.

    ![Extracts](./images/01-10-extracts.png " ")

## Task 2: Add and run the Replicat

Next, create the Replicat on the source (ATP) database.

1.  In the navigation menu, click **Replicats**. 

2.  On the Replicats page, click **Add Replicat** (plus icon).

    ![Add replicat](./images/02-01-add-replicat.png " ")

3.  In the Add Replicat panel, on the Replicat Information page, select **Nonintegrated Replicat**, enter `REPB` for Process Name, and then click **Next**.

    ![Replicat type page](./images/02-02-rep-type-page.png " ")

4.  On the Replicat Options page, complete the following fields, and then click **Next**:

    * For Replicat Trail **Name**, enter `E2`.
    * From the Target Credential **Domain** dropdown, select **OracleGoldenGate**.
    * From the Target Credential **Alias** dropdown, select **SourceATP**.
    * For Checkpoint Table, select **"SRC\_OCIGGLL"."ATP\_CHECKTABLE"**.

        > **NOTE**: The Checkpoint Table may take a few moments to populate.

    ![Replicat type page](./images/02-07-rep-options.png " ")

5.  On the Managed Options page, enable **Critical to deployment health**, and then click **Next**.

    ![Replicat type page](./images/02-09-crit-deploy-health.png " ")

10. On the Parameter File page, in the text area, replace **MAP \*.\*, TARGET \*.\*;** with the following:

    ```
    <copy>MAP SRCMIRROR_OCIGGLL.*, TARGET SRC_OCIGGLL.*;</copy>
    ```
    ![Replicat type page](./images/02-10-param-file.png " ")

11. Click **Create and Run**. The new Replicat appears after a few moments. 

    ![Extract completed](./images/02-11-admin-service-overview.png)

## Task 3: Perform Inserts into the target database

1.  Return to the Oracle Cloud Console and use the navigation menu (hamburger icon) to navigate back to **Oracle Database**, **Autonomous Database**, and then **TargetADW**.

    ![Autonomous Transaction Processing in Oracle Cloud navigation menu](./images/03-01-adw.png " ")

    ![Autonomous Transaction Processing page](./images/03-01b-target.png " ")

2.  On the Target ADW Details page, click **Database Actions**, then **SQL**.

    ![TargetADW Database Details page](./images/03-02-db-actions.png)

3.  Enter the following inserts, and then click **Run Script**:

    ```
    <copy>Insert into SRCMIRROR_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (2000,'Houston',20,743113);
Insert into SRCMIRROR_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (2001,'Dallas',20,822416);
Insert into SRCMIRROR_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (2002,'San Francisco',21,157574);
Insert into SRCMIRROR_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (2003,'Los Angeles',21,743878);
Insert into SRCMIRROR_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (2004,'San Diego',21,840689);
Insert into SRCMIRROR_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (2005,'Chicago',23,616472);
Insert into SRCMIRROR_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (2006,'Memphis',23,580075);
Insert into SRCMIRROR_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (2007,'New York City',22,124434);
Insert into SRCMIRROR_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (2008,'Boston',22,275581);
Insert into SRCMIRROR_OCIGGLL.SRC_CITY (CITY_ID,CITY,REGION_ID,POPULATION) values (2009,'Washington D.C.',22,688002);</copy>
    ```
    ![SQL return](./images/03-04-sql-script-return.png " ")

4.  In the OCI GoldenGate deployment console navigation menu, click **Extracts**, then **Extract name (EXTB)**, and then click **Statistics**. Verify that **SRC\_OCIGGLL.SRC\_CITY** is listed with 10 inserts.

    ![Extract Process Information - Statistics](./images/03-05-ext-statistics.png " ")

5.  Go back to the Overview screen, click the **Replicat name (REPB)**, and then click **Statistics**. Verify that **SRC\_OCIGGLL.SRC\_CITY** is listed with 10 inserts.

    ![Replicat Process Information - Statistics](./images/03-06-rep-statistics.png " ")


## Learn more

* [Add an Extract](https://docs.oracle.com/en/cloud/paas/goldengate-service/eeske/index.html)
* [Add a Replicat](https://docs.oracle.com/en/cloud/paas/goldengate-service/cress/index.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Julien Testut, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, June 2025
