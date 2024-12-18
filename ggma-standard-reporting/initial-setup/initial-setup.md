# Initialize environment

## Introduction
The livelab environment set up includes the following:

* A single database (free edition) with 2 PDBs.
* One Oracle GoldenGate installation setup.
* The Service Manager manages two deployments: North and South.
* All services, including database, database listener, and Oracle GoldenGate instances, which start when you start the LiveLab environment and run the given scripts.
* Scripts to set up complete data replication using cURL commands.
* Scripts to set up complete data replication using OBEY commands.

*Estimated Time*:  10 minutes

### Objectives
* Learn to use scripts to perform basic data replication configuration in Oracle GoldenGate 23ai with Oracle Database 23ai
* Allow users to copy the scripts and use them to test various tasks in their own environments.

### Lab Configuration

This lab environment consists of 1 container database instance and two pluggable database instances. 

The following diagram shows a standard unidirectional replication in Oracle GoldenGate. In the standard Oracle GoldenGate configuration, an Extract sends captured data using the Distribution Service over TCP/IP to a trail on the target system, where it is received by the Receiver Service and stored until processed by the Replicat.

  ![MA Components and Replication Process](./images/data_replication.png " ")

The following table provides a snapshot of the available environment:

| Component | Name  | Description |
 -----------| ------- | -------------
| Server Names      | NORTH | north.livelabs.oraclevcn.com
|                   | SOUTH | south.livelabs.oraclevcn.com
| Database Type     | Oracle Database 23.5 Free Edition | Contains 1 CDB and 2 PDBs
| CDB Name   | FREE | CDB login details: 
|            |      |    Username/Password: sys/oracle4GG
| PDB Name   | DBNORTH | PDB login details: 
|            |      |   Username/Password: sys/oracle4GG
|PDB Name    | DBSOUTH | Login Details:  
|            |       |   Username/Password: sys/oracle4GG
Database Connections| | For DBNORTH Username/Password: ggadmin@dbnorth/ggadmin 
|                   | | For DBSOUTH Username/Password: ggadmin@dbsouth/ggadmin
|Oracle GoldenGate | Service Manager | Port: 9000 
| ||Login Credentials:
| | | Username/Password: ggma/GGma_23ai
|Oracle GoldenGate | Deployment Name: depl_north | Port: 9000 to 9004 <br> </br> Login details: ggma/GGma_23ai 
| | Deployment Name: depl_south | Port: : 9100 to 9104 <br> </br> Login details: ggma/GGma_23ai
|

To set up unidirectional replication, the CDB contains DBNORTH (source) and DBSOUTH (target) pluggable databases.  

### Prerequisites
This lab contains the following tasks:

  - Lab: Understand the Directory Structure

  - Lab: Load the Oracle GoldenGate and Database Environment
  
## Task 1: Load the Oracle GoldenGate and Database Environment 

   1. Load the database environment by running the following command:
    
       ```
       <copy>
       source /usr/local/bin/.set-env-db.sh
       </copy>

       ```
   2. Enter the option 1 to select the FREE database option. This loads the database environment with settings for the required environment variables, Oracle Database, and Oracle GoldenGate directories.
         
   
## Task 2: Understand the Directory Structure

The directory structure lists the location of the important artifacts for Oracle Database and Oracle GoldenGate. 


| Directory Name   |     Location         |
--------------     | ----------------     |
| ORACLE_BASE      |  /opt/oracle         |
| ORACLE_HOME      | /opt/oracle/product/23ai/dbhomeFree                                |
| TNS_ADMIN        | ~/network/admin      |
| OGG_HOME         | /u01/app/oracle/product/23.0.0.0/gghome_1                         |
| Deployments      | /u01/app/oracle/deployments/{ServiceManager, depl_north, depl_south}                               |
| Certificates     | ~/certs              |    


In this lab, you will be able to view the directories mentioned in this table:

1. Run the command to list the directories:

       ```
       <copy>
       ls -l
       
       </copy>

       ```

2.  Move to the <code>scripts</code> directory 

       ```
       <copy>
       cd scripts       
       </copy>

       ```
    You will be able to see the scripts that are going to be used in the labs for data replication and testing purposes. The <code>scripts</code> folder contains the sub-directory <code>01_Reporting</code>.

3. Move to the <code>Reporting</code> directory. It contains the REST-API directory for cURL and the Admin Client directory for OBEY commands.

You may now **proceed to the next lab** to run cURL scripts to set up data replication and test for standard reporting.

## Learn More

* [Oracle GoldenGate Microservices REST APIs](https://docs.oracle.com/en/middleware/goldengate/core/23/oggra/)
* [Command Line Reference Guide](https://docs.oracle.com/en/middleware/goldengate/core/23/gclir/index.html)

## Acknowledgements
* **Author** - Preeti Shukla
* **Contributors** - Preeti Shukla, Volker Kuhr
* **Last Updated By/Date** - Preeti Shukla, Oracle GoldenGate, Principal UAD, November 2024
