# Set Up Bidirectional Data Replication Using REST API Service Endpoints

## Introduction

This lab describes how to use the REST API service endpoints included in `add_replication_activeactive_curl.sh` script to automatically set up Oracle GoldenGate processes on the `depl_north` and `depl_south` deployments. Considering that this is a bidirectional deployment configuration, both deployments send and receive data at the same time. 
   
   >Note:
   >This tutorial does not include the configuration for Auto CDR.
   
The `depl_north` deployment is connected to the `DBNORTH` PDB and the `depl_south` deployment is connected to the `DBSOUTH` PDB. The deployments are already created in the environment. 

You will check if the bidirectional replication works correctly. Using the `dbnorth_dml_operations.sh` and `dbsouth_dml_operations.sh` scripts, you can add DML records to the `DBNORTH` and `DBSOUTH` databases, respectively. 

After adding records, you can view the Extract Statistics to confirm that the committed transactions were captured. The `check_replication_activeactive_curl.sh` script allows you to view the statistics for different Oracle GoldenGate processes.  

To check on the bidirectional replication for an active active set up, you need to prevent data looping or data duplication while replicating data from `DBNORTH` to `DBSOUTH` and from `DBSOUTH` to `DBNORTH`. To check that the bidirectional replication has happened successfully, run the `dbnorth_select.sh` script to view the INSERTS, UPDATES, DELETES records from `DBNORTH` to `DBSOUTH` and then run the `dbsouth_select.sh` script to view the INSERTS, UPDATES, and DELETES from from `DBSOUTH` to `DBNORTH`.

After you have completed testing this scenario, using the REST API service endpoints, you must remove this replication setup so that you can test the same steps using the Admin Client. To delete this environment, use the `delete_replication_activeactive_curl.sh`.

The source deployment `depl_north` is connected to the `DBNORTH` PDB and the `depl_south` deployment is connected to the `DBSOUTH` PDB. The deployments are already created in the environment. 

Estimated Time: 10 minutes

### Objectives
In this lab, you will: 

* Run the `add_replication_activeactive_curl.sh` script, which would automatically perform the following tasks:

     * Add USERIDALIAS for the PDBs, DBNORTH and DBSOUTH on the CDB to connect to the database instance
     *	Add supplemental logging to the database schema `hr` (SCHEMATRANDATA) on `DBNORTH` and `DBSOUTH` PDBs
     *	Add heartbeat and checkpoint tables on the both PDBs.
     *	Add Extract on the `DBNORTH` and `DBSOUTH`
     *	Set up the Extract parameter file
     *	Add Distribution Path from `DBNORTH` to `DBSOUTH` and then from `DBSOUTH` to `DBNORTH`
     *	Add Replicat on the both PDBs, `DBNORTH` and `DBSOUTH`
* View the lag statistics and check for data duplication.
* Delete the data replication environment using the `delete_replication_activeactive_curl.sh` script.


### Prerequisites

This lab assumes that you have completed the tasks in **initial-setup**


## Task 1: Set Up Active Active Data Replication

   Before you begin the following tasks, make sure you have set the environment variables using the steps in [Task 1: Load the Oracle GoldenGate and Database Environment](/initial-setup/initial-setup.md#Task1:LoadtheOracleGoldenGateandDatabaseEnvironment).
   
   Follow these steps to set up Oracle GoldenGate processes for bidirectional replication: 
   
   1. From the command prompt, navigate to the `/scripts/UseCases/02_Bidirectional/` directory and list the content of this directory:
     
      ```
      <copy>
      cd REST-API
      ls -l
      </copy>
      ```
      The components of the directory include:

      * `add_replication_activeactive_curl.sh`
      * `check_replication_activeactive_curl.sh`
      * `delete_replication_activeactive_curl.sh`

      Apart from this, you will be using some additional scripts, which are located in `/scripts/UseCases/02_Bidirectional`. These scripts are:

      * `dbnorth_dml_operations.sh`
      * `dbsouth_dml_operations.sh`
      * `dbnorth_select.sh`
      * `dbsouth_select.sh`
      
   2. Run the `add_replication_activeactive_curl.sh` script:

       ```
       <copy>
        ./add_replication_activeactive_curl.sh
       </copy>
       ```
      After this script runs successfully, data replication begins between source and target.
   
   In the next task, you will be able to test the sample report based on the transactions committed when the `add_replication_activeactive_curl.sh` script runs.

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

4. Check the Extract statistics to view that the DML operations was captured using the steps given in Task 3.

5. After you check that the DML has been captured on the DBNORTH database, run the script `dbnorth_select.sh`. This script contains queries that allow you to check the data on the `DBSOUTH` database.

```
<copy>

   ./dbnorth_select.sh

</copy>

```
This script displays the content of the `DBSOUTH` database tables <b>hr.employees</b>. You should be able to view the updated table columns that were updated on the `DBSOUTH` database.

6. After you check that the DML has been captured on the DBSOUTH database, run the script `dbsouth_select.sh`. This script contains queries that allow you to check the data on the `DBNORTH` database.

```
<copy>

   ./dbnorth_select.sh

</copy>
```
This script displays the content of the  `DBNORTH` database tables <b>hr.employees</b>. You should be able to view the updated table columns that were updated on the `DBNORTH` database.                  
    
## Task 3: Check the Statistics in Oracle GoldenGate Microservices Web Interface

The statistical reports that you viewed in Task 2 can also be viewed from the web interface. Following are the steps to access these reports from the web interface:

1. Open a web browser within the environment, and enter the URL of the Administration Service: 

      https://north:9001

2. Log in to the Administration Service using the credentials <b>ggma/GGma_23ai</b>.
3. From the left-navigation pane, expand the list of Extracts and select the <b>EXTN</b> Extract.
4. Click the <b>Statistics</b> option to view the report.

## Task 4: View the Replicat Using Statistics for Oracle GoldenGate Processes

   To view the Standard Report based on sample data:

   1. Run the `check_replication_activeactive_curl.sh` script
   
       ```
         <copy>
            ./check_replication_activeactive_curl.sh
         </copy>
       ```
      The output for this script shows various detiails. You can view these details to verify that the bidirectional replication is working.

   2. Observe the Extract and Replicat statistics to see the INSERTS, UPDATES, and DELETES of records. If the replication occurred correctly, then the Replicat statistics would have same the same number of INSERTS, UPDATES, and DELETES, as the Extract statistics.

## Task 5: Delete the Bidirectional Replication Setup

   It's essential to delete the setup to be able to test the same feature using the OBEY commands within the same environment. 
   
   You can also use this script to test and delete data replication environments in your own test enviornment. 
   
   To delete the setup:

   1. Run the script `delete_replication_reporting_curl.sh`
   
   ```
     <copy>
      ./delete_replication_activeactive_curl.sh  
     </copy>
   ```
   
   2. Start the Admin Client from the command prompt.

      ```
        <copy>
        adminclient
        </copy>
      ```
   3. Connect to the deployments, `depl_north` and `depl_south` using the connect command.
      
      ```
        <copy>
         CONNECT https://north:9001 deployment depl_north as ggma password GGma_23ai ! 
        </copy>
      ```
      and

      ```
        <copy>
         CONNECT https://south:9101 deployment depl_south as ggma password GGma_23ai ! 
        </copy>
      ```
   
   4. Run the `INFO ALL` and `INFO DISTPATH` commands to check if the processes have been removed from the deployment. 

   You can verify that the environment was deleted if you get the following message on the screen:

      ```
        No processes found.
      ```
   
     After you delete the environment, you can use the `add_replication_activeactive_curl.sh` script again to rebuild the environment or copy the script to apply in your own test environment.

   
## Learn More

* [Oracle GoldenGate Microservices REST APIs](https://docs.oracle.com/en/middleware/goldengate/core/23/oggra/)
* [Command Line Reference Guide](https://docs.oracle.com/en/middleware/goldengate/core/23/gclir/index.html)



## Acknowledgements
* **Author** - Preeti Shukla, Principal UA Developer, Oracle GoldenGate User Assistance
* **Contributors** -  Volker Kuhr
* **Last Updated By/Date** - Preeti Shukla, 2025
