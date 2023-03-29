# Introduction

## About this Workshop                             
The labs in this workshop walk you through the process of setting up a unidirectional data replication configuration in Oracle GoldenGate for Oracle database multitenant databases. 

You’ll learn to perform the following tasks using this lab:

•	Add supplemental logging at the source database
•	Add checkpoint table to the target database
•	Add heartbeat table to source and target databases
•	Create Extract and Replicat processes
•	Test data replication between databases

Estimated Workshop Time: 2 hour


### About Oracle GoldenGate Admin Client
Oracle GoldenGate is a change data capture software that provides real-time data integration and replication.

The Admin Client is a command line utility available with Microservices Architecture. You can use it to issue the complete range of commands that configure, control, and monitor Oracle GoldenGate.

This diagram illustrates the main components of the Microservices Architecture and how replication processes operate within a REST API environment.

  ![MA Components and Replication Process](./images/replicationprocess-ma.png " ")

Watch this short video about the Oracle GoldenGate product family:
    [Oracle GoldenGate product family](youtube:kdMUxSf9j0k)

### Objectives

In this workshop, you will:
  * Add supplemental logging at source database
  * Add database credentials
  * Add Heartbeat table
  * Add Checkpoint table
  * Add an Extract process
  * Add a Replicat process

### Prerequisites
The following are required to complete this lab:
    * Prior knowledge of using Linux command-line options 
    * Prior knowledge of basic database commands


Watch this short video on adding Database Credentials, Extract, and Replicat Processes in Oracle GoldenGate Microservices on MySQL database:

  [Add credentials, extract, and replicat in GoldenGate](youtube:h0J070YIK4E)

You may now **proceed to the next lab**.

## Learn More

Use these links to get more information about Oracle GoldenGate:

* [Oracle GoldenGate Microservices Documentation](https://docs.oracle.com/en/middleware/goldengate/core/21.3/coredoc/index.html)

* [Command Line Interface Reference for Oracle GoldenGate](https://docs.oracle.com/en/middleware/goldengate/core/21.3/gclir/add-credentials.html#GUID-6D80E0AC-9497-46C6-92D9-2F817D04BD99)

## Acknowledgements
* **Author** - Preeti Shukla, Principal UA Developer, Oracle GoldenGate User Assistance
* **Contributors** -  Volker Kuhr
* **Last Updated By/Date** - Preeti Shukla, April 2023
