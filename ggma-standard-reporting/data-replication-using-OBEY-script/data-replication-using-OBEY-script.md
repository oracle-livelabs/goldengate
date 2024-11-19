# Set Up Data Replication using OBEY Scripts


## Introduction

This lab describes how to use OBEY scripts <strong>add_replication_reporting.oby</strong> to automatically set up an Oracle GoldenGate processes on the source (<strong>depl_north</strong>) and target (<strong>depl_south</strong>) deployments. Check the business reports using the <strong>check_replication_reporting.oby</strong> script. Delete the data replication environment using the <strong>delete_replication_reporting.oby</strong>.

The source deployment <strong>depl_north</strong> is connected to the <strong>DBNORTH</strong> PDB and the <strong>depl_south</strong> deployment is connected to the <strong>DBSOUTH</strong> PDB. The deployments are already created in the environment. 

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

  Make sure you are in the <code>/scripts/UseCases/01_Reporting/</code> directory and perform the following tasks:
   
   1. Move to the <code>AdminClient</code> directory and list the content for this directory:

       ![Files inside the AdminClient directory](./images/oby_scripts_list.png " ")
     
   2. Run the <code>add_replication_reporting.sh</code> script:
      
       ```
         <copy>
            ./add_replication_reporting.sh
         </copy>
       ```
      
      This script contains the following commands:
      
         ```
         <copy>
            cp EXTN.prm  /u01/app/oracle/deployments/depl_north/etc/conf/ogg/

            cp REPN.prm  /u01/app/oracle/deployments/depl_south/etc/conf/ogg/
            
            echo "obey add_replication_reporting.oby" | adminclient

         </copy>
       ```

      You need to run this script to copy the Extract and Replicat parameter files to Oracle GoldenGate deployment's configuration directory and then run the <code>add_replication_reporting.oby</code> script to set up data replication. 

      The <code>add_replication_reporting.oby</code> script, which is inside the <code>add_replication_reporting_adminclient.sh</code> script, runs after the Extract and Replicat parameter files are copied to the Oracle GoldenGate deployment's <code>/etc/conf/ogg/</code> directory. After the script runs successfully, you will be able to see the Extract and Replicat processes in running state and also view the reports for the committed transactions.  

      This script contains the following commands:
      
      ```
      <copy>

        --
        -- Connect the GoldenGate Deployment    
           depl_north

        --
        CONNECT https://north:9001 DEPLOYMENT 
        depl_north AS ggma PASSWORD GGma_23ai !

        ALTER CREDENTIALSTORE ADD USER ggadmin@dbnorth ALIAS ggnorth DOMAIN OracleGoldenGate PASSWORD ggadmin

        INFO CREDENTIALSTORE

        DBLOGIN USERIDALIAS ggnorth DOMAIN OracleGoldenGate

        ADD SCHEMATRANDATA hr

        ADD HEARTBEATTABLE

        ADD EXTRACT extn INTEGRATED TRANLOG BEGIN NOW

        REGISTER EXTRACT extn database

        ADD EXTTRAIL north/ea, EXTRACT extn

       START EXTRACT extn

       ADD DISTPATH dpns SOURCE trail://north:9002/services/v2/sources?trail=north/ea TARGET wss://south:9103/services/v2/targets?trail=north/da !

       START DISTPATH dpns

       --
       -- Connect the GoldenGate Deployment 
          depl_south
       --
       CONNECT https://south:9101 DEPLOYMENT    
       depl_south AS ggma PASSWORD GGma_23ai !
      
       ALTER CREDENTIALSTORE ADD USER ggadmin@dbsouth ALIAS ggsouth DOMAIN OracleGoldenGate PASSWORD ggadmin

       INFO CREDENTIALSTORE

       DBLOGIN USERIDALIAS ggsouth DOMAIN OracleGoldenGate
      
      ADD CHECKPOINTTABLE ggadmin.ggs_checkpointtable
      
      ADD HEARTBEATTABLE
      
      ADD REPLICAT repn, PARALLEL, EXTTRAIL north/da, CHECKPOINTTABLE ggadmin.ggs_checkpointtable 
      
      START REPLICAT repn
      
      INFO ALL
      
      INFO DISTPATH ALL
      
      DISCONNECT

      </copy>    
      ```
   
    
## Task 2: Check the Business Reports

   The statistical reports for the committed transactions are available in the data replication environment. To check these reports, perform the following steps:

   1. Run the <code>./check_replication_reporting_adminclient.sh script</code> to run the OBEY commands in the <code>check_replication_reporting_reporting.oby</code> script:
   
       ```
         <copy>
            ./check_replication_reporting_adminclient.sh
         </copy>
       ```
  
   The output of the report is shown in the following image:

   ![Output for check_replication_reporting_oby script](./images/check_repl_output.png " ")


## Task 3: Delete the Replication Environment

After you check the reports, you can delete the data replication environment using the . This is required for testing the other scripts. 

1. Make sure you are in the <code>/home/oracle/scripts/UseCases/01_Reporting/AdminClient</code> directory.

2. Run the following commmand:

      ```
      <copy>
         ./delete_replication_reporting.sh
      </copy>
      ```
   This script consists of the command to run the <code>delete_replication_reporting.oby</code> script. 
 
      ```
         <copy>
         rm -f /u01/app/oracle/deployments/depl_north/etc/conf/ogg/EXTN.prm

         rm -f /u01/app/oracle/deployments/depl_south/etc/conf/ogg/REPN.prm
         
         echo "obey delete_replication_reporting.oby" | adminclient
      </copy>
      ```
 After you run this script, the data replication environment is deleted.  

  


## Learn More

* [Oracle GoldenGate Microservices REST APIs](https://docs.oracle.com/en/middleware/goldengate/core/23/oggra/)
* [Command Line Reference Guide](https://docs.oracle.com/en/middleware/goldengate/core/23/gclir/index.html)




## Acknowledgements
* **Author** - Preeti Shukla, Principal UA Developer, Oracle GoldenGate User Assistance
* **Contributors** -  Volker Kuhr, Nick Wagner
* **Last Updated By/Date** - Preeti Shukla, 2024
