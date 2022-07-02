# Set Up Your Environment

## Introduction

This lab walks you through the steps to create the required resources you'll use for this workshop. You'll learn to create a VCN and subnet, provision autonomous databases, and load data into the databases for use with this LiveLab.

> **Note:** *This workshop was designed to use Oracle Autonomous Databases as the source and target. If you plan to use Oracle Database, ensure that you use the CDB user to capture data from the PDBs.*

Estimated time: 20 minutes

### Objectives

-  Provision a VCN and subnet
-  Provision, connect, and load data into an Autonomous Transaction Processing (ATP) instance
-  Provision, connect, and load data into an Autonomous Data Warehouse (ADW) instance

### Prerequisites

This lab assumes you have completed the Getting Started lab.

> **Note:** *You may see differences in account details (eg: Compartment Name is different in different places) as you work through the labs. This is because the workshop was developed using different accounts over time.*

## Task 1: Create a VCN and Subnet
1.  Open the **Navigation Menu**, navigate to **Networking**, and select **Virtual Cloud Networks**.

	![](https://oracle-livelabs.github.io/common/images/console/networking-vcn.png " ")

2.  Click **Start VCN Wizard**.

3.  Select **VCN with Internet Connectivity**, and then click **Start VCN Wizard.**

    ![](./images/00-03-vcn-wizard.png " ")

4.  Enter a name for the VCN, select a compartment, and then click **Next**.

    ![](./images/00-04.png " ")

5.  Review the configuration, and then click **Create**.

You can click **View VCN Details** and to verify both a Public and Private subnet were created.

## Task 2: Create an Autonomous Transaction Processing Instance

1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **Autonomous Transaction Processing**.

	![](https://oracle-livelabs.github.io/common/images/console/database-atp.png " ")

2.  Click **Create Autonomous Database**.

    ![](./images/01-02-create-adb.png " ")

3. Select **Compartment** by clicking on the drop-down list. Note that yours will be different - do not select **ManagedCompartmentforPaaS**. Enter **SourceATP** for **Display Name** and **Database Name**.)

    ![](./images/01-03-compartment.png " ")

4.  Under **Choose a workload type**, select **Transaction Processing**.

    ![](./images/01-04-workload.png " ")

5.  Under **Choose a deployment type**, select **Shared Infrastructure**.

    ![](./images/01-05-deployment.png " ")

6.  Under **Configure the database**, leave **Choose database version** and **Storage (TB)** and **OCPU Count** as they are.

7.  Add a password. Take note of the password, you will need it later in this lab.

    ![](./images/01-07-pw.png " ")

8.  Under **Choose a license type**, select **License Included**.

    ![](./images/01-08-license.png " ")

9.  Click **Create Autonomous Database**. Once it finishes provisioning, you can click on the instance name to see details of it.


## Task 3: Load the Autonomous Transaction Processing Schema

1.  Click the following link to download the database schema.

    [Archive.zip](https://objectstorage.us-ashburn-1.oraclecloud.com/p/VEKec7t0mGwBkJX92Jn0nMptuXIlEpJ5XJA-A6C9PymRgY2LhKbjWqHeB5rVBbaV/n/c4u04/b/livelabsfiles/o/data-management-library-files/Archive.zip)

2.  Save `Archive.zip` to a download directory, and then unzip the file.

3.  Back in the OCI Console, select your Autonomous Transaction Processing instance from the Autonomous Databases list to view its details and access tools.

    ![](./images/02-03-atp.png " ")

4.  Click the **Tools** tab, and then click **Database Actions**.

    ![](./images/02-04-db-actions.png "")

5.  Log in with the ADMIN user and password provided when you created the Autonomous Transaction Processing instance.

6.  From the Database Actions menu, under **Development**, select **SQL**.

    ![](./images/02-06-db-actions.png " ")

7.  (Optional) Click **X** to close the Help dialog.

8.  Copy the SQL script from **OCIGGLL\_OCIGGS\_SETUP\_USERS\_ATP.sql** paste it into the SQL Worksheet.

    ![](./images/02-08-atp-sql.png " ")

9.  Click **Run Script**. The Script Output tab displays confirmation messages.

10. Copy the SQL script from **OCIGGLL\_OCIGGS\_SRC\_USER\_SEED\_DATA.sql** and paste it into a new SQL Worksheet.

    ![](./images/02-10-atp-schema.png " ")

11. Click **Run Script**. The Script Output tab displays confirmation messages.

12. In the Navigator tab, look for the SRC\_OCIGGLL schema and then select tables from their respective dropdowns to verify the schema and tables were created. You may need to log out and log back in if you can't locate SRC\_OCIGGLL.

    ![](./images/02-11-verify.png " ")

13. To enable supplemental logging, run the following command:

    ```
    <copy>ALTER PLUGGABLE DATABASE ADD SUPPLEMENTAL LOG DATA;</copy>
    ```

## Task 4: Create an Autonomous Data Warehouse Instance

1.  Open the **Navigation Menu**, navigate to **Oracle Database**, and select **Autonomous Data Warehouse**.

	![](https://oracle-livelabs.github.io/common/images/console/database-adw.png " ")

2.  Click **Create Autonomous Database**.

    ![](./images/01-02-create-adb.png " ")

3. Select **Compartment** by clicking on the drop-down list. Note that yours will be different - do not select **ManagedCompartmentforPaaS**. Enter **TargetADW** for **Display Name** and **Database Name**.

    ![](./images/04-03-compartment.png " ")

4.  Under **Choose a workload type**, select **Data Warehouse**.

    ![](./images/04-04-workload.png " ")

5.  Under **Choose a deployment type**, select **Shared Infrastructure**.

    ![](./images/04-05-shared.png " ")

6.  Under **Configure the database**, leave **Choose database version** and **Storage (TB)** and **OCPU Count** as they are.

7.  Add a password. Note the password down in a notepad, you will need it later in Lab 2.

    ![](./images/04-07-pw.png " ")

8.  Under **Choose a license type**, select **License Included**.

    ![](./images/04-08-license.png " ")

9.  Click **Create Autonomous Database**. Once it finishes provisioning, you can click on the instance name to see details of it.

## Task 5: Load the Autonomous Data Warehouse Schema

1.  Select your Autonomous Data Warehouse instance from the Autonomous Databases list to view its details and access tools.

    ![](./images/04-01-adw.png " ")

2.  Click the **Tools** tab, and then click **Open Database Actions**.

    ![](./images/05-04-db-actions.png " ")

3.  Log in with the ADMIN user and password provided when you created the Autonomous Transaction Processing instance.

    ![](./images/02-05-login.png " ")

4.  From the Database Actions menu, under **Development**, select **SQL**.

    ![](./images/02-06-db-actions.png " ")

5.  Copy the SQL script from **OCIGGLL\_OCIGGS\_SETUP\_USERS\_ADW.sql** paste it into the SQL Worksheet.

    ![](./images/04-05-adw.png " ")

6.  Click **Run Script**. The Script Output tab displays confirmation messages.

7.  Copy the SQL script from **OCIGGLL\_OCIGGS\_SRC\_MIRROR\_USER\_SEED\_DATA.sql** and paste it into a new SQL Worksheet.

    ![](./images/04-07-adw-schema.png " ")

8.  Click **Run Script**. The Script Output tab displays confirmation messages.

9.  In the Navigator tab, look for the SRCMIRROR\_OCIGGLL schema and then select tables from their respective dropdowns to verify the schema and tables were created. You may need to log out and log back in if you can't locate SRCMIRROR\_OCIGGLL.

You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Jenny Chan, Consulting User Assistance Developer
- **Last Updated By/Date** - Jenny Chan, November 2021
- **PAR Expiration date** - March 31, 2022
