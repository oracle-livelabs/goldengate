# Initialize Environment

## Introduction
In this lab we will setup the initialize required databases and GoldenGate Services.

Estimated Time: 30 minutes


### Objectives
In this lab you will:
- Understand how to start and check the status of the Oracle Database, Kafka, Hadoop, Hbase, Cassandra, and MongoDB.

### Prerequisites
This lab assumes you have:
- An Oracle Cloud account

## Task 1: Validate That Required Processes are Up and Running.
1. Now with access to your remote desktop session, proceed as indicated below to validate your environment before you start executing the subsequent labs. The following Processes should be up and running:

    - Database Listener
        - LISTENER
    - Database Server instance
        - CDB1
    - Oracle GoldenGate ServiceManager
    - Apache Kafka cluster
    - Apache Hadoop single-node cluster
    - Cassandra
    - mongoDB

    Open the terminal on the remote desktop and run the following for a clean start.

    ```
    <copy>
    sudo systemctl status oracle-database
    </copy>
    ```
    ![Database status](./images/db-status.png " ")

    If the output show  ***active (running)*** indicates Oracle Database is up and running, press ***Ctrl+c*** to exit from the output.
    ```
    <copy>
    sudo systemctl status OracleGoldenGate hadoop kafka hbase zookeeper
    </copy>
    ```
    ![GoldenGate status](./images/goldengate-command-status.png " ")
    ![GoldenGate status](./images/big-data-process-status.png " ")
    If the output show  ***active (running)*** indicates Oracle GoldenGate Services are up and running, press ***Ctrl+c*** to exit from the output.
    
You may now proceed to the next lab.

## Appendix 1: Managing Startup Services

1. Database Service (Database and Listener).

    - Start

    ```
    <copy>sudo systemctl start oracle-database</copy>
    ```

    - Stop

    ```
    <copy>sudo systemctl stop oracle-database</copy>
    ```

    - Status

    ```
    <copy>sudo systemctl status oracle-database</copy>
    ```

    - Restart

    ```
    <copy>sudo systemctl restart oracle-database</copy>
    ```

2. Oracle GoldenGate ServiceManager

    - Start

    ```
    <copy>sudo systemctl start OracleGoldenGate</copy>
    ```

    - Stop

    ```
    <copy>sudo systemctl stop OracleGoldenGate</copy>
    ```

    - Status

    ```
    <copy>sudo systemctl status OracleGoldenGate</copy>
    ```

    - Restart

    ```
    <copy>sudo systemctl restart OracleGoldenGate</copy>
    ```

    - Restart
    ```
    <copy>sudo systemctl restart hadoop</copy>
    ```
6.HBase Service.
    - Start
    ```
    <copy>sudo systemctl start hbase</copy>
    ```
    - Stop
    ```
    <copy>sudo systemctl stop hbase</copy>
    ```
    - Status
    ```
    <copy>sudo systemctl status hbase</copy>
    ```
    - Restart
    ```
    <copy>sudo systemctl restart hbase</copy>
    ```
## Appendix 2: Command reference list

Aliases have been created for this workshop, so that you can focus on GG functionality. These aliases will make it simple to look at files in HDFS, select data from MongoDB, HBase, Cassandra or consume a Kafka topic.

  ![GG command Reference](./images/gg-cmd.png " ")
  
## Appendix 3: Workshop folder structure reference list

Workshop folder structure reference will give board idea about the Oracle Database home, GoldenGate homes, Hadoop home, HBase home, Cassandra home, MongoDB home, and Kafka home

  ![Folder Structure](./images/folder-structure.png " ")
## Learn More

* [Oracle GoldenGate (MA) for Big Data](https://docs.oracle.com/en/middleware/goldengate/big-data/21.1/gadbd/getting-started-oracle-goldengate-microservices-big-data.htm)

## Acknowledgements
* **Author** - Madhu Kumar S, AppDev and Integration, Bangalore Tech Team
* **Contributors** - Madhu Kumar S
* **Last Updated By/Date** - Madhu Kumar S, AppDev and Integration, Bangalore Tech Team, August 2022
