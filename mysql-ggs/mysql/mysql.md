# Create MySQL Extracts

## Introduction

This lab walks you through the steps to create Extracts and Distribution Paths on the source MySQL deployment.

Estimated time: 30 minutes

### About Extracts and Distribution Paths

An Extract is a process that extracts, or captures, data from a source database. A Distribution Path is a source-to-destination configuration that uses the Distribution Server to send data to a target deployment in a distributed environment.

### Objectives

In this lab, you will:
* Create an Initial Load Extract
* Create a Distribution Path for the Initial Load Extract
* Create a Integrated Extract
* Create a Distribution Path for the Integrated Extract

### Prerequisites

To successfully complete this lab, you need:
* Both the source and target deployments are in the Active state
* The oggadmin password for the source MySQL OCI GoldenGate deployment (Lab 1, Task 1, Step 15)
* The oggadmin password for the target ADW OCI GoldenGate deployment (Lab 1, Task 2, Step 11)

## Task 1: Create the Integrated Extract

1.  On the Deployments page, select the source MySQL deployment to view its details.

2.  On the Deployment details page, click **Launch console**.

    ![Deployment launch console](./images/02-01-launchconsole.png " ")

3.  To log in to the GoldenGate deployment console, enter **oggadmin** for User name, enter the password, and then click **Sign In**. 

    ![GoldenGate deployment console sign in](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-02-oggadmin-23ai.png " ")

    > **NOTE:** If using the LiveLab Sandbox environment, copy the OCI GoldenGate Admin Password from the Terraform output section of **View Login Info**.

    ![View Login info](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-02a-view-login-info.png " ")

    ![Terraform values](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-02b-terraform-values.png " ")

    After you log in successfully, you're brought to the GoldenGate 23ai deployment console home page. Here, you can access the GoldenGate Administration, Distribution and Receiver Services, Performance Metrics Service, as well as add Extracts and Replicats for your data replication tasks.

    ![GoldenGate 23ai deployment console](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-03-webui-23ai.png " ")

4.  Open the navigation menu, and then click **DB Connections**.

    ![Select DB Connections from the navigation menu](./images/01-04-db-connections.png " ")

5.  On the Credentials page, locate **SourceMySQL**, and then take note of its **Domain** and **Alias**.

    ![Note the Domain and Alias of the SourceMySQL credential](./images/01-05-credentials.png " ")

6.  In the Action column for the SourceMySQL database, Click **Connect to database SourceMySQL** to test the connection.

    ![Click Connect to database SourceMySQL](./images/01-06-connect.png " ")

    If the connection is successful, then Checkpoint and Heartbeat appear. If the connection is unsuccessful, return to the MySQL connection in the Oracle Cloud console to review the connection settings.

7.  On the Home page, click **Add Extract** (plus icon).

    ![Add Extract](./images/01-07-add-ext.png " ")

8. In the Add Extract panel, on the Extract Information page, complete the following fields, and then click **Next**: 

    * For **Extract Type**, select **Change Data Capture Extract**.
    * For **Process Name**, enter `CDCEXT`.

    ![Select Change Data Capture Extract for Extract type](./images/01-08-cdc-ext.png " ")

9. On the Extract Options page, complete the following fields, and then click **Next**:  

    * For Extract Trail **Name**, enter `C1`.
    * For Source Credentials **Domain**, select **OracleGoldenGate**.
    * For Source Credentials **Alias**, select **SourceMySQL**.

    ![Extract Options page](./images/01-09-ext-opts.png " ")

10. On the Managed Options page, leave the fields as they are, and then click **Next**.

    ![Managed Options page](./images/01-10-man-opts.png " ")

11. On the Parameter File page, in the text area, add a new line to the existing text, add the following, and then click **Create and Run**:

    ```
    <copy>TABLE SRC_OCIGGLL.*;</copy>
    ```

    ![Verify Parameter File](./images/01-13a-remote-params.png " ")

    You return to the Administration Service Overview page where you can observe the `CDCEXT` process starting.

    The status updates to Running.

    ![Administration Service Overview page with Integrated Extract](./images/01-13b-ext.png " ")

## Task 2: Create the Initial Load Extract

1.  In the navigation menu, click **Overview**.

2.  On the Overview page, click **Add Extract** (plus icon)

    ![Click Add Extract on Administration Service Overview page](./images/02-02-add-extract.png " ")

3.  In the Add Extract panel, on the Extract Information page,  on the Extract Information page, complete the following fields, and then click **Next**: 

    * For **Extract Type**, select **Initial Load Extract**.
    * For **Process Name**, enter `ILEXT`.

    ![Select Initial Load Extract for Extract type](./images/02-03-extract-info.png " ")

4. On the Extract Options page, complete the following fields, and then click **Next**:  

    * For Extract Trail **Name**, enter `I1`.
    * For Source Credentials **Domain**, select **OracleGoldenGate**.
    * For Source Credentials **Alias**, select **SourceMySQL**.

    ![Extract Options page](./images/02-04-ext-opts.png " ")

5.  On the Parameter File page, in the text area, add a new line to the existing text, add the following, and then click **Create and Run**:

    ```
    <copy>TABLE SRC_OCIGGLL.*;</copy>
    ```

    ![Parameter file page](./images/02-05-param-file.png " ")

    You return to the Administration Service Overview page where you can observe the `ILEXT` process starting.

    The status updates to Running.

## Task 3: Create an OCI GoldenGate user for the Distribution Paths
In this task, you create a user in the target deployment for the Distribution Paths to use to send data.

1.  In the Oracle Cloud console, on the **Deployments** page, select the target Autonomous Data Warehouse deployment to view its details.

2.  On the deployment details page, click **Launch console**.

3.  On the OCI GoldenGate deployment console sign in page, enter `oggadmin` for User Name, enter the password, and then click **Sign In**.

    ![GoldenGate deployment console sign in](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-02-oggadmin-23ai.png " ")

    > **NOTE:** If using the LiveLab Sandbox environment, copy the OCI GoldenGate Admin Password from the Terraform output section of **View Login Info**.

4.  Open the navigation menu, and then click **User Administration**.

5.  Click **Add New User** (plus icon).

    ![Click Add New User on the Users page](./images/03-05-add-user.png " ")

6.  Complete the fields as follows, and then click **Submit**:
    * For **Authenticated By**, select **Password**.
    * For **Role**, select **Operator**.
    * For **Username**, enter `ggsnet`.
    * Enter a password for this user, and then enter it again for verification.

    ![Enter details for the ggsnet user](./images/03-06-ggsnet.png " ")

    The `ggsnet` user appears in the Users list.

7.  In the source MySQL OCI GoldenGate deployment console, open the navigation menu and then click **DB Connections**.

8.  On the DB Connections page, click **Add Credential** (plus icon).

9.  Complete the fields as follows, and then click **Submit**:
    * For **Credential Domain**, enter `GGSNetwork`.
    * For **Credential Alias**, enter `dpuser`.
    * For **User ID**, enter `ggsnet`.
    * For **Password**, enter the password from Step 6.

    ![Add new credential](./images/03-09-credential.png " ")

    The credential appears in the Credentials list.

## Task 4: Create the Distribution Path for the Initial Load Extract

1.  In the source MySQL OCI GoldenGate deployment console, click **Distribution Service**.

2.  On the Distribution Service Overview page, click **Add Distribution Path** (plus icon).

    ![Click Add Path on source deployment Distribution Service](./images/04-02-add-path.png " ")

3. The Add Path panel consists of seven pages. On the Path Information page, for **Name**, enter `ILDP`, and then click **Next**.

  ![Path Information page](./images/04-03-path-info.png " ")

4. On the Source Options page, complete the following fields, and then click **Next**:

    * For **Source Extract**, select **CDCEXT** from the dropdown.
    * For **Trail Name**, `I1` should automatically populate the field.

  ![Source Options page](./images/04-04-source-opts.png " ")

5. On the Target Options page, complete the following fields, and then click **Next**:

    * For **Target Host**, enter the target ADW OCI GoldenGate deployment console URL, without the https:// or any trailing slashes. You can copy the console URL from the ADWDeployment details page.

    ![Copy console URL from target deployment details page](./images/04-05a-console-url.png " ")

    * For **Port Number**, enter **443**.
    * For **Trail Name**, enter `C1`.
    * For **Alias**, enter **dpuser**.

    ![Target Options page](./images/04-05b-target-opts.png " ")

6. On the Advanced Options page, leave the fields as they are, and click **Next**.

    ![Advanced Options page](./images/04-06-adv-opts.png " ")

7. On the Filtering Options page, leave the fields as they are, and click **Next**.

    ![Filtering Options page](./images/04-07-filt-opts.png " ")

8. On the Managed Options page, leave the fields as they are, and click **Create Path and Run**.

    ![Managed Options page](./images/04-08-man-opts.png " ")

    You return to the Distribution Service Overview page where you can review the path created.

4.  In the target ADW OCI GoldenGate deployment console (**adw_instance**), click **Receiver Service** to review the Receiver Path created as a result of creating the `ILDP` Distribution Path.

## Task 5: Create the Distribution Path for the Change Data Capture Extract

1.  In the source MySQL OCI GoldenGate deployment console, click **Distribution Service**.

2.  On the Distribution Service Overview page, click **Add Path** (plus icon).

    ![Click Add Path in source deployment Distribution Service](./images/05-02-add-path.png " ")

3. The Add Path panel consists of seven pages. On the Path Information page, for **Name**, enter `CDCDP`, and then click **Next**.

  ![Path Information page](./images/05-03-path-info.png " ")

4. On the Source Options page, complete the following fields, and then click **Next**:

    * For **Source Extract**, select **CDCEXT** from the dropdown.
    * For **Trail Name**, `C1` should automatically populate the field.

  ![Source Options page](./images/04-04-source-opts.png " ")

5. On the Target Options page, complete the following fields, and then click **Next**:

    * For **Target Host**, enter the target ADW OCI GoldenGate deployment console URL, without the https:// or any trailing slashes. You can copy the console URL from the ADWDeployment details page.

    ![Copy console URL from target deployment details page](./images/04-05a-console-url.png " ")

    * For **Port Number**, enter **443**.
    * For **Trail Name**, enter `C1`.
    * For **Alias**, enter **dpuser**.

    ![Target Options page](./images/04-05b-target-opts.png " ")

6. On the Advanced Options page, leave the fields as they are, and click **Next**.

    ![Advanced Options page](./images/04-06-adv-opts.png " ")

7. On the Filtering Options page, leave the fields as they are, and click **Next**.

    ![Filtering Options page](./images/04-07-filt-opts.png " ")

8. On the Managed Options page, leave the fields as they are, and click **Create Path and Run**.

    ![Managed Options page](./images/04-08-man-opts.png " ")

    You return to the Distribution Service Overview page where you can review the path created.

4.  In the target ADW OCI GoldenGate deployment console, click Receiver Service to review the Receiver Path created as a result of creating the `CDCDP` Distribution Path.

## Learn more

* [Explore the OCI GoldenGate deployment console](https://docs.oracle.com/en/cloud/paas/goldengate-service/jbkyg/index.html)
* [Add an Extract for MySQL](https://docs.oracle.com/en/cloud/paas/goldengate-service/ufidx/index.html)
* [Add a Distribution Path](https://docs.oracle.com/en/cloud/paas/goldengate-service/adpen/index.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Julien Testut, Database Product Management
* **Last Updated By/Date** - Katherine Wardgaba, February 2025
