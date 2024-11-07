# Set Up Data Replication using OBEY Scripts


## Introduction

This lab describes how to use the OBEY script <code>add_replication_reporting.oby</code> to automatically set up an Oracle GoldenGate processes on the source (<b>depl_north</b>) and target (<b>depl_south</b>) deployments.

The source deployment <b>depl_north</b> is connected to the <b>DBNORTH</b> PDB and the <b>depl_south</b> deployment is connected to the <b>DBSOUTH</b> PDB. The deployments are already created in the environment. 

Estimated Time: 10 minutes

### Objectives

In this lab, you will:

* Run the <code>add_replication_reporting.oby </code> script, to automatically perform the following tasks:

   * Add USERIDALIAS for the PDBs, DBNORTH and DBSOUTH on the CDB to connect to the Database instance
   *	Add supplemental logging to the database schema hr (SCHEMATRANDATA) on the source PDB, <b>DBNORTH</b>
   *	Add heartbeat and checkpoint tables on the source and target PDBs.
   *	Add Extract on the source PDB, <b>DBNORTH</b>
   *	Set up the Extract parameter file
   *	Add Distribution Path from source to target systems
   *	Add Replicat on the target PDB, <b>DBSOUTH</b>
* View the Standard Business Report based on sample data.
* Delete the data replication environment using the <code>delete_replication_reporting.oby</code> script.


### Prerequisites
This lab assumes that you have completed the tasks in **initial-setup**


## Task 1: Set Up Data Replication

  Make sure you are in the /scripts/UseCases/01_Reporting/ directory and perform the following tasks:
   
   1. Move to the <code>AdminClient</code> directory and list the content for this directory:
     
   2. 
   
    
## Task 2: Verify that the updated records are captured by Extract

   To check if this committed transaction is captured by Extract:

   1. Start the Admin Client:
   
       ```
         <copy>
            adminclient
         </copy>
       ```
  
   2. Connect to the deployment:

      ```
      <copy>
       CONNECT http://localhost:9012 DEPLOYMENT depl_01 as ggma PASSWORD ggma
      </copy>
      ```

   3. Connect to **pdbwest** using alias **ggwest**

      ```
       <copy>
        DBLOGIN USERIDALIAS ggwest
       </copy>
      ```

   4. Run the following command:
     
      ```
      <copy>
       STATS EXTRACT extw
      </copy>
      ```
      The output displays the following:

      ![Extract statistics](./images/stats_extw.png " ")

      Notice that there are 3 update records captured by Extract.

## Task 3: Verify that the Replicat applied the updates to the target database

   To check if Replicat successfully applied the UPDATE transactions:

   1. Connect to **pdbeast** using alias **ggeast**

      ```
      <copy>
       DBLOGIN USERIDALIAS ggeast
      </copy>
      ```
   2. Run the commmand:

      ```
      <copy>
       STATS REPLICAT repe
      </copy>
      ```
     The output displays 3 update records:

      ![STATS Replicat](./images/stats_repe.png " ")

   3. Exit from admin client:

      ```
      <copy>
       EXIT
      </copy>
      ```
   4. Connect to the target pluggable database **pdbeast**.

      ```
       <copy>
        sqlplus ggadmin/Welcome2OGG@pdbeast
       </copy>
      ```
    
       ![Connect to pdbeast](./images/connect_pdbeast.png " ")

   5. Check the updated records in the database by running the following SQL query on target database **pdbeast**:
 
      ```
      <copy>
       Select last_name, first_name, phone_number from hr.employees where last_name=’Vargas’ and first_name=’Peter’;
    
       Select last_name, first_name, phone_number from hr.employees where last_name=’Walsh’ and first_name=’Alana’;

       Select last_name, first_name, phone_number from hr.employees where last_name=’Whalen’ and first_name=’Jennifer’;
      </copy>
      ```

      The output should displays as follows:

      ![Output for updated records in pdbeast](./images/pdbeast_output.png)

      Notice the updated phone numbers for each of the records.


## Learn More
* [Using the Admin Client](https://docs.oracle.com/en/middleware/goldengate/core/21.3/coredoc/administer-microservices-command-line-interface.html#GUID-0403FAF0-B2F7-48A0-838F-AB4421E5C5E2)



## Acknowledgements
* **Author** - Preeti Shukla, Principal UA Developer, Oracle GoldenGate User Assistance
* **Contributors** -  Volker Kuhr, Alex Lima, Madhusudhan Rao
* **Last Updated By/Date** - Preeti Shukla, April 2023
