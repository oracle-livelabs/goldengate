# Set up and run replication processes

## Introduction
This lab instructs you to use the OCI GoldenGate deployment console to add transaction information to the source database, and then add and run an Extract.

Estimated time: 15 minutes

Watch the video below for a quick walk-through of the lab.
[Set up and run replication processes](videohub:1_d6g4fbsx)

### About Extracts, Distribution paths, and Replicats
An Extract is a process that extracts, or captures, data from a source database. A Distribution Path is a source-to-destination configuration that uses the Distribution Server.

### Objectives
In this lab, you learn to:

* Log in to the OCI GoldenGate deployment console
* Connect to the source database to add transaction information
* Add and run an Extract
* Add and run a Distribution path
* Add and run a Replicat

## Task 1: Launch the GoldenGate Deployment Console

1. On the **ATPDeployment** details page, click **Launch Console**.

    ![ATPDeployment Launch Console](images/02-01-launch-console.png " ")

2. To log in to the GoldenGate deployment console, enter **oggadmin** for User name and the password, and then click **Sign In**.

    ![GoldenGate Deployment Console](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-02-oggadmin-23ai.png " ")

    > **Note:** If using the LiveLab Sandbox environment, copy the deployment password from the Terraform output section of **View Login Info**.

    ![View Login info](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-02a-view-login-info.png " ")

    ![Terraform values](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-02b-terraform-values.png " ")

After you log in, you're brought to the GoldenGate deployment console home page. Here, you can access the GoldenGate Administration, Performance Metrics, Distribution, and Receiver Services, as well as add Extracts and Replicats for your data replication tasks.

## Task 2: Add Trandata Information

> **Note:** Ensure that you enable supplemental logging before adding an Extract or you may encounter errors. If you encounter errors, delete and add the Extract before trying again.

1.  Open the navigation menu and then click **DB Connections**.

    ![Administration Service navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-01-nav-config.png " ")

2.  Click **Connect to database SourceATP**.

    ![Credentials list with Connect to database SourceATP highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-02-connect-source.png " ")

3.  Next to **TRANDATA Information** click **Add TRANDATA** (plus icon).

    ![Add TRANDATA](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-03-trandata-23ai.png " ")

4.  For **Schema Name**, enter `SRC_OCIGGLL`, and then click **Submit**.

    ![Schema Name field populated with SRC_OCIGGLL](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-04-schema-name-23ai.png " ")

5.  To verify, click **Search TRANDATA**, and then enter `SRC_OCIGGLL` into the Search field and click **Search**.

    ![Search icon highlighted](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-05-search-23ai.png " ")

    ![SRC_OCIGGLL entered in search field and search results returned](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/03-05-trandata-23ai.png " ")

To return to the GoldenGate Deployment Console Home page, click **Overview** in the left navigation.

## Task 3: Add and run an Extract

1.  On the GoldenGate Deployment Console Home page, click **Add Extract** (plus icon).

    ![Click Add Extract](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-01-extracts-23ai.png " ")

2.  The Add Extract panel consists of five pages. On the Extract Information page, complete the following fields, and then click **Next**:

    * For **Extract Type**, select **Integrated Extract**.
    * For **Process Name**, enter a name for this Extract process, such as UAEXT.

    ![Extract Information page](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-03-int-extract-23ai.png " ")

3. On the Extract Options page, complete the following fields, and then click Next:

    * For **Domain**, select **OracleGoldenGate** from the dropdown.
    * For **Alias**, select the Credential Alias for the source Autonomous Transaction Processing database.
    * For **Trail Name**, enter a two-character name for the Trail file, such as E1.

    ![Extract Options page](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-06-extract-options-23ai.png " ")

4. On the Managed Options page, enable **Critical to deployment health**, and then click **Next**.

    ![Managed Options page](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-07-dephealth-23ai.png " ")

5. In the Parameter File page, add a new line, paste the following to the text area, and then click **Create and Run**:

    ```
    <copy>-- Capture DDL operations for listed schema tables
    ddl include mapped

    -- Add step-by-step history of ddl operations captured
    -- to the report file. Very useful when troubleshooting.
    ddloptions report

    -- Write capture stats per table to the report file daily.
    report at 00:01

    -- Rollover the report file weekly. Useful when IE runs
    -- without being stopped/started for long periods of time to
    -- keep the report files from becoming too large.
    reportrollover at 00:01 on Sunday

    -- Report total operations captured, and operations per second
    -- every 10 minutes.
    reportcount every 10 minutes, rate

    -- Table list for capture
    table SRC_OCIGGLL.*;</copy>
    ```

    ![Parameter Options page](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-08-paramfile.png " ")

    ![Extract started](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/04-10-uaext-running.png " ")

## Task 4: Create a user on the target deployment

>**Note**: Complete the following steps in the target **OBJDeployment**'s deployment console (BDinstance).

1.  In the Oracle Cloud console, click **Deployments** in the breadcrumb.

2.  On the Deployments page, click **OBJDeployment** to view its details.

3.  Click **Launch Console**.

    ![OBJDeployment Launch Console](images/05-03-launch-console.png " ")

4.  To log in to the GoldenGate deployment console, enter **oggadmin** for User name and the password, and then click **Sign In**.

    > **Note:** If using the LiveLab Sandbox environment, copy the deployment password from the Terraform output section of **View Login Info**.

5.  In the BDinstance deployment console, open the navigation menu, and then click **User Administration**.

    ![BDinstance deployment console navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/02-05-adminstrator.png " ")

6.  On the Users page, click **Add New User** (plus icon).

    ![Add new user](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/05-06-add-new-user-23ai.png " ")

7. In the Create new User panel, complete the following fields, and then click **Submit**:

    * For the Authenticated By dropdown, select **Password**.
    * For the **Role** dropdown, select **Administrator**.
    * For **Username**, enter **dpuser**.
    * For **Password**, paste the Global Password from the Reservation Information. Verify the password.

    ![Create new User panel](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/05-07-create-new-user-23ai.png " ")

## Task 5: Create a credential on the source deployment for the dpuser

>**Note**: Complete the following steps in the source **ATPDeployment** deployment console (ATPinstance).

1.  In the source ATPinstance deployment console, click **Administration Service**, open the navigation menu, and then select **DB Connections**.  

2.  On the Credentials page, click Add Credential (plus icon).

    ![Credentials page](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/06-02-add-credential-23ai.png " ")

3. In the Credentials panel, complete the following fields, and then click **Submit**:

    * For Credential Domain, enter **ggs2objstore**.
    * For Credential Alias, enter **ocinetwork**.
    * For User ID, enter **dpuser**.
    * For **Password**, enter a password. Verify the password.

    ![Create new User panel](https://oracle-livelabs.github.io/goldengate/ggs-common/extract/images/06-03-credentials-panel-23ai.png " ")

## Task 6: Add and run a Distribution Path in the source deployment console

>**Note**: Complete the following steps in the source **ATPDeployment** deployment console (ATPinstance).

The Distribution Path initiates the process to send the GoldenGate trail file to Oracle Object Storage.

1.  In the source ATPinstance deployment console, click **Distribution Service**, and then click **Add Path** (plus icon).

    ![Distribution Service Overview](images/07-01-addpath.png " ")

2. The Add Path panel consists of seven pages. On the Path Information page, for Name, enter **GGStoObjStore**, and then click **Next**.

    ![Distribution Service Overview](images/07-02-path-info.png " ")

3. On the Source Options page, complete the following fields, and then click **Next**:

    * For Source Extract, select **UAEXT** from the dropdown.
    * For Trail Name, **E1** should automatically populate the field.

    ![Source Options page](./images/07-03-source-opts.png " ")

4. On the Target Options page, complete the following fields, and then click **Next**:

    * For Target Host, enter the BDinstance hostname in the following format: **&lt;domain&gt;.deployment.goldengate.us-&lt;region&gt;-1.oci.oraclecloud.com**.
    
    > **Note:** You can copy the host from the browser address bar of target BDinstance deployment console window, or copy the Console URL from the Deployment Details page and remove the https:// and any trailing slashes (/).

    ![Deployment details](./images/07-04a-deployment-details.png " ")

    * For Port Number, enter **443**.
    * For Trail Name, enter a two-character name for the Trail file when it is received by OCI GoldenGate. For example, **T1**.
    * For Alias, enter the alias name you created in Oracle GoldenGate. For example, **ocinetwork**.

    ![Target Options page](images/07-04b-target-opts.png " ")

5. On the Advanced Options page, leave the fields as they are, and click **Next**.

    ![Advanced Options page](images/07-05-adv-opts.png " ")

6. On the Filtering Options page, leave the fields as they are, and click **Next**.

    ![Filtering Options page](images/07-06-filt-opts.png " ")

7. On the Managed Options page, leave the fields as they are, and click **Create Path**.

    ![Filtering Options page](images/07-07-managed-opts.png " ")

8. On the left hand navigation menu, click **Distribution Paths**.

9. In the GGStoObjStore **Action** menu, select **Start**. In the Confirm Action dialog, click **OK**.

    ![Start Distribution Path](images/07-09a-start-dp.png " ")

    The **Stopped** grey status icon becomes a **Running** green checkmark when the Distribution Path starts successfully.

    ![Running Distribution Path](images/07-09b-running-dp.png " ")

## Task 7: Verify Receiver Path creation

The Distribution path on the source ATPinstance creates a Receiver path on the target BDinstance.

>**Note**: Complete the following steps in the **OBJDeployment** deployment console (BDinstance).

1.  In the target BDinstance deployment console, click **Receiver Service**.

2.  On the Receiver Service Path page, verify that the path you created in previous tasks.

    ![BDinstance Receiver Service](images/08-02-receiver-service.png " ")

## Task 8: Add and run a Replicat

>**Note**: Complete the following steps in the **OBJDeployment** deployment console (BDinstance).

1.  Click **Administration Service**.

2.  In the Replicats section, click **Add Replicat** (plus icon).

    ![BDinstance Administration Service](images/09-02-add-replicat.png " ")

3.  On the Replicat Information page, complete the following fields, and then click **Next**:

    * For Replicat Type, select **Nonintegrated Replicat**
    * For Process Name, enter **REP**.

    ![Replicat Information page](images/09-03-add-replicat.png " ")

4. On the Replicat Options page, complete the following fields, and then click **Next**:

    * For Replicat Trail Name, enter **T1**.
    * For Domain, select **OCI Object Storage**.
    * For Alias, select **TargetObjStore**.
    * For Checkpoint Table, select "SRCMIRROR_OCIGGLL"."CHECKTABLE".

    ![Replicat Options page](images/09-04-replicat-opts.png " ")

5. On the Managed Options page, leave the fields as they are, and click **Next**.

    ![Managed Options page](images/09-05-managed-opts.png " ")

6. On the Parameter Files page, change `MAP *.*, TARGET *.*;` to `MAP SRC_OCIGGLL.*, TARGET *.*;`, and then click **Create and Run**.

    ![Parameter Files page](images/09-06-param-file.png " ")

    The **Stopped** grey status icon becomes a **Running** green checkmark when the Distribution Path starts successfully.

    ![Running Replicat](images/09-07-running-rep.png " ")

In this lab, you:
* Added transaction data to the source database
* Added an Extract
* Created a user for the source deployment to connect to the target deployments
* Added a Distribution Path on the source deployment, which created a Receiver Path on the target deployment
* Added a Replicat process to replicate data from the Autonomous Transaction Processing instance to an OCI Object Storage bucket

**Proceed to the next lab**.

## Learn More

* [Explore the OCI GoldenGate deployment console](https://docs.oracle.com/en/cloud/paas/goldengate-service/jbkyg/index.html)
* [Add an Extract for Oracle Database](https://docs.oracle.com/en/cloud/paas/goldengate-service/eeske/index.html)
* [Add a Distribution Path](https://docs.oracle.com/en/cloud/paas/goldengate-service/adpen/index.html)
* [Add a Replicat for OCI Object Storage](https://docs.oracle.com/en/cloud/paas/goldengate-service/eepsp/index.html)

## Acknowledgements
* **Author** - Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Contributors** -  Deniz Sendil, Database Product Management; Katherine Wardhana, User Assistance Developer
* **Last Updated By/Date** - Katherine Wardhana, June 2025
