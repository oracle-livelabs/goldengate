# Set up the environment

## Introduction

In this lab, you learn to create the required resources you'll use for Oracle Cloud Infrastructure (OCI) GoldenGate. We'll show you how to create a VCN and subnet, provision autonomous database instances, and load data into the databases.

Estimated time: 20 minutes

### Objectives

-  Provision a VCN and subnet
-  Provision, connect, and load data into an Autonomous Transaction Processing (ATP) instance
-  Provision, connect, and load data into an Autonomous Data Warehouse (ADW) instance

### Prerequisites

This lab assumes you have completed the following labs:
* Sign Up for Free Tier/Login to Oracle Cloud

> **Notes:** 

> * You may see differences in account details (eg: Compartment Name is different in different places) as you work through the labs. This is because the workshop was developed using different accounts over time.
> * This workshop was designed to use Oracle Autonomous Databases as the source and target. If you plan to use Oracle Database, ensure that you use the CDB user to capture data from the PDBs.

## Task 1: Create a VCN and subnet

[](include:01-create-vcn-subnet.md)

## Task 2: Create an ATP instance

[](include:02-create-atp-instance.md)

## Task 3: Load the ATP schema and enable supplemenal logging

[](include:03-load-atp-schema.md)

## Task 4: Create an ADW instance and user 

[](include:04-create-adw-instance.md)

12. On the TargetADW Database Details page, click **Database actions**, and then select **SQL** from the dropdown. If the Database actions menu takes too long to load, you can click **View all database actions**, and then select **SQL** from the Database actions page. 

13. If prompted, log in using the ADMIN username and password set in step 7.

14. Copy and paste the script from **OCIGGLL\_OCIGGS\_SETUP\_USERS\_ADW.sql** into the SQL worksheet, and then click **Run Script**.

	![Pasted script in SQL worksheet](https://oracle-livelabs.github.io/goldengate/ggs-common/adb/images/04-05-adw.png " ")

15. Log out of Database actions.

## Task 5: Create the deployment

[](include:05-create-deployment.md)

## Acknowledgements

- **Author** - Jenny Chan, Consulting User Assistance Developer
- **Contributors** - Katherine Wardhana, User Assistance Developer
- **Last Updated by** - Katherine Wardhana, June 2025
- **PAR Expiration date** - February 2030
