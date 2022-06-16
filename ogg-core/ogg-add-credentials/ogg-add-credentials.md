# Add database credentials

## About Workshop
This lab describes how to add the database credentials to connect to the source and target databases from the Administration Service.

*Estimated Time*: 30 minutes

### Objectives
In this lab, you will:
* Connect to the Administration Service from the Admin Client.
* Create Database credentials for Oracle Multitenant Container Databases.

### Prerequisites
This lab assumes that you have:
- the appropriate database privileges to be able to execute the commands in the Admin Client.

## Task 1: Connect to the Administration Service from the Admin Client

1. Run the script: `adminclient` to open the Admin Client.

    **Note**: You don’t need to navigate to the *OGG_HOME/bin*  directory to run the Admin Client each time. The PATH environment variable is set for this. This is a client-server connection.

2. Execute the following command to connect to the Administration Service:

    ```
    <copy>
    CONNECT http://phoenix98251.dev3sub1phx.databasede3phx.oraclevcn.com:9010 DEPLOYMENT NORTH as oggadmin PASSWORD oggadmin
    <copy>
    ```
## Task 2: Add Database Credentials

You need to establish 2 database connections (`pdbeast` and `pdbwest`) through the Admin Client in preparation to issue other Oracle GoldenGate commands that affect the database.

To create database credentials in the Administration Client:

1. Run the following command to add a user `ggeast`:

    ```
    <copy>
    ALTER CREDENTIALSTORE ADD USER ggadmin@orclpdbeast ALIAS ggeast  DOMAIN OracleGoldenGate PASSWORD Welcome1
    <copy>

    ```
2.  To test the database connection, run the following command:

    ```
    <copy>
    DBLOGIN USERIDALIAS ggeast
    <copy>

    ```
3. Run the following command to add a user `ggwest`:

    ```
    <copy>
    ALTER CREDENTIALSTORE ADD USER ggadmin@orclpdbwest ALIAS ggwest  DOMAIN OracleGoldenGate PASSWORD Welcome1
    <copy>

    ```
4.  To test the database connection, run the following command:

    ```
    <copy>
    DBLOGIN USERIDALIAS ggwest
    <copy>

    ```
    You have now successfully created database credentials for the source (`ggeast`) and target (`ggwest`) databases.

  After connecting to the databases, you can enable TRANDATA, add Heartbeat and Checkpoint tables.

  You may now **proceed to the next lab**.

## Learn More
* [Using the Admin Client](https://docs.oracle.com/en/middleware/goldengate/core/21.1/admin/getting-started-oracle-goldengate-process-interfaces.html#GUID-84B33389-0594-4449-BF1A-A496FB1EDB29)
* [Command Line Interface Reference for Oracle GoldenGate](https://docs.oracle.com/en/middleware/goldengate/core/21.3/gclir/command-line-interfaces.html#GUID-C0F6B123-14C0-466F-AE43-CAFB99B08C3D)
* [ALTER CREDENTIALSTORE](https://docs.oracle.com/en/middleware/goldengate/core/21.3/gclir/alter-credentialstore.html#GUID-50893039-3C29-4C66-87E4-F63EAB05C811)
* [DBLOGIN USERIDALIAS](https://docs.oracle.com/en/middleware/goldengate/core/21.3/gclir/dblogin-useridalias.html#GUID-897F212D-7F83-4610-BCE8-E1D61744D9AA)

## Acknowledgements
* **Author** - Anuradha Chepuri, Principal UA Developer, Oracle GoldenGate User Assistance
* **Contributors** -  Preeti Shukla, Volker Kuhr
* **Last Updated By/Date** - Anuradha Chepuri, July 2022
