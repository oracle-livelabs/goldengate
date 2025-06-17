# Set Up Bidirectional Data Replication Using REST API Service Endpoints

## Introduction

An active-active bidirectional replication implies that both data sources and targets (PDBs in this case), have the potential to send updates to each other. There are two data sources with identical sets of data that can be changed by application users on either side. Oracle GoldenGate replicates transactional data changes from each database to the other to keep both sets of data current.

This lab describes how to use the Admin Client commands wrapped in an OBEY file to automatically set up Oracle GoldenGate processes on the `depl_north` and `depl_south` deployments in a bidirectional replication environment. 

While the `depl_north` deployment is connected to the `DBNORTH` PDB, the `depl_south` deployment is connected to the `DBSOUTH` PDB. The deployments are already created in the environment. 

![DBNORTH and DBSOUTH PDBs replicate simultaneously to each other in an active-active bidirectional replication](./images/bidirectional_data_replication_hub_based.png)

Estimated Time: 20 minutes

### Objectives
In this lab, you will: 

* Run the `add_replication_ActiveActive_curl.sh` script, which would automatically perform the following tasks:

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

This lab assumes that you have completed the tasks in <b>"Task 1: Load the Oracle GoldenGate and Database Environment"</b> in <b>Lab 3: Initialize Environment</b>. 

If you witness the error "ORA-65162: Password of the common database user has expired", then perform the following steps to increase the validity of the password:

1. From the command prompt, log in to SQL Server:
   
   ```
    <copy>

      sqlplus / as sysdba
   
    </copy>
  
  ```

2. On the SQL prompt, run the following commands to set the password validity for the :
   
  ```
    <copy>
      
      alter session set container = DBNORTH;
      create profile ggprofile limit password_life_time unlimitedd;
      alter user ggadmin profile ggprofile;
      select username, expiry_date from DBA_USERS where username = 'GGADMIN';
    
    </copy>
    
  ```
  
  Perform the same steps for `DBSOUTH`:

   ```
    <copy>
      
      alter session set container = DBSOUTH;
      create profile ggprofile limit password_life_time unlimitedd;
      alter user ggadmin profile ggprofile;
      select username, expiry_date from DBA_USERS where username = 'GGADMIN';
    
    </copy>
    
   ```

## Task 1: Set Up Active Active Data Replication

Follow these steps to set up Oracle GoldenGate processes for bidirectional replication: 
   
   1. From the command prompt, navigate to the `/scripts/UseCases/02_Bidirectional/` directory and list the content of this directory:
     
      ```
      <copy>
        
        cd scripts/UseCases/02_BiDirectional/REST-API
        ls -l
      </copy>
      ```
            
   2. Run the `add_replication_ActiveActive_curl.sh` script:

       ```
       <copy>
        
        ./add_replication_ActiveActive_curl.sh
      
       </copy>
       
       ```
      After this script runs successfully, data replication begins between source and target.
   
  3. To check if the Orcle GoldenGate processes are running successfully, after running the script, start Admin Client from the command prompt.

      ```
        <copy>
          
          adminclient
        
        </copy>

     ```
   4. Connect to the deployment, `depl_north` using the `CONNECT` command.
      
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

   5. Connect to the deployment `depl_south` using the `CONNECT` command and then run the `INFO ALL` and `INFO DISTPATH ALL` commands to check if the processes have been added for the deployment, similar to step 3.

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
      
   In the next task, you will be able to commit DML transactions to the PDBs.

## Task 2: Add DML to DBNORTH and DBSOUTH PDBs and Check the PDBs for Committed Transactions

In this task, you can verify that the Extract processes on `DBNORTH` and `DBSOUTH` databases are working correctly. The following steps will instruct you to run a script that will automatically perform an UPDATE operation on the PDBs. You can check the Extract and Replicat statistics to know monitor the UPDATE has been done successfully.  

Run the following scripts to add DML to the `DBNORTH` and `DBSOUTH` databases and check that Extract has captured DML operations:

1. Navigate back to the folder: `scripts/UseCases/02_BiDirectional`. 
   
   It contains the shell scripts `./dbnorth_dml_operations.sh` and `./dbsouth_dml_operations.sh`, which can be used to perform DML UPDATE operations on `DBNORTH` and `DBSOUTH`. These UPDATE operations will then be captured by Extract processes on both PDBs and replicated. 
   
2. Run the following script to perform DML operations on the `DBNORTH` database:

   ```
   <copy>
   
     ./dbnorth_dml_operations.sh
   
   </copy>

   ```

3. Run the following script to perform DML operations on the `DBSOUTH` database:

   ```
   <copy>
     
      ./dbsouth_dml_operations.sh
   
   </copy>

   ```

4. Now, run the script `dbnorth_select.sh`. This script contains queries to check the data on the <b>hr.employees</b> table of the PDB, `DBNORTH`.

   ```
     <copy>

        ./dbnorth_select.sh
     
     </copy>

   ```

   You should be able to view the updated table columns in the table. 

5. Run the script `dbsouth_select.sh` to check the data on the `DBSOUTH` database.

```
<copy>

    ./dbsouth_select.sh

</copy>

```
This script displays the content of the  `DBSOUTH` database tables <b>hr.employees</b>. You should be able to view the updated table columns that were updated on the `DBSOUTH` database.                  
    
## Task 3: Check the Statistics in Oracle GoldenGate Microservices Web Interface

The statistical reports that you viewed in Task 2 can also be viewed from the web interface. 

Following are the steps to access these reports from the web interface:

1. Open a web browser within the environment, and enter the URL of the Administration Service: 

      https://north:9001

2. Log in to the Administration Service using the credentials <b>ggma/GGma_23ai</b>.

3. From the left-navigation pane, expand the list of Extracts and select the <b>EXTN</b> Extract.

4. Click the <b>Statistics</b> option to view the report. 
   
This statistical report shows you the number of updates done for the specified tables. 


## Task 4: View the Replicat Using Statistics for Oracle GoldenGate Processes

After adding records, you can view the Extract Statistics to confirm that the committed transactions were captured. The `check_replication_ActiveActive.sh` script allows you to view the statistics for different Oracle GoldenGate processes.

To view the Standard Report based on sample data:

   1. Run the `check_replication_ActiveActive_curl.sh` script
   
       ```
         <copy>
          
            ./check_replication_ActiveActive_curl.sh
         
         </copy>
       
       ```
      The output for this script shows various detiails. You can view these details to verify that the bidirectional replication is working.

   2. Observe the Extract and Replicat statistics to see the INSERTS, UPDATES, and DELETES of records. If the replication occurred correctly, then the Replicat statistics would have same the same number of INSERTS, UPDATES, and DELETES, as the Extract statistics.

## Task 5: Delete the Bidirectional Replication Setup

  After testing the active-active bidirectional scenario, you must remove this replication setup so that you can test other topologies and environments available in this system. 
  
  You can also use this script to test and delete data replication environments in your own test enviornment. 
   
  To delete the setup:

  1. Run the script `delete_replication_ActiveActive_curl.sh`.
   
      ```
        <copy>
      
          ./delete_replication_ActiveActive_curl.sh  
      
        </copy>
      
      ```
   
  2. You can verify that the environment was deleted by connecting to the deployment and running the `INFO ALL` command on `depl_north` deployment.

    ```
      <copy>
        
        connect https://north:9001 deployment depl_north as ggma password GGma_23ai ! 
        
      </copy>
      
    ```

  3. Run the `INFO ALL` command and `INFO DISTPATH ALL` commands after connecting to the deployment. These commands display the message `"No processes found"`, if the Extract, Replicat processes have been deleted successfully.

  4. Repeat steps 2 and 3 for the `depl_south` deployment.
   
  After you delete the environment, you can use the `add_replication_ActiveActive_curl.sh` script again to rebuild the environment or copy the script to apply in your own test environment.

   
## Learn More

* [Oracle GoldenGate Microservices REST APIs](https://docs.oracle.com/en/middleware/goldengate/core/23/oggra/)
* [Command Line Reference Guide](https://docs.oracle.com/en/middleware/goldengate/core/23/gclir/index.html)
* [Oracle GoldenGate Microservices Architecture Solutions](https://docs.oracle.com/en/middleware/goldengate/core/23/ggsol/)



## Acknowledgements
* **Author** - Preeti Shukla, Principal UA Developer, Oracle GoldenGate User Assistance
* **Contributors** -  Volker Kuhr
* **Last Updated By/Date** - Preeti Shukla, 2025
