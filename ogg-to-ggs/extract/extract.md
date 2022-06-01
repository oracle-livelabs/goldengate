# Send the Oracle GoldenGate Trail file to OCI GoldenGate

## Introduction

This lab walks you through the steps to capture and send data to Oracle Cloud Infrastructure (OCI) GoldenGate using an on-premises or Marketplace Oracle GoldenGate instance. You'll create an Extract to capture data from the source database, a Distribution Path to initiate sending the data to the target, and a Replicat to consume the data received.

Estimated time: 15 minutes

Watch the video below for a walk through of the lab.
[](youtube:KZ3kJIbGinY)

### About Extracts, Paths, and Replicats
An Extract is a process that extracts, or captures, data from a source database. A Distribution Path is a source-to-destination configuration that uses the Distribution Server. A Replicat is a process that delivers data to the target.

### Objectives

In this lab, you will:
* Add and run an Extract process to capture data to send to OCI GoldenGate
* Add and run a Distribution Server Path to send the trail file to OCI GoldenGate
* Add and run a Replicat process to consume the trail file sent from Oracle GoldenGate

### Prerequisites

This lab assumes that you completed all preceding labs. For the purposes of this lab, the source database used in this lab is Oracle Autonomous Transaction Processing (ATP) and the target database is Oracle Autonomous Data Warehouse (ADW).

## Task 1: Add and run an Extract in Oracle GoldenGate

This Extract process captures data from the source database to send to OCI GoldenGate.

1.  In the Oracle GoldenGate Marketplace Administration Server console, select **Overview** from the navigation menu (hamburger icon), and then click **Add Extract** (plus icon).

    ![](images/02-02-ggs-add-extract.png " ")

2.  On the Add Extract page, select **Integrated Extract**, and then click **Next**.

    ![](images/01-02-int-extract.png " ")

3.  For **Process Name**, enter a name for this Extract process, such as UAEXT.

4.  For **Trail Name**, enter a two-character name for the Trail file, such as E1.

    ![](images/02-04-ggs-basic-info.png " ")

5.  From the **Credential Domain** dropdown, select **OracleGoldenGate**, and then select the **Credential Alias** for the source ATP database.

    ![](images/02-05.png " ")

6.  Click **Next**.

7.  In the Extract Parameters screen, add the following to the text area:

    ```
    <copy>Table SRC_OCIGGLL.*;</copy>
    ```

    ![](images/01-07-ext-params.png " ")

8.  Click **Create**. You're returned to the Administration Server Overview page.

9.  In the UAEXT **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**.

    ![](images/02-12-ggs-start-extract.png " ")

    The yellow exclamation point icon changes to a green checkmark.

    ![](images/02-ggs-extract-started.png " ")

## Task 2: Add and run a Distribution Path

The Distribution Path initiates the process to send the Oracle GoldenGate trail file to OCI GoldenGate.

1.  In the Marketplace Oracle GoldenGate Administration Server console, click **Distribution Server**, and then click **Add Path** (plus icon).

    ![](images/02-01.png " ")

2.  On the Add Path page, for **Path Name**, enter a name for this Path. For example, **OGGtoGGS**.

3.  For **Description**, describe the purpose of this Path.

4.  Click **Source**, and then select the Extract created in STEP 1 above. For example, select **UAEXT**.

5.  Click **Trail Name**, and then select the trail file created in STEP 1 above, to send to OCI GoldenGate. For example, select **E1**.

6.  For **Generated Source URI**, click **Edit Source URI**, and then replace localhost (or the IP address) with the Internal FQDN of the on-premises or Marketplace Oracle GoldenGate instance.

    ![](images/02-07.png " ")

    *You can copy the Internal FQDN from the Oracle GoldenGate Marketplace Compute instance in the OCI Console.*

    ![](images/02-07-note.png " ")

7.  For **Target Host**, enter the OCI GoldenGate hostname in the following format: **&lt;domain&gt;.deployment.goldengate.us-&lt;region&gt;-1.oci.oraclecloud.com**.

    *You can copy the host from the browser address bar of your OCI GoldenGate Deployment Console window, or copy the Console URL from the Deployment Details page and remove the https:// and any trailing slashes (/).*

  ![](images/02-08-note.png " ")

8.  For **Port Number**, enter 443.

9.  For **Trail Name**, enter a two-character name for the Trail file when it is received by OCI GoldenGate. For example, **T1**.

10. For **Target Domain**, enter the domain name you created in Oracle GoldenGate. For example, **GGSNetwork**.

11. For **Target Alias**, enter the alias name you created in Oracle GoldenGate. For example, **ogg2ggs**.

    ![](images/02-12.png " ")

12. Click **Create Path**.

13. Return to the Distribution Server Overview page, and then select **Start** from the Path's **Action** menu.

    ![](images/02-14.png " ")

14. In the OCI GoldenGate Deployment Console, check the Receiver Server for the Receiver Path. It can take a few minutes before it appears.

    ![](images/02-15-rcvr.png " ")

In this lab, you created and ran a Path on your on-premises Oracle GoldenGate Distribution Server and sent a trail file from Oracle GoldenGate to OCI GoldenGate.

## Task 3: Add a Checkpoint table

1.  In the OCI GoldenGate Deployment Console, click **Administration Server**, and then open the navigation menu to select **Configuration**.

    ![](images/03-01.png " ")

2.  For TargetADW, click **Connect to Database**.

    ![](images/03-02.png " ")

3.  Next to Checkpoint, click **Add Checkpoint**.

    ![](images/03-03.png " ")

4.  For **Checkpoint Table**, enter **"SRCMIRROR\_OCIGGLL"."CHECKTABLE"**, and then click **Submit**.

    ![](images/03-04.png " ")

To return to the GoldenGate Deployment Console Home page, click **Overview** in the left navigation.

## Task 4: Add and run a Replicat

This Replicat process consumes the trail file sent from Oracle GoldenGate.

1.  Click **Add Replicat** (plus icon).

    ![](images/04-01.png " ")

2.  On the Add Replicat page, select **Nonintegrated Replicat**, and then click **Next**.

    ![](images/04-02.png " ")

3.  On the Replicate Options page, for **Process Name**, enter **Rep**.

4.  For **Credential Domain**, select **OracleGoldenGate**.

5.  For **Credential Alias**, select **TargetADW**.

6.  For **Trail Name**, enter T1.

7.  From the **Checkpoint Table** dropdown, select **"SRCMIRROR\_OCIGGLL"."CHECKTABLE"**.

8.  Under **Managed Options**, enable **Critical to deployment health**.

    ![](images/04-08.png " ")

9.  Click **Next**.

10. In the **Parameter File** text area, replace **MAP \*.\*, TARGET \*.\*;** with **MAP SRC\_OCIGGLL.\*, TARGET SRCMIRROR\_OCIGGLL.\*;**

    ![](images/04-10.png " ")

11. Click **Create**.

12. In the Rep Replicat **Action** menu, select **Start**.

    ![](images/04-11.png " ")

    The yellow exclamation point icon changes to a green checkmark.  

    ![](images/04-12.png " ")

13. Return to the Oracle Cloud Console and use the navigation menu (hamburger icon) to navigate back to **Oracle Database**, **Autonomous Transaction Processing**, and then **SourceATP**.

14. On the Source ATP Details page, click **Tools**, and then **Database Actions**.

15. Use the Source ATP database credentials in the Workshop details to log in to Database Actions, and then click **SQL**.

16. Enter the following inserts, and then click **Run Script**:

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

17. In the Oracle GoldenGate Marketplace Administration Server, select **Overview** from the navigation menu (hamburger icon), click the **Extract name (UAEXT)**, and then click **Statistics**. Verify that **SRC\_OCIGGLL.SRC\_CITY** is listed with 10 inserts.

    ![](images/04-17.png " ")

18. Navigate to the Oracle GoldenGate Marketplace Distribution Server. From the **Action** menu, select **Details**, and then **Statistics**. Verify that **SRC\_OCIGGLL.SRC\_CITY** lists 10 inserts.

    ![](images/04-18.png " ")

19. In the OCI GoldenGate Deployment Console, click the name of the Replicat to view its details, and then click **Statistics** to verify the Replicat applied the rows.

    ![](images/image.png " ")

## Task 5: Confirm the Distribution Path is running

1.  In the Oracle GoldenGate Marketplace Distribution Server, verify the Distribution Path is running.

    ![](images/04-00.png " ")

In this lab, you created an Extract, a Distribution Path, and a Replicat, and you verified that data is moving from Oracle GoldenGate to OCI GoldenGate. You may now **proceed to the next lab**.

## Learn more

* [Quickstart - Send Data from Oracle GoldenGate to OCI GoldenGate](https://docs.oracle.com/en/cloud/paas/goldengate-service/using/qs-ogg-premise-cloud.html)
* [Creating an Extract](https://docs.oracle.com/en/cloud/paas/goldengate-service/using/goldengate-deployment-console.html#GUID-3B004DB0-2F41-4FC2-BDD4-4DE809F52448)
* [Create a Distribution Path](https://docs.oracle.com/en/cloud/paas/goldengate-service/using/goldengate-deployment-console.html#GUID-19B3B506-ADF1-465E-87B5-91121FE44503)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Werner He and Julien Testut, Database Product Management
* **Last Updated By/Date** - Jenny Chan, September 2021
