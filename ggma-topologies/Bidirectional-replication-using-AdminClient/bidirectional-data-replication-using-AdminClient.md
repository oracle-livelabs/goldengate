# Set Up Bidirectional Data Replication Using the Admin Client

## Introduction

This lab describes how to use the Admin Client commands wrapped in an OBEY file to automatically set up Oracle GoldenGate processes on the `depl_north` and `depl_south` deployments. Considering that this is a bidirectional deployment configuration, both deployments send and receive data at the same time. 

While the `depl_north` deployment is connected to the `DBNORTH` PDB, the `depl_south` deployment is connected to the `DBSOUTH` PDB. The deployments are already created in the environment. 

You will also use the `dbnorth_dml_operations.sh` and `dbsouth_dml_operations.sh` scripts to automatically add DML records to the `DBNORTH` and `DBSOUTH` PDBs, respectively. 

After adding records, you can view the Extract Statistics to confirm that the committed transactions were captured. The `check_replication_activeactive.sh` script allows you to view the statistics for different Oracle GoldenGate processes.  

To check if the bidirectional replication works correctly, you need to prevent data looping or data duplication while replicating data from `DBNORTH` to `DBSOUTH` and from `DBSOUTH` to `DBNORTH`. To check this, you will run the `dbnorth_select.sh` script to view the INSERTS, UPDATES, DELETES records from `DBNORTH` to `DBSOUTH` and then run the `dbsouth_select.sh` script to view the INSERTS, UPDATES, and DELETES from `DBSOUTH` to `DBNORTH`.

After you have completed testing this scenario, using the Admin Client, you must remove this replication setup so that you can test the same steps using the Admin Client. To delete this environment, use the `delete_replication_activeactive_adminclient.sh`.

Estimated Time: 20 minutes

### Objectives
In this lab, you will: 

* Run the `add_replication_activeactive_adminclient.sh` script, which would automatically perform the following tasks:

      * Add USERIDALIAS for the PDBs, DBNORTH and DBSOUTH on the CDB to connect to the database instance
      *	Add supplemental logging to the database schema `hr` (SCHEMATRANDATA) on `DBNORTH` and `DBSOUTH` PDBs
      *	Add heartbeat and checkpoint tables on the both PDBs.
      *	Add Extract on the `DBNORTH` and `DBSOUTH`
      *	Set up the Extract parameter file
      *	Add Distribution Path from `DBNORTH` to `DBSOUTH` and then from `DBSOUTH` to `DBNORTH`
      *	Add Replicat on the both PDBs, `DBNORTH` and `DBSOUTH`
* View the lag statistics and check for data duplication.
* Delete the data replication environment using the `delete_replication_activeactive_adminclient.sh` script.


## Prerequisites

This lab assumes that you have completed the tasks in [Task 1: Load the Oracle GoldenGate and Database Environment](/ggma-topologies/initial-setup/initial-setup.md#task-1-load-the-oracle-goldengate-and-database-environment). 


## Task 1: Set Up Active Active Data Replication
 
Follow these steps to set up Oracle GoldenGate processes for bidirectional replication:   
   
   1. From the command prompt, navigate to the `/scripts/UseCases/02_Bidirectional/AdminClient` directory and list the content of this directory:
     
      ```
      <copy>
      cd /scripts/UseCases/02_Bidirectional/AdminClient
      
      </copy>
      ```
                 
   2. Edit the parameter files for Extract and Replicat processes using the EDIT PARAMS command.

      For example, run the EDIT PARAMS command for EXTS process and copy the values from the EXTS.prm file, which is located in `/scripts/UseCases/02_Bidirectional` folder.

      ```
      <copy>
         EDIT PARAMS EXTS
      </copy>
      ```
      The Extract parameter file for EXTS.prm file is as follows:

      ```
      <copy>
       EXTRACT exts
       USERIDALIAS ggsouth
       EXTTRAIL south/ea
       TRANLOGOPTIONS EXCLUDETAG +
       DDL INCLUDE MAPPED
       DDLOPTIONS REPORT
       REPORTCOUNT EVERY 10 MINUTES, RATE
       WARNLONGTRANS 15MINUTES, CHECKINTERVAL 5MINUTES
       TABLE hr.*;
      </copy>
      ```

      You can update the other process files in the same manner. 

      The Extract parameter file for EXTN.prm file is as follows:
      
      ```
      <copy>
       EXTRACT extn
       USERIDALIAS ggnorth
       EXTTRAIL north/ea
       
       TRANLOGOPTIONS EXCLUDETAG +
      
       DDL INCLUDE MAPPED
       DDLOPTIONS REPORT

       REPORTCOUNT EVERY 10 MINUTES, RATE
       WARNLONGTRANS 15MINUTES, CHECKINTERVAL 5MINUTES

       TABLE hr.*;
      </copy>
      ```
      The Replicat parameter file for REPS.prm is as follows:

      ```
      <copy>
      REPLICAT reps
      USERIDALIAS ggnorth DOMAIN OracleGoldenGate

      DDLOPTIONS REPORT
      DDLERROR DEFAULT, DISCARD

      REPORTCOUNT EVERY 10 MINUTES, RATE

      REPERROR (DEFAULT, DISCARD)
      MAP hr.*, TARGET hr.*;
      </copy>
      ```
      The Replicat parameter file for REPN.prm is as follows:

      ```
      <copy>

      REPLICAT repn
      USERIDALIAS ggsouth DOMAIN OracleGoldenGate

      DDLOPTIONS REPORT
      DDLERROR DEFAULT, DISCARD

      REPORTCOUNT EVERY 10 MINUTES, RATE

      REPERROR (DEFAULT, DISCARD)
      MAP hr.*, TARGET hr.*;
      </copy>
      ```


   3. Run the `add_replication_ActiveActive_adminclient.sh` script:

       ```
       <copy>
        ./add_replication_ActiveActive_adminclient.sh
       </copy>
       ```
      After this script runs successfully, data replication begins between thw `DBNORTH` and `DBSOUTH` PDBs.
   
   4. To check if the Orcle GoldenGate processes are running successfully, after running the script, start Admin Client from the command prompt.

      ```
        <copy>
          adminclient
        </copy>
      ```
    5. Connect to the deployment, `depl_north` using the `CONNECT` command.
      
      ```
        <copy>
          CONNECT https://north:9001 deployment depl_north as ggma password GGma_23ai ! 
        </copy>
      ```
      
      ```
      <copy>
         INFO ALL
      </copy> 
      ```
      This command displays the Extract and Replicat proceses running on the `depl_north` deployment.

      ```
      <copy>
         INFO DISTPATH ALL
      </copy>
      ```
      This command displays the DISTPATHS running on the `depl_north` deployment.

    6. Connect to the deployment `depl_south` using the `CONNECT` command and then run the `INFO ALL` and `INFO DISTPATH ALL` commands to check if the processes have been added for the deployment, similar to step 3.

      ```
        <copy>
         CONNECT https://south:9101 deployment depl_south as ggma password GGma_23ai ! 
         
        </copy>
      ```
      After connecting to the deployment, run the following commands:

      ```
        <copy>
          INFO ALL
        </copy>
      ```
      This command displays the Extract and Replicat proceses running on the `depl_south` deployment.

      ```
        <copy>
          INFO DISTPATH ALL
        </copy>
      ```
      This command displays the DISTPATHS running on the `depl_south` deployment.

In the next task, you will be able to test the sample report based on the transactions committed when the `add_replication_activeactive_adminclient.sh` script runs.

## Task 2: Add DML to DBNORTH and DBSOUTH PDBs 

Verify that the Extract processes on `DBNORTH` and `DBSOUTH` databases are working correctly. 

Run the following scripts to add DML to the `DBNORTH` and `DBSOUTH` databases and check that Extract has captured DML operations:

1. Navigate to the folder: `/home/oracle/scripts/UseCases/02_Bidirectional`.

2. Run the script to add DML operations on the `DBNORTH` database:

   ```
   <copy>./dbnorth_dml_operations.sh</copy>
   ```
3. Run the script to add DML operations on the `DBSOUTH` database:

   ```
   <copy>./dbsouth_dml_operations.sh</copy>

   ```

3. Check the Extract statistics to view that the DML operations was captured using the steps given in Task 3.

4. After you check that the DML has been captured on the DBNORTH database, run the script `dbnorth_select.sh`. This script contains queries that allow you to check the data on the `DBSOUTH` database.
```
<copy>./dbnorth_select.sh</copy>
```
This script displays the content of the `DBSOUTH` database tables <b>hr.employees</b>. You should be able to view the updated table columns that were updated on the `DBSOUTH` database.

5. After you check that the DML has been captured on the DBSOUTH database, run the script `dbsouth_select.sh`. This script contains queries that allow you to check the data on the `DBNORTH` database.

```
<copy>./dbnorth_select.sh</copy>
```
This script displays the content of the  `DBNORTH` database tables <b>hr.employees</b>. You should be able to view the updated table columns that were updated on the `DBNORTH` database.                  
    
## Task 3: Check the Statistics in Oracle GoldenGate Microservices Web Interface

The statistical reports that you viewed in Task 2 can also be viewed from the web interface. Following are the steps to access these reports from the web interface:

1. Open a web browser within the environment, and enter the URL of the Administration Service: 

      https://north:9001

2. Log in to the Administration Service using the credentials <b>ggma/GGma_23ai</b>.
3. From the left-navigation pane, expand the list of Extracts and select the <b>EXTN</b> Extract.
4. Click the <b>Statistics</b> option to view the report.

## Task 4: View the Active Active Replicat Using Statistics for Oracle GoldenGate Processes

   To view the Standard Report based on sample data:

   1. Run the `check_replication_activeactive_adminclient.sh` script
   
       ```
         <copy>
            ./check_replication_activeactive_adminclient.sh
         </copy>
       ```
      The output for this script shows various detiails. You can view these details to verify that the bidirectional replication is working.

   2. Observe the Extract and Replicat statistics to see the INSERTS, UPDATES, and DELETES of records. If the replication occurred correctly, then the Replicat statistics would have same the same number of INSERTS, UPDATES, and DELETES, as the Extract statistics.

## Task 5: Delete the Bidirectional Replication Setup

   It's essential to delete the setup to be able to test the same feature using the OBEY commands within the same environment. 
   
   You can also use this script to test and delete data replication environments in your own test enviornment. 
   
   To delete the setup:

   1. Run the script `delete_replication_activeactive_adminclient.sh`
   
   ```
     <copy>
      ./delete_replication_activeactive_adminclient.sh  
     </copy>
   ```
   
   2. You can verify that the environment was deleted by connecting to the deployments and running the `INFO ALL` command on `depl_north` and `depl_south` deployments.

   ```
   <copy>
      adminclient
      >connect https://north:9001 deployment depl_north as ggma password GGma_23ai !
      >INFO ALL
   </copy>

   ```
     These commands displays the message "No processes found", if the Extract, Replicat processes have been deleted successfully.
   
     After you delete the environment, you can use the script `add_replication_activeactive_adminclient.sh` again to rebuild the environment or copy the script to apply in your own test environment. 


## Learn More

* [Oracle GoldenGate Microservices REST APIs](https://docs.oracle.com/en/middleware/goldengate/core/23/oggra/)
* [Command Line Reference Guide](https://docs.oracle.com/en/middleware/goldengate/core/23/gclir/index.html)




## Acknowledgements
* **Author** - Preeti Shukla, Principal UA Developer, Oracle GoldenGate User Assistance
* **Contributors** -  Volker Kuhr
* **Last Updated By/Date** - Preeti Shukla, 2025
