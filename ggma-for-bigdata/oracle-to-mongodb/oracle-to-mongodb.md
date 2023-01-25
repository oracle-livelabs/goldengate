# Replicate data from Oracle Database to MongoDB

## Introduction

This lab will demonstrate how to  ***Replicate data from Oracle Database to MongoDB*** using **Oracle GoldenGate 21c Microservices** and **Oracle GoldenGate (MA) for Big Data**. All labs will use shell scripts to facilitate the building of the environment, at the same time provide insight into how to use the web pages and AdminClient.

In this lab, we will load data in the Oracle Database schema ***SOE***  of Pluggable Database ***PDB***. GG extract process ***EXTORA*** will capture the changes from Oracle Database and write them to the local trail file ***et***. From the Distribution Service, path ***SRC2TGT*** will route the trail file  ***et*** to target GoldenGate (MA) for Big Data Receiver Service as ***rt***. The replicat process ***REPMONGO*** will read the remote trail files, creates the MongoDB tables, and write the data to MongoDB tables.

Estimated Time:  30 minutes

### Objectives
In this lab you will learn:
-  How to reset the GoldenGate configuration.
-  How to create an extract for the source database and a path to distribute the trail to target deployment.
-  How to configure the GoldenGate for MongoDB as a target.
-  How to validate the GoldenGate configuration for MongoDB as a target.

#### Lab Architecture

![Architecture](./images/architecture.png " ")

### Prerequisites
This lab assumes you have:
- An Oracle Cloud account
- You have completed:
    - Lab: Initialize Environment

## Task 1: GoldenGate configuration reset

1.  Open a terminal and type ***mongodbreset*** to reset the lab.

    ```
    <copy>mongodbreset</copy>
    ```
    ![MongoDB Reset](./images/mongodbreset-1.png " ")
    ![MongoDB Reset](./images/mongodbreset-2.png " ")
## Task 2: GoldenGate configuration  for Oracle Database as source
1.  Open  a terminal and type ***extract*** to create a extract ***EXTORA*** and a path ***SRC2TGT*** through cURL commands.

    ```
    <copy>extract</copy>
    ```
    ![Extract Path Creation](./images/extract.png " ")
    ![Extract Path Creation](./images/extract-path-creation.png " ")

2. To validate the GoldenGate process, sign in to the Administration Service console from the below URL with username as ***oggadmin*** and password as ***Gg.Rocks_99***.

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


3. On welcome pages, a green tick with the name ***EXTORA*** indicates extract is up and running on the  Administration Service console.
        ![GGMA Extract Status](./images/ggma-extract-status.png " ")
4. Navigate to Distribution Service, to validate the path ***SRC2TGT***.
        ![GGMA Path Status](./images/ggma-path-status.png " ")

    ***Source deployment completed!***


## Task 3: GoldenGate configuration  for MongoDB as target

1. To create a replicat, sign in to the Administration service of GoldenGate (MA) of Big Data from the below URL with username as ***oggadmin*** and password as ***Gg.Rocks_99***.

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

2. On the welcome page, Click on the **Add Replicat** (***+*** plus icon) to get the replicat creation wizard.

    Replicat is a process that delivers data to a target database. It reads the trail file on the target database, reconstructs the DML or DDL operations, and applies them to the target database.

    ![Add Replicat](./images/add-replicat.png " ")

3. On Add Replicat page, choose the replicat type as ***Classic Replicat*** and Click on **Next** to proceed to Replicat Options.    

    ![Choose classic replicat](./images/choose-classic-replicat.png " ")


4. On the Replicat Options wizard, enter the replicat process name as ***REPMONGO***.

    ```
    <copy>
    REPMONGO
    </copy>
    ```
![Replicat Name](./images/replicat-name.png " ")
5.  Enter trail Name as ***rt***, which is received from the source ***Oracle Database***.
![Trail Name](./images/trail-name.png " ")
6. Enter ***mongo*** to choose the Target for MongoDB from the top-down menu and click ***Next***.
![Choose target as MongoDB](./images/choose-target-as-mongodb.png " ")
7. In the Parameter File text area, replace ***`MAP *.*, TARGET *.*; `***with the following script: and click ***Next***.

    ```
    <copy>
    MAP PDB.SOE.*, TARGET SOE.*;
    </copy>
    ```
![Add Mapping condition](./images/add-mapping-condition.png " ")
8. Update MongoDB clientURI as ***mongodb://localhost:27017/***.

    ```
    <copy>mongodb://localhost:27017/</copy>
    ```
![MongoDB ClientURI](./images/mongodb-clienturi.png " ")
9. Update the **Classpath** to read the **MongoDB** jars file location and click  ***Create and Run*** button to complete the replication creation wizard.

 ![Add Classpath](./images/add-classpath.png " ")

10. Replicat ***REPMONGO*** has been created successfully.
 ![Replicat up and running](./images/replicat-up-and-running.png " ")

    ***Target deployment completed!***
## Task 4: Validation of the GoldenGate Configuration for MongoDB as Target

1. Open a ***New Window*** on the terminal, and move the terminal side by side as shown below.

    On the left side terminal, enter ***oraselect*** will display the row counts of all the tables of the Oracle(Source) Database.

    ```
    <copy>
    oraselect
    </copy>
    ```
    On the right side terminal, enter ***mongodb_select*** will display the row counts of all the tables of the MongoDB(target) Database.
    ```
    <copy>
    mongodb_select
    </copy>
    ```

    ![Source and Target count](./images/source-and-target-count.png " ")


2. Enter ***loaddml*** on any one of the terminals to load the data to Oracle Database tables

    ```
    <copy>
    loaddml
    </copy>
    ```

    ![Load the data](./images/load-the-data.png " ")
3. To validate the GoldenGate replication, execute the below commands.

    On the left side terminal, enter ***oraselect*** will display the row counts of all the tables of the Oracle(Source) Database.


    ```
    <copy>
    oraselect
    </copy>
    ```


    On the right side terminal, enter ***mongodb_select*** will display the row counts of all the tables of the MongoDB(target) Database.

    ```
    <copy>
    mongodb_select
    </copy>
    ```
![Source and Target count after data load](./images/source-and-target-count-after-data-load.png " ")
4. Replication statistics can be viewed from the GoldenGate Microservice console also. Click on the replicat ***REPMONGO*** and navigate to ***Statistics***.
![Replication Statastics](./images/replication-statastics.png " ")



## Summary
To summarize, you loaded data in the Oracle Database ***SOE*** schema of Pluggable Database ***PDB***. The GG extract process ***EXTORA*** captured the changes from the Oracle Database and wrote them to the local trail file ***et***. From the Distribution Service, path ***SRC2TGT*** will route the trail file  ***et*** to target GoldenGate (MA) for Big Data Receiver Service as ***rt***. The replicat process ***REPMONGO*** will read the remote trail files, creates the MongoDB tables, and write the data to MongoDB tables.

You may now proceed to the next lab.

## Learn More

* [Oracle GoldenGate for Big Data 21c ](https://docs.Oracle.com/en/middleware/goldengate/big-data/21.1/index.html)
* [Using the MongoDB Handler ](https://docs.Oracle.com/en/middleware/goldengate/big-data/21.1/gadbd/using-mongodb-handler.htm)

## Acknowledgements
* **Author** - Madhu Kumar S, AppDev and Integration, Bangalore Tech Team
* **Contributors** - Madhu Kumar S, Brian Elliott, Deniz Sendil, Meghana Banka, Rene Fontcha
* **Last Updated By/Date** - Madhu Kumar S, AppDev and Integration, Bangalore Tech Team, August 2022
