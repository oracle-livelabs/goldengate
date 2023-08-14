# Send the OCI GoldenGate Trail File to Oracle GoldenGate

## Introduction

This lab walks you through the steps to capture and send data from Oracle Cloud Infrastructure (OCI) GoldenGate to an on premises or Marketplace Oracle GoldenGate instance. You'll create an Extract to capture data from the source database, a Receiver Path to initiate pulling the data down to the target, and a Replicat to consume the data received.

Estimated time: 25 minutes

### About Extracts, Paths, and Replicats
An Extract is a process that extracts, or captures, data from a source database. A Receiver Path is a target-initiated configuration that uses the Receiver Server. A Replicat is a process that delivers data to the target.

### Objectives

In this lab, you will:
* Add and run an Extract process to capture data
* Add and run a Receiver Path to pull the trail file down to Oracle GoldenGate
* Add and run a Replicat process to consume the trail file received from OCI GoldenGate

### Prerequisites

This lab assumes that you completed all preceding labs. For the purposes of this lab, the source database used in this lab is Oracle Autonomous Transaction Processing and the target database is Oracle Autonomous Data Warehouse.

## Task 1: Add Transaction Data

1.  In the OCI GoldenGate Deployment console, select **Overview** from the navigation menu (hamburger icon), and then click **Configuration**.

    ![Administration Service navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-01-nav-config.png " ")

2.  Click **Connect to database SourceATP**.

    ![Credentials list with Connect to database SourceATP highlighted](./images/01-02-connect-source.png " ")

3.  Next to **TRANDATA Information** click **Add TRANDATA**.

    ![Add TRANDATA](./images/01-03-trandata.png " ")

4.  For **Schema Name**, enter **SRC\_OCIGGLL**, and then click **Submit**. *You only need to click Submit once. Click Search, and then enter SRC_OCIGGLL to verify.*

    ![Schema Name field populated with SRC_OCIGGLL](./images/01-04-trandata.png " ")

## Task 2: Add and Run an Extract in OCI GoldenGate

This Extract process captures data from the source database to send to Oracle GoldenGate.

1.  In the OCI GoldenGate Deployment console, select **Overview** from the navigation menu (hamburger icon), and then click **Add Extract** (plus icon).

    ![Add Extract icon highlighted on Administration Service Overview page](./images/02-01-ggs-add-extract.png " ")

2.  On the Add Extract page, select **Integrated Extract**, and then click **Next**.

    ![Extract Type page with Integrated Extract highlighted](./images/02-02-add-extract.png " ")

3.  For **Process Name**, enter a name for this Extract process, such as UAEXT.

    ![Extract Options pag](./images/02-03-extract-name.png " ")

4.  For **Trail Name**, enter a two-character name for the Trail file, such as E1.

    ![Extract Options pag](./images/02-04-trailname.png " ")

5.  From the **Credential Domain** dropdown, select **OracleGoldenGate**, and then select the **Credential Alias** for the source Autonomous Transaction Processing database.

    ![Credential Domain and Credential Alias](./images/02-05-cred-domain.png " ")

6.  Click **Next**.

7.  In the Extract Parameters screen, add a new line, and then paste the following to the text area:

    ```
    <copy>Table SRC_OCIGGLL.*;</copy>
    ```

    ![Add Extract Parameters on the Parameter Files page](./images/02-07-ext-param.png " ")

8.  Click **Create**. You're returned to the Administration Server Overview page.

9.  In the UAEXT **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**.

    ![Select Start from Extract Action menu on the Administration Service Overview page](./images/02-09a-ggs-start-extract.png " ")

    The yellow exclamation point icon changes to a green checkmark.

    ![Extract icon](./images/02-09b-ggs-extract-started.png " ")

## Task 3: Add and Run a Receiver Path

The Receiver Path initiates the process to pull the OCI GoldenGate trail file down to Oracle GoldenGate.

1.  In the Marketplace Oracle GoldenGate Administration Server console, click **Receiver Server**.

    ![Click Receiver Server on the Distribution Service Overview page](./images/03-01-receiver-server.png " ")

2.  Click **Add Path** (plus icon).

    ![Click Add Path on the Receiver Server page](./images/03-02-add-path.png " ")

3.  On the Add Path page, for **Path Name**, enter a name for this Path. For example, **GGStoOGG**.

    ![Add Path Name](./images/03-03-path-name.png " ")

4.  For **Description**, describe the purpose of this Path.

    ![Add Description](./images/03-04-path-desc.png " ")

5.  For **Source Host**, enter the OCI GoldenGate hostname in the following format: **&lt;domain&gt;.deployment.goldengate.us-&lt;region&gt;-1.oci.oraclecloud.com**.

    >**NOTE:** You can copy the host from the browser address bar of your OCI GoldenGate Deployment Console window, or copy the Console URL from the Deployment Details page and remove the https:// and any trailing slashes (/).

    ![Copy the browser address bar of your OCI GoldenGate Deployment Console window](./images/03-05a-copy-browser.png " ")

    ![Add Source Host](./images/03-05b-source-host.png " ")

6.  For **Port Number**, enter 443.

    ![Add Port number](./images/03-06-port-no.png " ")

7.  Click **Trail Name**, and then enter the trail file name created in Task 1 above, to send to Oracle GoldenGate. For example, enter **E1**.

    ![Add Trail Name](./images/03-07-trailname.png " ")

8.  For **Domain**, enter the Domain from Lab 3, Task 3, step 4. For example, **GGSNetwork**.

    ![Add Domain](./images/03-08-domain.png " ")

9.  For **Alias**, enter the Alias from Lab 3, Task 3, step 4. For example, **ggs2ogg**.

    ![Add Alias](./images/03-09-alias.png " ")

10. For **Target Trail Name**, enter a two-character name for the Trail file when it is received by Oracle GoldenGate. For example, **T1**.

    ![Add Target Trail Name](./images/03-10-target-trail.png " ")

11. For **Generated Target URI**, click **Edit** (pencil icon), and then replace the IP address with the Oracle GoldenGate Internal FQDN. You can copy the Internal FQDN from the Oracle GoldenGate Marketplace Compute instance in the OCI Console.

    ![The Generated Target URI from the Instance Details page](./images/03-11a-note.png " ")

    ![Add Generated Target URI](./images/03-11b-target-uri.png " ")

12. Click **Create Path**.

13. Return to the Receiver Server Overview page, and then select **Start** from the Path's **Action** menu.

14. In the OCI GoldenGate Deployment Console, check the Distribution Service for the Distribution Path. It can take a few minutes before it appears.

In this lab, you created and ran a Path on your on premises Oracle GoldenGate Receiver Server and sent a trail file from OCI GoldenGate to Oracle GoldenGate.

## Task 4: Add a Checkpoint Table

1.  In the Oracle GoldenGate Marketplace Administration Server, click **Administration Server**, and then open the navigation menu to select **Configuration**.

    ![Select Configration from the Administration Service navigation menu](./images/04-01-configuration.png " ")

2.  For target Autonomous Data Warehouse database, click **Connect to Database**.

    ![Connect to TargetADW on the Configuration page](./images/04-02-connect-db.png " ")

3.  Next to Checkpoint, click **Add Checkpoint**.

    ![Add Checkpoint icon highlighted](./images/04-03-add-checkpoint.png " ")

4.  For **Checkpoint Table**, enter **"SRCMIRROR\_OCIGGLL"."CHECKTABLE"**, and then click **Submit**.

    ![Add the designated checkpoint table](./images/04-04-submit-checkpoint.png " ")


## Task 5: Add and Run a Replicat

This Replicat process consumes the trail file sent from OCI GoldenGate.

1.  Click **Overview**, and then click **Add Replicat** (plus icon).

    ![Click Add Replicat on Administration Service Overview page](./images/05-01-add-rep.png " ")

2.  On the Add Replicat page, select **Nonintegrated Replicat**, and then click **Next**.

    ![Select Nonintegration Replicat on the Replicat types page](./images/05-02-nonint-rep.png " ")

3.  On the Replicate Options page, for **Process Name**, enter **REP**.

    ![Add Process Name](./images/05-03-rep-name.png " ")

4.  For **Credential Domain**, select **OracleGoldenGate**.

5.  For **Credential Alias**, select **TargetADW**.

    ![Select adw<user>_low on the Credential Alias dropdown](./images/05-05-cred.png " ")

6.  For **Trail Name**, enter T1.

    ![Add Trail Name](./images/05-06-trail.png " ")

7.  From the **Checkpoint Table** dropdown, select **"SRCMIRROR\_OCIGGLL"."CHECKTABLE"**.

    ![Select "SRCMIRROR\_OCIGGLL"."CHECKTABLE" on the heckpoint Table dropdown](./images/05-07-checkpt.png " ")

8.  Click **Next**.

9.  In the **Parameter File** text area, replace **MAP \*.\*, TARGET \*.\*;** with **MAP SRC\_OCIGGLL.\*, TARGET SRCMIRROR\_OCIGGLL.\*;**

    ![Modify parameters on the Parameter Files page](./images/05-09-param-file.png " ")

10. Click **Create**.

11. In the Rep Replicat **Action** menu, select **Start**.

    ![Select Start from the Replicat Action menu on the Administration Service Overview page](./images/05-11-ggs-start-replicat.png " ")

    The yellow exclamation point icon changes to a green checkmark.  

12. Return to the OCI Console and use the navigation menu (hamburger icon) to navigate back to **Oracle Database**, **Autonomous Transaction Processing**, and then **SourceATP**.

13. On the Source Autonomous Transaction Processing Details page, click **Database Actions**.

14. Use the Source Autonomous Transaction Processing database credentials in the Workshop details to log in to Database Actions, and then click **SQL**.

15. Enter the following inserts, and then click **Run Script**:

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

16. In the OCI GoldenGate Deployment Console, select **Overview** from the navigation menu (hamburger icon), click the **Extract name (UAEXT)**, and then click **Statistics**. Verify that **SRC\_OCIGGLL.SRC\_CITY** is listed with 10 inserts.

    ![Administration Server on the OCI GoldenGate Deployment Console page](./images/05-16a-uaext.png " ")

    ![Statistics on the UAEXT extract](./images/05-16b-uaext-stats.png " ")

17. Navigate to the Oracle GoldenGate Marketplace Receiver Server. From the **Action** menu, select **Details**, and then **Statistics**. Verify that **SRC\_OCIGGLL.SRC\_CITY** is listed with 10 inserts.

    ![Select Details on the Oracle GoldenGate Marketplace Receiver Server](./images/05-17a-receiver-server-details.png " ")

    ![Select Statistics on the Path Information page](./images/05-17b-path-info.png " ")

## Task 6: Confirm the Receiver Path is Running

1.  In the Oracle GoldenGate Marketplace Receiver Server, verify the Receiver Path is running.

    ![Active Receiver Path on the racle GoldenGate Marketplace Receiver Server](./images/06-01-receiver-server.png " ")

In this lab, you created an Extract, a Receiver Path, and a Replicat, and you verified that data is moving from OCI GoldenGate to Oracle GoldenGate. You may now **proceed to the next lab**.

## Learn More

* [Quickstart - Sending Data from OCI GoldenGate to Oracle GoldenGate](https://docs.oracle.com/en/cloud/paas/goldengate-service/swjeg/index.html#articletitle)
* [Creating an Extract](https://docs.oracle.com/en/cloud/paas/goldengate-service/eeske/index.html)
* [Add a Receiver Path](https://docs.oracle.com/en/cloud/paas/goldengate-service/amlzc/index.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Werner He and Julien Testut, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, March 2023
