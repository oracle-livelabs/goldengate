# Initialize environment

## Introduction
The livelab environment set up includes the following:

* A single database (free edition) with 3 PDBs.
* One Oracle GoldenGate installation setup.
* The Service Manager manages  deployments: North and South.
* All services, including database, database listener, and Oracle GoldenGate instances, which start when you start the LiveLab environment and run the given scripts.
* Scripts to set up complete data replication using cURL commands.
* Scripts to set up complete data replication using OBEY commands.

*Estimated Time*:  10 minutes

### Objectives
* Learn to use scripts to perform basic data replication configuration in Oracle GoldenGate 23ai with Oracle Database 23ai
* Allow users to copy the scripts and use them to test various tasks in their own environments.

### Lab Configuration

This lab environment consists of 1 container database instance and three pluggable database instances. 

The following table provides a snapshot of the available environment:

| Component | Name  | Description |
 -----------| ------- | -------------
| Server Names      | NORTH | north.livelabs.oraclevcn.com
|                   | SOUTH | south.livelabs.oraclevcn.com
|                   | WEST  | west.livelabs.oraclevcn.com
| Database Type | Oracle Database 23.5 Free Edition | Contains 1 CDB and 3 PDBs
| CDB Name   | FREE | CDB login details: 
|            |      |    Username/Password: sys/oracle4GG
| PDB Name   | DBNORTH | PDB login details: 
|            |      |   Username/Password: sys/oracle4GG
| PDB Name   | DBSOUTH | Login Details:  
|            |        |   Username/Password: sys/oracle4GG
| PDB Name   | DBWEST | Login Details: Username/Password: sys/oracle4GG
Database Connections| For DBNORTH | Username/Password: ggadmin@dbnorth/ggadmin 
|                   | For DBSOUTH | Username/Password: ggadmin@dbsouth/ggadmin
|                   | For DBWEST  | Username/Password: ggadmin@dbwest/ggadmin
|Oracle GoldenGate | Service Manager | Port: 9000 
| | | Username/Password: ggma/GGma_23ai
|Oracle GoldenGate | Deployment Name: depl_north | Port: 9000 to 9004 <br> </br> Username/Password: ggma/GGma_23ai 
| | Deployment Name: depl_south | Port: : 9100 to 9104 <br> </br> Username/Password: ggma/GGma_23ai
| | Deployment Name: depl_west | Port: 9201 to 9204 <br></br> Username/Password: ggma/GGma_23ai



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

       
       <copy>
       ls -l
       
       </copy>
       

2.  Move to the <code>scripts</code> directory 

       ```
       <copy>
       cd scripts       
       </copy>

       ```
    You will be able to see the scripts that are going to be used in the labs for data replication and testing purposes. The <code>scripts</code> folder contains the sub-directory <code>01_Reporting</code>.

3. Move to the <code>Reporting</code> directory. It contains the REST-API directory for cURL and the Admin Client directory for OBEY commands.

You may now **proceed to the next lab** to run cURL scripts to set up data replication and test for standard reporting.

## Task 3: Prevent the Database Password from Expiring

You may witness the error "ORA-65162: Password of the common database user has expired", while accessing the PDBs for various tasks during the labs. To avoid the password from expiring, perform the following steps to increase the validity of the password:

1. From the terminal, load the environment variables using the command: 
   
   <copy>
     
     source /usr/local/bin/.set-env-db.sh

   </copy>

2. From the command prompt, log in to SQL Server:
   
   ```
    <copy>

      sqlplus / as sysdba
   
    </copy>
   
   ```

2. On the SQL prompt, run the following commands to set the password validity for the PDBs:
   
   `DBNORTH`

   ```
    <copy>
      
      alter session set container = DBNORTH;
      create profile ggprofile limit password_life_time unlimitedd;
      alter user ggadmin profile ggprofile;
      select username, expiry_date from DBA_USERS where username = 'GGADMIN';
    
    </copy>
         
   ```

   `DBSOUTH`

   ```
    <copy>
      
      alter session set container = DBSOUTH;
      create profile ggprofile limit password_life_time unlimitedd;
      alter user ggadmin profile ggprofile;
      select username, expiry_date from DBA_USERS where username = 'GGADMIN';
    
    </copy>
    
   ```
   
   `DBWEST`
   
   ```
    <copy>
      
      alter session set container = DBWEST;
      create profile ggprofile limit password_life_time unlimitedd;
      alter user ggadmin profile ggprofile;
      select username, expiry_date from DBA_USERS where username = 'GGADMIN';
    
    </copy>
    
   ```

## Learn More

* [Oracle GoldenGate Microservices REST APIs](https://docs.oracle.com/en/middleware/goldengate/core/23/oggra/)
* [Command Line Reference Guide](https://docs.oracle.com/en/middleware/goldengate/core/23/gclir/index.html)

## Acknowledgements
* **Author** - Preeti Shukla
* **Contributors** - Preeti Shukla, Volker Kuhr
* **Last Updated By/Date** - Preeti Shukla, Oracle GoldenGate, Principal UAD, June 2025
