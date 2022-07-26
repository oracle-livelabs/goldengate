#  Oracle to Cassandra

## Introduction

This lab will demonstrate how to  ***Replicate from  Oracle to Cassandra*** using **Oracle GoldenGate 21c Microservices** and **Oracle GoldenGate (MA) for Big Data**.All labs will use shell scripts to facilitate the building of the environment, at the same time provide insight into how to use the web pages and AdminClient.

In this lab, we will load data in the Oracle database ***`‘SOE’`*** schema of Pluggable database ***`‘PDB’`*** .The GG extract process ***`‘EXTORA’`*** captured the changes from the Oracle database and wrote them to the local trail file ***`‘et’`***. The Distrubution Service ***`‘SRC2TGT’`*** will route the trail file  ***`‘et’`*** to target GoldenGate(MA) for Big Data reciever Service as ***`‘rt’`*** . The replicat process ***`‘REPCASS’`*** read the remote trail files, created the Cassandra tables and wrote the data to those tables.

*Estimated Time*:  30 minutes

#### Lab Architecture

 ![Architecture](./images/architecture.png " ")

### Objectives
In this lab you will:
-  How to reset the GoldenGate configuration.
-  How to create extract for source database and a path to distribute the trail to target deployment.
-  How to configure the GoldenGate for Cassandra as target.
-  How to validate of the GoldenGate configuration for Cassandra as target.

### Prerequisites
This lab assumes you have:
- A Free Tier, Paid or LiveLabs Oracle Cloud account
- You have completed:
    - Lab: Initialize Environment

## Task 1: GoldenGate Configuration Reset

1.	Open  a terminal and type ***cassandrareset*** to reset the lab.

    ```
    <copy>cassandrareset</copy>
    ```
    ![Cassandra Reset](./images/cassandrareset-1.png " ")
    ![Cassandra Reset](./images/cassandrareset-2.png " ")

## Task 2: GoldenGate Configuration  for Oracle as Source
1.	Open  a terminal and type ***extract*** to create a extract ***EXTORA*** and a path ***SRC2TGT*** through cURL commands.
    ![Extract Path Creation](./images/extract.png " ")
    ![Extract Path Creation](./images/extract-path-creation.png " ")

2. To validate the GoldenGate process, login to Administration Service console from the below url with username as ***oggadmin*** and password as ***Gg.Rocks_99***.

    Click here : [http://localhost:21001/?root=account](http://localhost:21001/?root=account)


    ***username***

    ```
    <copy>oggadmin</copy>
    ```
    ***password***

    ```
    <copy>Gg.Rocks_99</copy>
    ```
![GGMA Login Page](./images/ggma-login-page.png " ")


3. On welcome pages, a green tick with name ***EXTORA*** indicates extract is up and running on the  Administration Service console.
        ![GGMA Extract Status](./images/ggma-extract-status.png " ")
4. Navigate to Distribution Service, to validate the path ***SRC2TGT***.
        ![GGMA Path Status](./images/ggma-path-status.png " ")

    ***Source deployment completed!***

## Task 3: GoldenGate Configuration  for Cassandra as Target
1. To create a replicat, logon to Administration Service of GoldenGate(MA) of Big Data from the below url with username as '***oggadmin***' and password as '***Gg.Rocks_99***'.

    Click here : [http://localhost:22001/?root=account](http://localhost:22001/?root=account)


    ***username***

    ```
    <copy>oggadmin</copy>
    ```
    ***password***

    ```
    <copy>Gg.Rocks_99</copy>
    ```

    ![GGBD Login Page](./images/ggbd-login-page.png " ")

2. On welcome page, Click on the **Add Replicat** ('***+***' plus icon) to get the replicat creation wizard.

    Replicat is a process that delivers data to a target database. It reads the trail file on the target database, reconstructs the DML or DDL operations, and applies them to the target database.

    ![Add Replicat](./images/add-replicat.png " ")

3. On Add Replicat page, choose replicat type as ***Classic Replicat*** and Click on **Next** to procede to Replicat Options.    

    ![Choose classic replicat](./images/choose-classic-replicat.png " ")
4. On Replicat Options wizard, enter replicat process name as '***REPCASS***'.

    ```
    <copy>REPCASS</copy>
    ```
![Replicat Name](./images/replicat-name.png " ")
5.  Enter trail Name as '***rt***' , which is received from the source ***Oracle database***.
![Trail Name](./images/trail-name.png " ")
6.  Choose target as ***Cassandra*** from the top-down menu click **Next**.
![Choose target as Cassandra](./images/choose-target-as-cassandra.png " ")
7. In the Parameter File text area, replace ***`MAP *.*, TARGET *.*; `*** with the following script:

    ```
    <copy>
    MAP PDB.SOE.*, TARGET SOE.*;
    </copy>
    ```
![Add Mapping condition](./images/add-mapping-condition.png " ")
8. On Properties tab, enter **"gg.handler.cassandra.contactPoints="** as ***localhost***.
![Cassandra Contact points](./images/cassandra-contactpoints.png " ")
9. Set the classpath to the ***Datastax Cassandra Java Driver*** on Cassandra properties file and click tab ***Create and Run*** to complete the replication creation wizard.
    ```
    <copy>/u01/cassandra_4.0.0/*:/usr/share/cassandra/lib/*</copy>
    ```
![Add Classpath](./images/add-classpath.png " ")

10. Replicat ***REPCASS*** has been created successfully.
![Replicat up and running](./images/replicat-up-and-running.png " ")
    ***Target deployment completed!***

## Task 4: Validation of the GoldenGate Configuration for Cassandra as Target

1. Open a ***New Window*** on the terminal, and move the terminals side by side as shown below.


    On the left side terminal, enter ***oraselect*** will display the row counts of all the tables of the Oracle(Source) Database.
    ```
    <copy>oraselect</copy>
    ```
    On right side terminal, enter ***cassandraselect*** will  display the rows of all the table rows of Cassandra(target) database.

    ```
    <copy>cassandraselect</copy>
    ```
![Source and Target count](./images/source-and-target-count.png " ")
2. Enter ***loaddml*** on any one of the terminal, to load the data to Oracle database tables.

    ```
    <copy>
    loaddml
    </copy>
    ```
    ![Load data to Oracle database](./images/load-data-to-oracle.png " ")
![](./images/lab4_18.png " ")
3. To validate the GoldenGate replication, execute the below commands.

    On the left side terminal, enter ***oraselect*** will display the row counts of all the tables of the Oracle(Source) Database.

    ```
    <copy>oraselect</copy>
    ```
    On right side terminal, enter ***cassandraselect*** will  display the rows of all the tables rows of Cassandra(target) database.

    ```
    <copy>cassandraselect</copy>
    ```
![Source and Target count after data load](./images/source-and-target-count-after-data-load.png " ")
4. Replication statistics can be viewed from GoldenGate Microservice console also. Click on the replicat name ***REPCASS*** and navigate to ***statistics***.
![Replication Statastics](./images/replication-statastics.png " ")


## Summary
In summary, you loaded data in the Oracle database ***`‘SOE’`*** schema of Pluggable database ***`‘PDB’`*** .The GG extract process ***`‘EXTORA’`*** captured the changes from the Oracle database and wrote them to the local trail file ***`‘et’`***. The Distrubution Service ***`‘SRC2TGT’`*** will route the trail file  ***`‘et’`*** to target GoldenGate(MA) for Big Data Receiver Service as ***`‘rt’`*** . The replicat process ***`‘REPCASS’`*** read the remote trail files, created the Cassandra tables and wrote the data to those tables.

You may now proceed to the next lab..

## Learn More

* [Oracle GoldenGate for Big Data 21c ](https://docs.Oracle.com/en/middleware/goldengate/big-data/21.1/index.html)
* [Using the Cassandra Handler ](https://docs.Oracle.com/en/middleware/goldengate/big-data/21.1/gadbd/using-cassandra-handler.html)
## Acknowledgements
* **Author** - Madhu Kumar S, AppDev and Integration, Bangalore Tech Team
* **Contributors** - Madhu Kumar S, Brian Elliott,Deniz Sendil,Meghana Banka
* **Last Updated By/Date** - Madhu Kumar S, AppDev and Integration, Bangalore Tech Team, June 2022
