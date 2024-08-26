# Setup of the GoldenGate Replication

## Introduction

In this lab you will set up the actual configuration to define the replication from an Oracle database into a remote Kafka topic.

In the previous lab you got acquainted with the various components that constitute the lab environment: the Oracle database, the Apache Kafka setup and the GoldenGate console.  We'll now use the various services of the GoldenGate environment to configure the different steps in the replication process.

![Lab Architecture diagram, showing source, GG setup and Target kafka](./../discover/images/gg21c-lab-archi.png " ")

*Estimated Lab Time*: 20 mins


### Objectives

In this lab environment all components are on a single Linux Compute environment.  In reality, these components can be distributed across various machines and locations, even if they are very remote from one another.

We'll be performing the following tasks:

- Configure the **Database credentials** to connect to the source Oracle Database, and creation of a CheckPoint Table
- Set up the **Extract** process on the Oracle database, selecting all the tables from the SOURCE_APP schema to be replicated
- Set up the **Distribution** service to forward the transactions to a remote system
- Verify the **Receive** service is automatically set up on the remote (bigdata) system
- Set up the **Replicat** service to inject the transactions into the Kafka topic corresponding to the source database table

### Prerequisites

This lab assumes you have:

- A Free Tier, Paid or LiveLabs Oracle Cloud account
- You have completed:

    - Lab: Prepare Setup (*Free-tier* and *Paid Tenants* only)
    - Lab: Environment Setup
    - Lab: Discover the environment

## Task 1: Configuring the Database Credentials

1. Open the GoldenGate Service Manager on port 10000

    In the previous step you already logged in to this console.

2. Select the *Deployment type* = **oracledb**

    ![select oracle deployment](./images/deploy-ora.png " ")

    You now only see the four services associated with the Oracle DB Deployment

3. Select the OracleDB Administration service, running on port 10100

    ![oracledb deployment filter](./images/show-oradeploy.png " ")

    You have to log in again, using the same credentials as before :
    - user = oggadmin
    - password = oggadmin

4. Now select the hamburger icon in the top left to visualize the menu

    ![expand menu on left](./images/ora-admin.png " ")

    This displays the menu of the console

5. Select the item **Configuration**

    ![Configuration selection](./images/ora-admin-menu.png " ")

6. Create a new Credential by clicking the **+** icon

    ![Credentials screen](./images/ora-config.png " ")

    Now you can enter the credentials for the connection from GoldenGate to the database we already have up and running in the environment
    - Leave the *Credentials Domain* blank
    - *Credentials Alias*: **OGG_CAPTURE**
    - *User ID*: **C##GGADMIN@ORCLCDB**
    - *Password*: **Welcome#123**
    - *Verify Password*: **Welcome#123**
    - Click the **Submit** button

    ![Add credentials screen](./images/ora-create-cred.png " ")

    - You can see a new credential has appeared as we defined it.

7. Test the connection by clicking the small database icon besides the new credential:

    ![result of entering credentials](./images/ora-cred-result1.png " ")

    You can see the login takes place, and the section *TRANDATA* appears on the screen.

    **Troubelshooting**: In case you get an error when testing the connection to the database, double-check your listener configuration is set up correctly, as already explained in the *Discover the Environment section*:

    - In the terminal window, connect to the database as system: ```sqlplus system/Welcome#123 as sysdba```
    - Configure the listener: ```alter system set LOCAL_LISTENER='' scope=both;```
    - If you had an error stating that the password has expired ("ORA-28002 The Password Will Expire ..." or "ORA-28001 The Password has expired"), run the following command:

        ```sql
        <copy>
        sqlplus alter user C##GGADMIN identified by Welcome#123;
        </copy>
        ```

    - exit sqlplus with ```end```
    - restart the listener with ```lsnrctl stop``` followed by ```lsnrctl start```
    - Retry to connect to the database by re-clocking the icon.

8. We now need to add a TRANDATA table to the database to acquire the transaction records in the database.
    - Click on the **+** symbol besides the *TRANDATA Information* title

        ![Test connection](./images/ora-cred-result2.png " ")

    - Enter the below parameters:

        -  *Schema Name*: **ORCLPDB1.SOURCE_APP**
        - Select **All Columns**
        - All other parameters remain the default ones
    - Click the **Submit** button

        ![Add trandata](./images/add-trandata.png " ")

9. We can now check the tables in the schema specified:

    - In the search box of the *TRANDATA* section, type: **ORCLPDB1.SOURCE_APP**
    - click the search icon besides the box

        ![check trandata](./images/check-tran.png " ")

    - You can see there is one table enabled for replication in this schema.

         ![result of trandata check](./images/check-tran2.png " ")

This concludes the configuration of the Credentials.


## Task 2 : Configure the Extract process from the source Oracle Database

1. Navigate to the Home screen to start creating an extract

    - If necessary open the left-menu by clicking on the hamburger icon in the top left corner
    - Select **Overview** to return to the home screen of the service

    ![Add extract to oracledb deployment](./images/ora-extract.png " ")

2. Create a new **Extract**

    - Click the **+** icon of the **Extracts** box as highlighted in the picture above
    - Select the *Extract Type* **Integrated Extract**
    - Click **Next** to continue

    ![extract type choice](./images/extr-type.png " ")

3. Enter the following parameters:

    - *Process Name*: **E_ORACLE**
    - *trail name*: **ex**
    - *Credentials Domain*: **OracleGoldenGate**
    - *Credentials Alias*: **OGG_CAPTURE**

    ![extract options entry part 1](./images/extr-opt.png " ")

4. Scroll down to see more parameters:

    - *Register to PDBs*: **ORCLPDB1**
    - Click the **Next** button to continue

    ![extract options entry part 2](./images/extr-opt2.png " ")

5. This leads you to the **Parameter File** screen.

    - Complete the config by adding the below line to the config:

        ```
        <copy>TABLE ORCLPDB1.SOURCE_APP.*;</copy>
        ```

    - Click the **Create and Run** button

        ![extract parameters](./images/extr-param.png " ")

6. You will be returned to the Overview screen, with a box showing the creation of the extract in progress:

    ![extract creating](./images/extr-creating.png " ")

7. If all goes well, after a few seconds the icon will turn green, indicating the creation of the extract succeeded.

    ![extract created](./images/extr-ok.png " ")

8. You can click on the name of the extract **E_Oracle** to see more details, for example the statistics.  As nothing is happening on the Oracle database yet, we see no records yet.

    ![extract stats - empty](./images/extr-stats.png " ")

This concludes the configuration of the Extract.

## Task 3: Set up the Distribution service

In this step we'll set up the **Distribution** service that will send the transactions to the remote system.  In this case of course the receiving service will also run on the test environment, but in a real-world implementation this process could run very far away.

Before we start the actual configuration we'll check the port on which the Big Data **Receiver** service is running, as this will be our target.

1. Navigate back to the overall **GoldenGate Service Manager** running on port 10000

2. Select the **bigdata** Deployment type

    ![select bigdata](./images/sel-bigd.png " ")

3. Note the port of the **Receiver** service : **10202**.  This will be our destination for the Distribution setup.

    ![bigdata services](./images/show-bigd.png " ")

    Now we'll navigate back to the **oracledb** deployment

4. Set the deployment filter back to **oracledb**

5. Select the **Distribution Service** on port **10101**

    ![oracledb services](./images/show-ora.png " ")

6. Click on the **+** sign to configure a new Distribution process

    ![Add Distribution](./images/ora-distri.png " ")

7. Enter the following parameters:

    - *Path Name*: **ORA2KAFKA**
    - *Source*: **E_ORACLE**
    - *Trail Name*: **ex**
    - *Target protocol*: **ogg**
    - *Target Type*: **Receive Service**
    - *Target*: **localhost**
    - *Port Number*: **10202**
    - *Trail Name*: **rt**

    Leave the other parameters as the default values provided

8. Scroll down and click on the button **Create and Run**

    ![Configure distributed](./images/distri-conf.png " ")

9. You'll be returned to the home screen of the service, with the new Distribution being created.  After a few seconds the icon should show as steady green :

    ![distribution result](./images/distr-result.png " ")

Congratulations, you configured the **Distribution** service to send out the transactions remotely

## Task 4 : Check the Receive service on the BigData Deployment

Because you already configured the Distribution service specifying another GoldenGate environment Receiver service as a target, the receiving end will be configured by default.

We'll simply check if this configuration is visible on the receiving end of the bigdata deployment.

1. Navigate back to the overall **GoldenGate Service Manager** running on port 10000

2. Select the **bigdata** deployment

3. Click on the **Receiver Service** with port 10202

    ![bigdata deployment services](./images/bigdata-receiv.png " ")

4. You can see that the same configuration we already configured in the Distribution service of the **oracledb** deployment is also visible here in the **bigdata** deployment Receive service:

    ![Receiver service config](./images/rec-stat.png " ")

No further actions are required on the receiving end.

## Task 5 : Configure the Replicat service to Kafka

As we are receiving transactions in the **bigdata** deployment, we can use a **Replicat** service to insert them into another destination, in this case we'll be using a Kafka system as a target.

1. Navigate to the Home screen of the service

2. Click on the **Administrative Service** tab on the top of the screen

3. Click on the **+** sign of the **Replicat** section

    ![bigdata admin tab](./images/bigd-repl.png " ")

4. Select the *Replicat Type* = **Classic Replicat**

5. Click **Next** to continue

    ![replicat type](./images/repl-type.png " ")

6. We'll now configure the Replicat Options with following parameter values:

    - *Process Name*: **R_KAFKA**
    - *Trail Name*: **rt**
    - *Target*: **Kafka**
    - Click **Next** to continue

    ![replicat options](./images/rep-opt.png " ")

7. Configure the Replicat Parameters: replace the 2nd line of the parameter file with the below value

    ```
    <copy>MAP ORCLPDB1.SOURCE_APP.*, TARGET TARGET_APP.*;</copy>
    ```

8. Click **Next** to continue

    ![replicat parameters](./images/rep-param.png " ")

9. Configure the Properties file

    In the default properties file you can see 3 locations that need to be filled in as a minimum (marked as **TODO** in the text): the Kafka properties file, the Name resolving template, and the Kafka classpath.

    ![replicat properties](./images/rep-prop-ori.png " ")

10. Select the small "Files" icon besides the title **Properties File** to select a config file that was already prepared for you
11. Select the **R_KAFKA.properties** file
12. Click the **Copy** button

    ![select file](./images/rep-prop-sel.png " ")

    You now should see a filled-in file (with the comments removed) :

    ![result of properties edit](./images/rep-prop-ok.png " ")

13. Click the **Create and Run** button to finalize the creation of the Replicat

14. Validate the creation finishes without errors

- First you'll see the yellow exclamation mark icon.

    ![waiting icon](./images/rep-cre1.png " ")

- After a few seconds you'll see a green icon appear:

    ![creation finished icon](./images/rep-cre2.png " ")

You finalized the setup of the replication !

## Summary

The objectives of the lab was to familiarize you with the process to create data replication objects that will allow you to replicate data real-time using GoldenGate Microservices.

Oracle GoldenGate offers high-performance, fault-tolerant, easy-to-use, and flexible real- time data streaming platform. It easily extends customers’ real-time data integration architectures without impacting the performance of the source systems and enables timely business insight for better decision making.

You may now **proceed to the next lab**.

## Learn More

- [GoldenGate Microservices](https://docs.oracle.com/en/middleware/goldengate/core/19.1/understanding/getting-started-oracle-goldengate.html#GUID-F317FD3B-5078-47BA-A4EC-8A138C36BD59)


## Acknowledgements

- **Author** - Jan Leemans, December 2023
- **Contributors** - Carmelo Millan
- **Last Updated By/Date**
