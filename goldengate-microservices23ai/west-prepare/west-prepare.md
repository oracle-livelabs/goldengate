# Replication West to East

## Introduction

This lab walks you through the steps to create a connection to a source database, add transaction information, add a checkpoint table, create a path connection, and create a custom-managed profile in the Oracle GoldenGate West 23ai Microservices WebUI.

Estimated time: 20 minutes


### Objectives
In this lab, you learn to:
* Create a Connection to the West Source database
* Add transaction data and a checkpoint table
* Create a Path Connection
* Create a custom-managed Profile

### Prerequisites

* This lab assumes that you completed all preceding labs

## Task 1: Create a Connection to the West Source database and a Checkpoint table

1. Return to the East Microservices WebUI. In the navigation menu and click **DB Connections**.

    ![Administration Service navigation menu](./images/03-01-nav-config.png " ")

2. Click **Add DB Connection**.

    ![Add DB Connection](./images/03-02-add-db-connec.png " ")

3. A Credentials panel will appear. For Credential Alias, enter **WEST**.

4. For User Alias, paste the **db\_west\_private\_connection** value from the Reservation Information. 

5. For password, paste the **Global Password** from the Reservation Information. Verify the password. 

6. Click **Submit**.

    ![Credentials panel](./images/03-06-credentials.png " ")

7. Click **Connect to database**.

    ![Connect to database](./images/03-07-connect-to-db.png " ")

8. You are directed to the Checkpoint page. Click **Add Checkpoint**.

    ![Add checkpoint](./images/03-08-add-checkpoint.png " ")

9. A Checkpoint Table panel appears. For Checkpoint Table, enter **oggadmin.checkpointtable**. 

10. Click **Submit**.

    ![Checkpoint Table](./images/03-10-checkpoint-table.png " ")

## Task 2: Create Trandata and a Checkpoint table

1. In the navigation menu, click **Trandata**.

    ![Trandata](./images/04-01-trandata.png " ")

2. Click **Add TRANDATA**.

    ![Add Trandata](./images/04-02-add-trandata.png " ")

3. A Trandata panel appears. For Schema Name, enter **HR**. Click **Submit**.

    ![Trandata panel](./images/04-03-trandata.png " ")

4. To verify, enter **HR** into the Search field and click Search.

    ![Verify Trandata](./images/04-04-verify-trandata.png " ")

5. In the navigation menu, click **Heartbeat**. 

6. Click **Add Heartbeat**.

    ![Add Heartbeat](./images/04-06-add-heartbeat.png " ")

7. An Add Heartbeat Table panel appears. Keeps the fields as is and click **Submit**.

    ![Add Heartbeat Table](./images/04-07-add-heartbeat-table.png " ")

## Task 3: Create a Path Connection
1. In the navigation menu, click **Path Connections**.

    ![Path Connections](./images/05-01-path-connections.png " ")

2. Click **Add Path Connection**.

    ![Add Path Connection](./images/05-02-add-path-connection.png " ")

3. A Path Connection panel appears. For Credential Alias, enter **oggnet_alias**.

4. For User ID, enter **oggnet**.

5. For password, paste the Global Password from the Reservation Information. Verify the password. Click **Submit**.

    ![Path Connection panel](./images/05-05-path-connection-panel.png " ")

## Task 4: Create a custom-managed Profile

1. In the navigation menu, click **Managed Process Profiles**.

    ![Click Managed Process Profiles](./images/06-01-managed-process-profiles.png " ")

2. Click **Add Profile**.

    ![Click Add Profile](./images/06-02-add-profile.png " ")

3. An Add Managed Process Settings Profile panel appears. For Profile Name, enter **west-profile**.

4. Select the Default Profile toggle.

5. Select the Auto Start toggle.

6. Select the Auto Restart toggle.

7. Click **Submit**.

    ![Add Managed Process Settings Profile panel](./images/06-07-add-profile-panel.png " ")

You may now **proceed to the next lab.**

## Learn more

* [Add an Extract for Oracle Database](https://docs.oracle.com/en/cloud/paas/goldengate-service/eeske/index.html)

## Acknowledgements
* **Author** - Katherine Wardhana, User Assistance Developer
* **Contributors** -  Alex Lima, Database Product Management
* **Last Updated By/Date** - Katherine Wardhana, July 2024
