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

, which are as follows:



Estimated Time: 10 minutes

### Objectives