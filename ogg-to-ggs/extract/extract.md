# Send the Oracle GoldenGate Trail file to OCI GoldenGate

## Introduction

In this lab, you learn to capture and send data to Oracle Cloud Infrastructure (OCI) GoldenGate using an on-premises or Marketplace Oracle GoldenGate instance. You'll create an Extract to capture data from the source database, a Distribution Path to initiate sending the data to the target, and a Replicat to consume the data received.

Estimated time: 15 minutes

Watch the video below for a walk through of the lab.
[](youtube:KZ3kJIbGinY)

### About Extracts, Paths, and Replicats
An Extract is a process that extracts, or captures, data from a source database. A Distribution Path is a source-to-destination configuration that uses the Distribution Service to send data in a distributed environment. A Replicat is a process that delivers data to the target.

### Objectives

In this lab, you will:
* Add and run an Extract process to capture data to send to OCI GoldenGate
* Add and run a Distribution Service Path to send the trail file to OCI GoldenGate
* Add and run a Replicat process to consume the trail file sent from Oracle GoldenGate

### Prerequisites

This lab assumes that you completed all preceding labs. For the purposes of this lab, the source database used in this lab is Oracle Autonomous Transaction Processing (ATP) and the target database is Oracle Autonomous Data Warehouse (ADW).

## Task 1: Add and run an Extract in Oracle GoldenGate

This Extract process captures data from the source database to send to OCI GoldenGate.

1.  In the Oracle GoldenGate Marketplace Administration Service console, select **Overview** from the navigation menu (hamburger icon), and then click **Add Extract** (plus icon).

    ![Add Extract icon highlighted on Administration Service Overview page](images/02-02-ggs-add-extract.png " ")

2.  On the Add Extract page, select **Integrated Extract**, and then click **Next**.

    ![Extract Type page with Integrated Extract highlighted](images/01-02-int-extract.png " ")

3.  For **Process Name**, enter a name for this Extract process, such as UAEXT.

4.  For **Trail Name**, enter a two-character name for the Trail file, such as E1.

    ![Extract Options page](images/02-04-ggs-basic-info.png " ")

5.  From the **Credential Domain** dropdown, select **OracleGoldenGate**, and then select the **Credential Alias** for the source ATP database.

    ![Credential Domain and Credential Alias](images/02-05.png " ")

6.  Click **Next**.

7.  In the Extract Parameters screen, add the following to the text area:

    ```
    <copy>Table SRC_OCIGGLL.*;</copy>
    ```

    ![Add Extract Parameters on the Parameter Files page](images/01-07-ext-params.png " ")

8.  Click **Create**. You're returned to the Administration Service Overview page.

9.  In the UAEXT **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**.

    ![Select Start from Extract Action menu on the Administration Service Overview page](images/02-12-ggs-start-extract.png " ")

    The yellow exclamation point icon changes to a green checkmark.

    ![Extract icon](images/02-ggs-extract-started.png " ")

## Task 2: Add and run a Distribution Path

The Distribution Path initiates the process to send the Oracle GoldenGate trail file to OCI GoldenGate.

1.  In the on-premises or Marketplace Oracle GoldenGate Administration Server console, click **Distribution Server**, and then click **Add Path** (plus icon).

    ![Click Add Path on the Distribution Service Overview page](images/02-01.png " ")

2.  On the Add Path page, for **Path Name**, enter a name for this Path. For example, **OGGtoGGS**.

3.  For **Description**, describe the purpose of this Path.

4.  Click **Source**, and then select the Extract created in STEP 1 above. For example, select **UAEXT**.

5.  Click **Trail Name**, and then select the trail file created in STEP 1 above, to send to OCI GoldenGate. For example, select **E1**.

6.  For **Generated Source URI**, click **Edit Source URI**, and then replace localhost (or the IP address) with the Internal FQDN of the on-premises or Marketplace Oracle GoldenGate instance.

    ![Replace localhost with Internal FQDN of compute image](images/02-07.png " ")

    >**Note:** You can copy the Internal FQDN from the Oracle GoldenGate Marketplace Compute instance in the OCI Console.

    ![Example of how to copy Internal FQDN from compute instance details page](images/02-07-note.png " ")

7.  For **Target Host**, enter the OCI GoldenGate hostname in the following format: **&lt;domain&gt;.deployment.goldengate.us-&lt;region&gt;-1.oci.oraclecloud.com**.

    >**Note:** You can copy the host from the browser address bar of your OCI GoldenGate Deployment Console window, or copy the Console URL from the Deployment Details page and remove the https:// and any trailing slashes (/).

  ![Copy Internal FQDN from Marketplace Oracle GoldenGate instance details page](images/02-08-note.png " ")

8.  For **Port Number**, enter 443.

9.  For **Trail Name**, enter a two-character name for the Trail file when it is received by OCI GoldenGate. For example, **T1**.

10. For **Target Domain**, enter the domain name you created in Oracle GoldenGate. For example, **GGSNetwork**.

11. For **Target Alias**, enter the alias name you created in Oracle GoldenGate. For example, **ogg2ggs**.

    ![Add Path options for Distribution path](images/02-12.png " ")

12. Click **Create Path**.

13. Return to the Distribution Server Overview page, and then select **Start** from the Path's **Action** menu.

    ![Select Start from the Distribution Path's Action menu](images/02-14.png " ")

14. In the OCI GoldenGate Deployment Console, check the Receiver Service for the Receiver Path. It can take a few minutes before it appears.

    ![Receiver Service Overview page showing the Receiver Path created as a result of creating the Distribution Path on the source deployment](images/02-15-rcvr.png " ")

In this lab, you created and ran a Path on your on-premises Oracle GoldenGate Distribution Server and sent a trail file from Oracle GoldenGate to OCI GoldenGate.

## Task 3: Add a Checkpoint table

1.  In the OCI GoldenGate Deployment Console, click **Administration Service**, and then open the navigation menu to select **Configuration**.

    ![Select Configration from the Administration Service navigation menu](images/03-01.png " ")

2.  For TargetADW, click **Connect to Database**.

    ![Connect to TargetADW on the Configuration page](images/03-02.png " ")

3.  Next to Checkpoint, click **Add Checkpoint**.

    ![Add Checkpoint icon highlighted](images/03-03.png " ")

4.  For **Checkpoint Table**, enter **"SRCMIRROR\_OCIGGLL"."CHECKTABLE"**, and then click **Submit**.

    ![Add the designated checkpoint table](images/03-04.png " ")

To return to the GoldenGate Deployment Console Home page, click **Overview** in the left navigation.

## Task 4: Add and run a Replicat

This Replicat process consumes the trail file sent from Oracle GoldenGate.

1.  On the Administration Service Overivew page, click **Add Replicat** (plus icon).

    ![Click Add Replicat on Administration Service Overview page](images/04-01.png " ")

2.  On the Add Replicat page, select **Nonintegrated Replicat**, and then click **Next**.

    ![Select Nonintegration Replicat on the Replicat types page](images/04-02.png " ")

3.  On the Replicate Options page, for **Process Name**, enter **Rep**.

4.  For **Credential Domain**, select **OracleGoldenGate**.

5.  For **Credential Alias**, select **TargetADW**.

6.  For **Trail Name**, enter T1.

7.  From the **Checkpoint Table** dropdown, select **"SRCMIRROR\_OCIGGLL"."CHECKTABLE"**.

8.  Under **Managed Options**, enable **Critical to deployment health**.

    ![Enable Critical to deployment health option](images/04-08.png " ")

9.  Click **Next**.

10. In the **Parameter File** text area, replace **MAP \*.\*, TARGET \*.\*;** with **MAP SRC\_OCIGGLL.\*, TARGET SRCMIRROR\_OCIGGLL.\*;**

    ![Modify parameters on the Parameter Files page](images/04-10.png " ")

11. Click **Create**.

12. In the Rep Replicat **Action** menu, select **Start**.

    ![Select Start from the Replicat Action menu on the Administration Service Overview page](images/04-11.png " ")

    The yellow exclamation point icon changes to a green checkmark.  

    ![Replicat status icon](images/04-12.png " ")


In this lab, you created an Extract, a Distribution Path, and a Replicat, and you verified that data is moving from Oracle GoldenGate to OCI GoldenGate. **Proceed to the next lab**.

## Learn more

* [Quickstart - Send data from Oracle GoldenGate to OCI GoldenGate](https://docs.oracle.com/en/cloud/paas/goldengate-service/hotto/index.html)
* [Add an Extract](https://docs.oracle.com/en/cloud/paas/goldengate-service/eeske/index.html)
* [Add a Distribution Path](https://docs.oracle.com/en/cloud/paas/goldengate-service/adpen/index.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Werner He and Julien Testut, Database Product Management
* **Last Updated By/Date** - Jenny Chan, March 2023
