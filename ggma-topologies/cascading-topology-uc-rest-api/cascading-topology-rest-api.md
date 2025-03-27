# Configure a Cascading Replication Topology Using REST API  


## Introduction

Oracle GoldenGate supports cascading synchronization, which means that Oracle GoldenGate propagates data changes from one database to a second transitional database, and then on to a third database.

![This image shows the Cascading topology.](./images/cascading.png)

In a typical cascading configuration: 

* An Extract on the initial database or PDB, writes captured data to a local trail, and a Distribution Path sends the data to a remote trail on the transitional system in the cascade.

* On the second host system, Replicat applies the data to the local database or PDB.

* Another Extract on that same system captures the data from the local database and writes it to a local trail.

* A distribution path (DISTPATH) sends the data to a remote trail on the final system in the cascade, where it is applied to the local database or PDB by another Replicat.

This configuration can be used to perform data filtering and conversion if the character sets on all systems are identical. If character sets differ, then a data pump cannot perform conversion between character sets, and you must configure Replicat to perform the conversion and transformation on the target.

### Cascading Configuration in this Lab

For setting up replication across a Cascading topology, there are some preset configurations. The following diagram depicts the initial, intermediate, and final databases that have been set up for testing the Cascading replication. 

![The initial source database, DBNORTH, replicates to the intermediate database, DBWEST, then the Extract from from DBWEST writes to the local trail and sends the data to DBSOUTH using a distribution path](./images/cascading_livelab_uc.png)

From this diagram, you can deduce the following: 

* The `depl_north` deployment captures from `DBNORTH` and connects to the `depl_west` deployment on another intermediate host machine. 

* The Replicat process on `depl_west`, replicates to the `DBWEST` database.  

* The Extract process, EXTW, in `depl_west` captures the replicated data and writes it to the local trail.

*  The DISTPATH process in `depl_west` deployment transfers the local trail to the `depl_south` deployment, where the Replicat process REPN,  replicates to `DBSOUTH` database. 



Estimated Time: 10 minutes

### Objectives

The objective of this tutorial is to:

* Show the use of data replication in a cascading topology.

* Run the automation scripts to set up the Oracle GoldenGate processes in `depl_north`, `depl_west`, and `depl_south` deployments. 

* Test the output to show replication across the environment connected using a Cascading topology configuration.

### Prerequisites

This lab assumes that you have completed the tasks in **initial-setup**.


## Task 1: Set Up Oracle GoldenGate Processes Across Multiple Deployments on Different Databases

   To set up the Extract, Replicat, Distribution Path, and Receiver Path processes across deployments, follow these steps:

   1. Navigate to the `/scripts/UseCases/03_Cascading/REST-API` directory. You will see the script `add_replication_cascading_curl.sh`.

   2. Run this script using the following command:

   ```
   .\add_replication_cascading_curl.sh`
   
   ```
   This script automatically creates the Extract, Replicat, DISTPATH processes for all three deployments.

   3. Now, let's test whether the processes are up and running in these deployments. 

       a. Run the `