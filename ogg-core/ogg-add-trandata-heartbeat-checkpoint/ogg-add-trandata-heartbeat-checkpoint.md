# Configure Database Credentials, Trandata, Heartbeat, and Checkpoint Tables

## Introduction

To configure credentials, trandata, and various processes for an Oracle GoldenGate deployment, you need to connect to the Administration Service for the deployment using the CONNECT command. 

The Administration Service is used to configure database login credentials, trandata, checkpoint table and heartbeat table. You will also use the Administration Service to create Extract and Replicat processes later. 

The credentialstore in Oracle GoldenGate contains the database credentials used to connect to source and target databases. To configure database connections from Oracle GoldenGate, the credentialstore needs to be altered using the ALTER CREDENTIALSTORE command, to add database user credentials. After setting up the credentials in the credentialstore, you will be able to use the DBLOGIN command to connect to the source and target databases from the Admin Client. 

With the ADD TRANDATA command, Oracle GoldenGate acquires the transaction information that it needs from the transaction records. For a seamless data replication in Oracle GoldenGate, you need to first enable TRANDATA for the database tables.

The use of checkpoint table causes checkpoints to be part of the Replicat transaction. Use the `ADD CHECKPOINTTABLE` command to create a checkpoint table in the target database. Replicat uses the table to maintain a record of its read position in the trail for recovery purposes.

The Heartbeat functionality helps in monitoring replication lags. Add a heartbeat table to each of your databases by using the `ADD HEARTBEATTABLE` command.

In this lab, you will need the following details to run the CONNECT command to access to the Administration Service for the deployment:

<ul>
  <li>Deployment name: depl_01</li>
  <li>Administration Service URL: http://localhost:9012</li>
  <li>Oracle GoldenGate Administrator User Credentials: 
      <ul>
         <li>User name: ggma</li>
         <li>Password: ggma</li>
      </ul>
</ul>

Estimated Time: 30 minutes

### Objectives
In this lab, you will:
* Connect to the Administration Service for the deployment `depl_01` using Admin Client
* Add and test the database connections from Oracle GoldenGate
* Enable Trandata on source database
* Add Heartbeat table for the source and target databases
* Add Checkpoint table for the target database

### Prerequisites
This lab assumes that you have:
* Set the environment variables for the container database
* Test the connection to the database from sqlplus prompt

## Task 1: Connect to the  Administration Service for the Deployment
1. Run: `adminclient` to open the Admin Client.

2. Execute the following command to connect to the Administration Service for the deployment depl_01:

    ```
    <copy>
    CONNECT http://localhost:9012 DEPLOYMENT depl_01 as ggma PASSWORD ggma
    </copy>
    ```


## Task 2: Add Database Credentials

In this lab, you will establish database connections from Oracle GoldenGate to the Oracle database instances on the source (CDB1) and target (CDB2) databases. 

On CDB1, establish database credentials for users: <b>c##ggadmin</b> and <b>ggadmin</b>

On CDB2, you only need to set up database credentials for the <b>ggadmin</b> user because this is the target pluggable database where the updates will be applied.

To create database credentials using the Admin Client:

1. Run the following command to add a user `ggeast`:

    ```
    <copy>
    ALTER CREDENTIALSTORE ADD USER c##ggadmin@cdb1 ALIAS cggwest DOMAIN OracleGoldenGate PASSWORD ggadmin
    </copy>
    ```
    The USERIDALIAS for connecting to CDB1 is <b>cggwest</b>.

2.  To test the database connection, run the following command:
    ```
    <copy>
    DBLOGIN USERIDALIAS ggeast
    </copy>
    ```

3. Run the following command to add a user `ggwest`:

    ```
    <copy>
    ALTER CREDENTIALSTORE ADD USER ggadmin@orclpdbwest ALIAS ggwest  DOMAIN OracleGoldenGate PASSWORD Welcome1
    </copy>
    ```
4.  To test the database connection, run the following command:

    ```
    <copy>
    DBLOGIN USERIDALIAS ggwest
    </copy>
    ```
    You have now successfully created database credentials for the source (`ggeast`) and target (`ggwest`) databases.


## Task 1: Enable TRANDATA

To enable TRANDATA:

1. Execute the following command:
    ```
    <copy>
    ADD TRANDATA pdbeast.hr.employees
    </copy>
    ```

2. Run the following command to verify the output:

    ```
    <copy>
    INFO TRANDATA pdbeast.hr.employees
    </copy>
    ```

The Trandata output for **hr.employees** is as follows:
  ```
Logging of supplemental transaction log data is disabled for table PDBEAST.HR.COUNTRIES.
Logging of supplemental transaction log data is disabled for table PDBEAST.HR.DEPARTMENTS.
Logging of supplemental transaction log data is enabled for table PDBEAST.HR.EMPLOYEES.

All columns supplementally logged for table `PDBEAST.HR.EMPLOYEES`.
  ```

## Task 2: Add Heartbeat Tables
Add the heartbeat tables for both source and target endpoints by connecting to **ggeast** and **ggwest** database credential aliases.

To add the Heartbeat tables:

1. Execute the following command:
    ```
    <copy>
    ADD HEARTBEATTABLE
    </copy>
    ```

2. Repeat step 1 on the target database.

3. Run the following command to verify the output:

    ```
    <copy>
    INFO HEARTBEATTABLE
    </copy>
    ```

The HEARTBEAT table gets added and the output is as follows:
  ```
2022-04-19T12:59:16Z  INFO    OGG-14101  Successfully added heartbeat table.
  ```

## Task 3: Add Checkpoint table

To add the Checkpoint table:

1. Execute the following command:
    ```
    <copy>
    ADD CHECKPOINTTABLE ggadmin.ggs_checkpointtable
    </copy>
    ```

2. Run the following command to verify the output:

    ```
    <copy>
    INFO CHECKPOINTTABLE ggadmin.ggs_checkpointtable
    </copy>
    ```

The Checkpoint table gets added as follows:
  ```
22022-04-19T06:24:55Z  INFO    OGG-15189  Default catalog name PDBEAST will be used for table specification ggadmin.*.
2022-04-19T06:24:55Z  INFO    OGG-08100  Checkpoint table PDBEAST.GGADMIN.GGS_CHKPT has been created on 2022-04-19 06:22:56.
2022-04-19T06:24:55Z  INFO    OGG-08100  Checkpoint table PDBEAST.GGADMIN.GGS_CHECKPOINTTABLE has been created on 2022-04-19 06:15:55.
  ```

You may now **proceed to the next lab**.


## Learn More
* [Using the Admin Client](https://docs.oracle.com/en/middleware/goldengate/core/21.1/admin/getting-started-oracle-goldengate-process-interfaces.html#GUID-84B33389-0594-4449-BF1A-A496FB1EDB29)
* [ADD TRANDATA](https://docs.oracle.com/en/middleware/goldengate/core/21.3/gclir/add-trandata.html#GUID-D3FD004B-81E4-4185-92D3-812834A5DEFC)
* [ADD HEARTBEATTABLE](https://docs.oracle.com/en/middleware/goldengate/core/21.3/gclir/add-heartbeattable.html#GUID-126E30A2-DC7A-4C93-93EC-0EB8BA7C13CB)
* [ADD CHECKPOINTTABLE](https://docs.oracle.com/en/middleware/goldengate/core/21.3/gclir/add-checkpointtable.html#GUID-870D65C1-A18E-4B2D-8257-F58E9A808197)
* [Command Line Interface Reference for Oracle GoldenGate](https://docs.oracle.com/en/middleware/goldengate/core/21.3/gclir/add-checkpointtable.html#GUID-870D65C1-A18E-4B2D-8257-F58E9A808197)

## Acknowledgements
* **Author** - Anuradha Chepuri, Principal UA Developer, Oracle GoldenGate User Assistance
* **Contributors** -  Preeti Shukla, Volker Kuhr, Madhusudhan Rao
* **Last Updated By/Date** - Anuradha Chepuri, June 2022
