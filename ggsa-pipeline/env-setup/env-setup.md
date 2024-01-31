# Set up the environment

## Introduction

In this lab, you learn to create the required resources you'll use for Oracle Cloud Infrastructure (OCI) GoldenGate. We'll show you how to create a VCN and subnet, provision autonomous database instances, and load data into the databases.

Estimated time: 20 minutes

### Objectives

-  Provision a VCN and subnet
-  Provision, connect, and load data into an Autonomous Transaction Processing (ATP) instance
-  Create an OCI GoldenGate data replication deployment
-  Create a Stream

### Prerequisites

This lab assumes you have completed the following labs:
* Get started - Cloud login

> **Notes:** 

> * You may see differences in account details (eg: Compartment Name is different in different places) as you work through the labs. This is because the workshop was developed using different accounts over time.
> * This workshop was designed to use Oracle Autonomous Databases as the source and target. If you plan to use Oracle Database, ensure that you use the CDB user to capture data from the PDBs.

## Task 1: Create a VCN and subnet

1.  Open the **Navigation Menu**, navigate to **Networking**, and select **Virtual Cloud Networks**.

	![Virtual Cloud Networks in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/networking-vcn.png " ")

2.  On the **Virtual Cloud Networks in &lt;compartment-name&gt;** page, click **Start VCN Wizard**.

	![Virtual Cloud Networks page](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/01-02-start-vcn-wizard.png " ")

3.  In the Start VCN Wizard dialog, select **VCN with Internet Connectivity**, and then click **Start VCN Wizard.**

    ![Start VCN Wizard dialog](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/01-03-vcn-wizard.png " ")

4.  Enter a name for the VCN, select a compartment, and then click **Next**.

    ![Enter VCN details](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/01-04-vcn-details.png " ")

5.  Verify the configuration, and then click **Create**.

    ![Verify configuration details](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/01-05-create-vcn.png " ")

6.  Click **View VCN**. You're brought to the Virtual Cloud Network Details page. In the Subnets section, both a private and public subnet were created.

7.  Select the private subnet, and then on the private subnet's details page, under **Security Lists**, select the Default security list.

8.  On the Security List Details page, under **Ingress Rules**, click **Add Ingress Rules**.

## Task 2: Create an ATP instance

1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **Autonomous Transaction Processing**.

	![Autonomous Transaction Processing in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/database-atp.png " ")

2.  On the **Autonomous Database &lt;compartment-name&gt;** page, click **Create Autonomous Database**.

    ![Autonomous Database page](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/01-02-create-adb.png " ")

3. For **Compartment** select a compartment from the dropdown. (Note that yours will be different - do not select **ManagedCompartmentforPaaS**) and then enter **SourceATP** for **Display Name** and **Database Name**.

    ![Create Autonomous Database page](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/02-03-compartment.png " ")

4.  Under **Choose a workload type**, select **Transaction Processing**.

5.  Under **Choose a deployment type**, select **Serverless**.

    ![Deployment type options](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/02-05-deployment.png " ")

6.  Under **Configure the database**, leave **Choose database version** and **Storage (TB)** and **OCPU Count** as they are.

7.  Add a password. Take note of the password, you will need it later in this lab.

    ![Password field](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/02-07-pw.png " ")

8. Under **Access type**, select **Secure access from everywhere**.

9.  Select **Require mutual TLS (mTLS) authentication**.

    ![Choose network access options](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/02-09-choose-network-access.png " ")

10.  For **Choose license and Oracle Database edition**, use the default selection.

    ![License type options](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/02-08-license.png " ")

11.  Click **Create Autonomous Database**. Once it finishes provisioning, you can click on the instance name to see details of it.


## Task 3: Load the ATP schema

1.  Download the database schema:

    [Archive.zip](https://objectstorage.us-ashburn-1.oraclecloud.com/p/VEKec7t0mGwBkJX92Jn0nMptuXIlEpJ5XJA-A6C9PymRgY2LhKbjWqHeB5rVBbaV/n/c4u04/b/livelabsfiles/o/data-management-library-files/Archive.zip)

2.  Save `Archive.zip` to a download directory, and then unzip the file.

3.  Back in the Oracle Cloud console, select your ATP instance from the Autonomous Databases page to view its details and access tools.

    ![Select your Autonomous Database instance](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/03-03-atp.png " ")

4.  On the SourceATP Database Details page, click **Database actions**, and then select **SQL** from the dropdown. If the Database actions menu takes too long to load, you can click **View all database actions** directly, and then select **SQL** from the Database actions page.

    ![ATP details page](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/03-04-dbdetails.png)

5.  If prompted, log in with the ADMIN user and password provided when you created the ATP instance.

    ![DB Actions log in page](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/03-05-login.png " ")

6.  (Optional) Close the Help dialog.

7.  Copy and paste the SQL script from **OCIGGLL\_OCIGGS\_SETUP\_USERS\_ATP.sql** into the SQL Worksheet.

    ![Pasted script in SQL Worksheet](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/03-08-atp-sql.png " ")

8.  Edit the script to remove the special characters from the `SRC_OCIGGLL` user's password.

9.  Click **Run Script**. The Script Output tab displays confirmation messages.

10. Copy and paste the SQL script from **OCIGGLL\_OCIGGS\_SRC\_USER\_SEED\_DATA.sql** a new SQL Worksheet.

    ![Pasted schema script in SQL Worksheet](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/03-10-atp-schema.png " ")

11. Click **Run Script**. The Script Output tab displays confirmation messages.

	> **Note:** If you find that running the entire script does not create the tables, then try running each table creation and insert statements one at a time until all the tables are created. You may also need to relaunch SQL to continue running the scripts until all tables are created and populated.

12. Close the SQL window and then reopen it from Database Actions again.

13. In the Navigator tab, look for the SRC\_OCIGGLL schema and then select tables from their respective dropdowns to verify the schema and tables were created. You may need to log out and log back in if you can't locate SRC\_OCIGGLL.

    ![Displays the SRC\_OCIGGLL tables](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/03-11-verify.png " ")

14. To enable supplemental logging, run the following command:

    ```
    <copy>ALTER PLUGGABLE DATABASE ADD SUPPLEMENTAL LOG DATA;</copy>
    ```

## Task 4: Unlock the GGADMIN user

Oracle Autonomous Databases come with a GGADMIN user that is locked by default. The following steps guide you through how to unlock the GGADMIN user.

1.  From the Oracle Cloud Console navigation menu, click **Oracle Database**, and then select **Autonomous Transaction Processing**.

	![Autonomous Transaction Processing in the Oracle Cloud Console navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-atp.png " ")

2.  From the list of databases, select **SourceATP**.

    ![Autonomous Transaction Processing page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-02-sourceatp.png " ")

3.  On the SourceATP Database Details page, click **Database actions**, and then select **Database Users** from the dropdown. If the Database actions menu takes too long to load, you can click **Database actions** directly, and then select **Database users** from the Database actions page.

    ![SourceATP Database Details page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-03-db-actions.png " ")

4.  If prompted, log in to Database actions as **admin**, using the ATP Admin Password from **View Login Info** in your Workshop instructions.

    ![ATP Database actions log in](./images/03-04-login.png " ")

5.  From the list of users, locate **GGADMIN**, and then click the ellipsis (three dots) icon and select **Edit**.

    ![Database users](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-05-ggadmin.png " ")

6.  In the Edit User panel, deselect **Account is Locked**, enter the password you gave the ggadmin user in the Task 2, Step 10, and then click **Apply Changes**.

    ![Edit user](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/03-06-ggadmin-edit-user.png " ")

    Note that the user icon changes from a padlock to a checkmark.


## Task 5: Create an OCI GoldenGate deployment for data replication

> **Note:** Compartment names in the screenshots may differ from values that appear in your environment.

1.  In the Oracle Cloud console, open the navigation menu, navigate to **Oracle Database**, and select **GoldenGate**.

    ![GoldenGate in Oracle Cloud navigation menu](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/database-goldengate.png " ")

2.  On the GoldenGate **Overview** page, click **Deployments**.

    ![GoldenGate Overview page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-02-ggs-overview.png " ")

3.  On the Deployments page, click **Create deployment**.

    ![Deployments page](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-04-create-deployment.png " ")

4.  In the Create Deployment panel, enter **GGSDeployment** for Name.

5.  From the Compartment dropdown, select **&lt;USER&gt;-COMPARTMENT**.

6.  Select **Development or testing**. The OCPU count is autopopulated based on your selection.

7.  For Subnet, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PRIVATE**.

    ![Completed Create GoldenGate Deployment fields](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-07-create-deployment-general-info.png " ")

8.  For License type, select **Bring Your Own License (BYOL)**.

9.  Click **Show advanced options**, and then select **Enable GoldenGate console public access**.

10. For Load balancer subnet, select a subnet. If you're using the workshop environment, select **&lt;USER&gt;-SUBNET-PUBLIC**.

11. Click **Next**.

    ![Completed Create GoldenGate Deployment fields](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-10-create-deployment-general-info.png " ")

12. For Choose a deployment type, select **Data replication**.

13. For Select a technology dropdown, select **Oracle Database**.

14. For GoldenGate Instance Name, enter **ggsinstance**.

15. In an IAM-enabled tenancy, select a Credential Store. 

    * If you select **OCI Identity and Access Management (OCI IAM)**, click **Create**, and then proceed to the next lab (skip the following steps).
    * If you select GoldenGate, complete the following steps.

16. For Administrator Username, enter **oggadmin**.

17. For Password secret in &lt;USER&gt;-COMPARTMENT, click **Create password secret**.

    ![GoldenGate details](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-16-create-deployment-gg-details.png " ")

18. In the Create secret panel, for Name, enter `LLsecret`.

19. For User password, enter a password 8 to 30 alphanumeric characters in length, containing at least 1 uppercase, 1 lowercase, 1 numeric, and 1 special character.

    > **NOTE**: The special characters must not be $, ^, or ?. 

    ![Create Password secret](https://oracle-livelabs.github.io/goldengate/ggs-common/create/images/01-19-passwordsecret.png " ")

20. Confirm the password, and then click **Create**.

21. Back in the Create deployment panel, for Password secret, ensure **LLsecret** is selected, and then click **Create**.

## Task 6: Create a Stream

1. In the OCI navigation menu, click **Analytics & AI**, and then under Messaging, select **Streaming**.

2. On the Streams page, click **Create Stream**.

3. On the Create Stream page, enter a **Stream Name**, and then click **Create**.

You may now **proceed to the next lab.**

## Acknowledgements

- **Author** - Jenny Chan, Consulting User Assistance Developer
- **Last Updated** - January 2024
- **PAR Expiration date** - February 2024
