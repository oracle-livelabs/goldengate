# Set Up Data Replication using cURL Scripts

## Introduction

This lab describes how to use the <code>add_replication_reporting_curl.sh script</code> to automatically set up an Oracle GoldenGate processes on the source (<b>depl_north</b>) and target (<b>depl_south</b>) deployments. 

The source deployment <b>depl_north</b> is connected to the <b>DBNORTH</b> PDB and the <b>depl_south</b> deployment is connected to the <b>DBSOUTH</b> PDB. The deployments are already created in the environment. 

Estimated Time: 10 minutes

### Objectives
In this lab, you will: 

* Run the <code>add_replication_reporting_curl.sh script</code>, which would automatically perform the following tasks:

   * Add USERIDALIAS for the PDBs, DBNORTH and DBSOUTH on the CDB to connect to the Database instance
   *	Add supplemental logging to the database schema hr (SCHEMATRANDATA) on the source PDB, <b>DBNORTH</b>
   *	Add heartbeat and checkpoint tables on the source and target PDBs.
   *	Add Extract on the source PDB, <b>DBNORTH</b>
   *	Set up the Extract parameter file
   *	Add Distribution Path from source to target systems
   *	Add Replicat on the target PDB, <b>DBSOUTH</b>
* View the Standard Business Report based on sample data.
* Delete the data replication environment using the <code>delete_replication_reporting_curl.sh</code> script.


### Prerequisites

This lab assumes that you have completed the tasks in **initial-setup**


## Task 1: 

   Make sure you are in the /scripts/UseCases/01_Reporting/ directory and perform the following tasks:
   
   1. Move to the <code>REST-API</code> directory and list the content for this directory:
     
      ```
      <copy>
      cd REST-API
      ls-l
      </copy>
      ```
      The components of the directory are listed as shown in the following image:

       ![Contents of the REST-API directory](./images/rest-api_dir.png " ")

   2. Run the <code>add_replication_reporting_curl.sh script</code> script:

       ```
       <copy>
        
       </copy>
       ```

   3. 
   
       ```
       <copy>
        
       </copy>
       ```
        
   4. 
          
         ```
           <copy>
            

            
          </copy>
         ```   
         
         
    
## Task 2: View the Sample Standard Business Report

   To view the Standard Report based on sample data:

   1. 
   
       ```
         <copy>
            adminclient
         </copy>
       ```
  
   2. :

      ```
      <copy>
       
      </copy>
      ```

   3. Connect to **pdbwest** using alias **ggwest**

      ```
       <copy>
       
       </copy>
      ```

   4. Run the following command:
     
      ```
      <copy>
       
      </copy>
      ```
      The output displays the following:

      ![Extract statistics](./images/.png " ")

      Notice that there are 3 update records captured by Extract.

## Task 3: Delete the Data Replication Setup

   It's essential to delete the setup to be able to test the same feature using the OBEY commands within the same environment. You can also use this script to test and delete data replication environments in your own test enviornment. 
   
   To delete the setup:

   1. 

      ```
      <copy>
       
      </copy>
      ```
   2. Run the commmand:

      ```
      <copy>
       
      </copy>
      ```
     The output displays 3 update records:

      ![STATS Replicat](./images/stats_repe.png " ")

   3. Exit from admin client:

      ```
      <copy>
       
      </copy>
      ```
   4. Connect to the target pluggable database **pdbeast**.

      ```
       <copy>
       
       </copy>
      ```
    
       ![Connect to pdbeast](./images/.png " ")

   5. Check the updated records in the database by running the following SQL query on target database **pdbeast**:
 
      ```
      <copy>
       
      </copy>
      ```

      


## Learn More
* [Using the Admin Client](https://docs.oracle.com/en/middleware/goldengate/core/23/coredoc/administer-microservices-command-line-interface.html#GUID-0403FAF0-B2F7-48A0-838F-AB4421E5C5E2)



## Acknowledgements
* **Author** - Preeti Shukla, Principal UA Developer, Oracle GoldenGate User Assistance
* **Contributors** -  Volker Kuhr, Nick Wagner
* **Last Updated By/Date** - Preeti Shukla, October 2024
