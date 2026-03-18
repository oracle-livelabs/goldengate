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

This lab assumes that you completed all preceding labs. For the purposes of this lab, the source database used in this lab is Oracle Autonomous Transaction Processing and the target database is Oracle Autonomous AI Lakehouse.

## Task 1: Add Transaction data

1. In the OCI GoldenGate Deployment console navigation menu, click **DB Connections**.

    ![Administration Service navigation menu](./images/01-01-db-connections.png " ")

2. On the DB Connections page, click **Connect to database SourceATP**.

    ![Credentials list with Connect to database SourceATP highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-02-connect-sourceatp.png " ")

3. In the navigation menu, expand **SourctATP**, and then select **Trandata**. 

    ![Select SourceATP Trandata](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-01-nav-config-dbconnections.png " ")

4. On the TRANDATA Information page, click **Add TRANDATA** (plus icon).

    ![Add TRANDATA](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-03-trandata-23ai.png " ")

5. For **Schema Name**, enter **SRC\_OCIGGLL**, and then click **Submit**. You only need to click Submit once. Click Search, and then enter SRC_OCIGGLL to verify.

    ![Schema Name field populated with SRC_OCIGGLL](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-04-schema-name-23ai.png " ")

    ![Schema Name search on TRANDATA page](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-05-search-23ai.png " ")

## Task 2: Add and run an Extract in OCI GoldenGate

This Extract process captures data from the source database to send to Oracle GoldenGate.

1. In the OCI GoldenGate Deployment console navigation menu, and click **Extracts**.

    ![Select Extracts in navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-01-extracts-23ai.png " ")

2. On the Extracts page, click **Add Extract**.

    ![Add Extract](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-02-add-extract-23ai " ")

2. The Add Extract panel consists of five pages. On the Extract Information page, complete the following fields, and then click **Next**:

    *  For **Extract Type**, select **Integrated Extract**.
    *  For **Process Name**, enter a name for this Extract process, such as UAEXT.

    ![Extract Information page](./images/02-02-add-extract.png " ")

3. On the Extract Options page, complete the following fields, and then click **Next**:

    *  For **Domain**, select **OracleGoldenGate** from the dropdown.
    *  For **Alias**, select the Credential Alias for the source Autonomous Transaction Processing database (SourceATP).
    * For **Trail Name**, enter a two-character name for the Trail file, such as E1.

    ![Extract Options page](./images/02-03-extract-options.png " ")

4. On the Managed Options page, leave the fields as they are, and click **Next**.

    ![Managed Options page](./images/02-04-managed-options.png " ")

5. In the Parameter File page, add a new line, paste the following to the text area, and then click **Create and Run**:

    ```
    <copy>Table SRC_OCIGGLL.*;</copy>
    ```

    ![Add Extract Parameters on the Parameter Files page](./images/02-05-param-file.png " ")

    You're returned to the Extracts page.

    ![Extract icon](./images/02-06b-ggs-extract-started.png " ")

## Task 3: Add and run a Target-initiated path

The Target-Initiated Path initiates the process to pull the OCI GoldenGate trail file down to Oracle GoldenGate.

1. In the Marketplace Oracle GoldenGate Administration Service console, click **Receiver Service Paths**.

    ![Click Receiver Service](./images/03-01-receiver-server.png " ")

2. On the Receiver Service Paths page, click **Add Target-Initiated Path** (plus icon).

    ![Click Add Target-Initiated Path on the Receiver Server page](./images/03-02-add-path.png " ")

3. The Add Path panel consists of six pages. On the Path Information page, complete the following fields, and then click **Next**:

    *  For **Path Name**, enter a name for this Path. For example, **GGStoOGG**.
    *  For **Description**, optionally, enter a description.

    ![Add Path Name](./images/03-03-path-name.png " ")

4. On the Source Options page, complete the following fields, and then click **Next**:

    *  For **Source Protocol**, select **wss**.
    *  For **Source Host**, enter the OCI GoldenGate hostname in the following format: **&lt;domain&gt;.deployment.goldengate.&lt;region&gt;.oci.oraclecloud.com**.

    >**NOTE:** You can copy the host from the browser address bar of your OCI GoldenGate Deployment Console window, or copy the Console URL from the Deployment Details page and remove the https:// and any trailing slashes (/).

    ![Copy the browser address bar of your OCI GoldenGate Deployment Console window](./images/03-04b-copy-browser.png " ")
    
    *  For **Port Number**, enter 443.
    *  For **Trail Number**, enter E1.
    *  For **Source Authentication Method**, select **UserID Alias**.
    *  For **Alias**, select the alias you created (**ggs2ogg**) from the dropdown.

    ![Add Path Name](./images/03-04-path-desc.png " ")

5. On the Target Options page, complete the following fields, and then click **Next**: 

    * For **Trail Name**, enter a two-character name for the Trail file when it is received by Oracle GoldenGate. For example, **T1**.
    * For **Generated Target URI**, click **Edit Target URI** (pencil icon), enter the **Internal FQDN** instead of the Public IP.

    ![Add Path Name](./images/03-05a-target-opts.png " ")

    >**NOTE:** You can copy the Internal FQDN from the Compute Instance details page.

    ![Copy the Internal FQDN from the Compute Instance details page](./images/03-05b-copy-internal-fqdn.png " ")

6. On the Advanced Options page, leave the fields as they are, and click **Next**.

    ![Advanced Options page](./images/03-06-adv-opts.png " ")

7. On the Filtering Options page, leave the fields as they are, and click **Next**.

    ![Filtering Options page](./images/03-07-filtering-opts.png " ")

8. On the Managed Options page, leave the fields as they are, and click **Create Path**.

    ![Managed Options page](./images/03-08-managed-opts.png " ")

9. Return to the Receiver Service Paths page, and then select **Start** from the Target-Initiated Path's **Actions** column.

    ![Start Target-initiated path](./images/03-09-start-path.png " ")

10. In the OCI GoldenGate Deployment Console, check the Distribution Service for the Distribution Path. It can take a few minutes before it appears.

    ![Check Distribution Path](./images/03-10-dist-path.png " ")

In this task, you created and ran a target-inititated path on your on premises Oracle GoldenGate Receiver Service and sent a trail file from OCI GoldenGate to Oracle GoldenGate.

## Task 4: Add a Checkpoint table

1. In the Oracle GoldenGate Marketplace Administration Service, select **DB Connections** in the navigation menu.

    ![Select DB Connections from the Administration Service navigation menu](./images/01-01-db-connections.png " ")

2. For the target Autonomous AI Lakehouse database, click **Connect to Database**.

    ![Connect to TargetALK on the Configuration page](./images/04-02-connect-db.png " ")

3. Next to Checkpoint, click **Add Checkpoint**.

    ![Add Checkpoint icon highlighted](./images/04-03-add-checkpoint.png " ")

4. For **Checkpoint Table**, enter **"SRCMIRROR\_OCIGGLL"."CHECKTABLE"**, and then click **Submit**.

    ![Add the designated checkpoint table](./images/04-04-submit-checkpoint.png " ")


## Task 5: Add and run a Replicat

This Replicat process consumes the trail file sent from OCI GoldenGate.

1. In the Oracle GoldenGate Administration Service navigation menu, select **Replicats**.

    ![Select Replicats](https://oracle-livelabs.github.io/goldengate/ggs-common/extracts-replicats/images/02-01-replicats.png " ")

2. On the Replicats page, click **Add Replicat**.

    ![Click Add Replicat on Administration Service Overview page](./images/05-01-add-rep.png " ")

2. The Add Replicat panel consists of four pages. On the Replicat Information page, complete the following fields, and then click **Next**:

    *  For **Replicat Type**, select **Nonintegrated Extract**.
    *  For **Process Name**, enter a name for this Extract process, such as REP.

    ![Select Nonintegration Replicat on the Replicat types page](./images/05-02-rep-info-page.png " ")

3.  On the Replicat Options page, complete the following fields, and then click **Next**:

    *  For **Replicat Trail Name**, enter **T1**.
    *  For **Domain**, select **OracleGoldenGate**.
    *  For **Alias**, select **TargetALK**.
    *  For **Checkpoint Table**, select **"SRCMIRROR\_OCIGGLL"."CHECKTABLE"**.

    ![Replicat Options page](./images/05-03-rep-options.png " ")

4. On the Managed Options page, leave the fields as they are, and click **Next**.

    ![Managed Options page](./images/05-04-managed-options.png " ")

5. On the Parameter File page, in the text area, replace  **MAP \*.\*, TARGET \*.\*;** with the following script:

    ```
    <copy>MAP SRC_OCIGGLL.*, TARGET SRCMIRROR_OCIGGLL.*;</copy>
    ```

6.  Click **Create**.

    ![Parameter File page](./images/05-06-param-file.png " ")

7. The REP Replicat appears. In the REP **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**.

    ![Start Replicat](./images/05-07a-start-rep.png " ")

    ![Running Replicat](./images/05-07b-running-rep.png " ") 

8. Return to the OCI Console and use the navigation menu (hamburger icon) to navigate back to **Oracle Database**, **Autonomous Transaction Processing**, and then **SourceATP**.

## Task 6: Confirm the Target-initiated path is running

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
* **Last Updated By/Date** - Katherine Wardhana, January 2025
