# Set up your environment

## Introduction

In this lab, you learn to create the required resources you'll use for Oracle Cloud Infrastructure (OCI) GoldenGate. You create a VCN and subnet, provision autonomous database instances, and load data into the databases.

Estimated time: 20 minutes

### Objectives

-  Provision a VCN and subnet
-  Provision, connect, and load data into an Autonomous Transaction Processing (ATP) instance
-  Provision, connect, and load data into an Autonomous Data Warehouse (ADW) instance

### Prerequisites

This lab assumes you completed the Get started lab.

> **Note:** 
* You may see differences in account details (eg: Compartment Name is different in different places) as you work through the labs. This is because the workshop was developed using different accounts over time.
* This workshop was designed to use Oracle Autonomous Databases as the source and target. If you plan to use Oracle Database, ensure that you use the CDB user to capture data from the PDBs.

## Task 1: Create a VCN and subnet
 
[](include:01-create-vcn-subnet.md)

## Task 2: Create an ATP instance

[](include:02-create-atp-instance.md)

## Task 3: Load the ATP schema

[](include:03-load-atp-schema.md)

## Task 4: Create an ADW Instance

[](include:04-create-adw-instance.md)

## Task 5: Load the ADW schema

1.  Select your ADW instance from the Autonomous Databases list to view its details and access tools.

    ![List of Autonomous Databases](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/05-01-adw.png " ")

2. On the TargetADW Database Details page, click **Database actions**, and then select **SQL** from the dropdown. If the Database actions menu takes too long to load, you can click **View all database actions**, and then select **SQL** from the Database actions page.

	![TargetADW database details](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/05-02-db-actions.png " ")

3. If prompted, log in using the ADMIN username and password set in task 4, step 7.

4.  Copy the SQL script from **OCIGGLL\_OCIGGS\_SETUP\_USERS\_ADW.sql** paste it into the SQL Worksheet.

5.  Click **Run Script**. The Script Output tab displays confirmation messages.

	>**Note:** If you find that running the entire script does not create the tables, then try running each table creation and insert statements one at a time until all the tables are created. You may also need to relaunch SQL to continue running the scripts until all tables are created and populated.

    ![Copy target schema script into SQL tool](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/03-08-atp-sql.png " ")

6.  Copy the SQL script from **OCIGGLL\_OCIGGS\_SRC\_MIRROR\_USER\_SEED\_DATA.sql** and paste it into a new SQL Worksheet.

    ![Pasted script in SQL worksheet](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/03-10-atp-schema.png " ")

7.  Click **Run Script**. The Script Output tab displays confirmation messages.

8.  In the Navigator tab, look for the SRCMIRROR\_OCIGGLL schema and then select tables from their respective dropdowns to verify the schema and tables created. You may need to log out and log back in if you can't locate SRCMIRROR\_OCIGGLL.

## Task 6: Create the deployment

[](include:05-create-deployment.md)

**Proceed to the next lab.**

## Learn more

* [Create deployments](https://docs.oracle.com/en/cloud/paas/goldengate-service/llyhq/index.html)

## Acknowledgements

- **Author** - Jenny Chan, Consulting User Assistance Developer
- **Last Updated By/Date** - Katherine Wardhana, May 2024
- **PAR Expiration date** - February 2030
