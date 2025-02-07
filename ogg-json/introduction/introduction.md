# Introduction

## Replicate Oracle Database 23ai JSON-relational duality view data in real-time using Oracle GoldenGate 23ai
Oracle GoldenGate 23ai (23.6.0.24.10) now supports replicating full-featured business objects in an event-based, pub/sub architecture with Oracle JSON Relational Duality and GoldenGate Data Streams. This is implemented by combining two new Oracle technology features: Oracle Database JSON Relational Duality Views and Oracle GoldenGate Data Streams.

Oracle GoldenGate 23ai (23.6) supports following replication use-cases / scenarios for JSON Relational Duality Views and JSON Collection Tables:

- JSON-Relational Duality Views and/or JSON Collection Tables to Data Streams: Oracle GoldenGate can replicate changes made to JSON Duality View as JSON objects to GoldenGate Data Streams.
- JSON Collection Tables to JSON Collection Tables: Oracle GoldenGate can replicate data between JSON Collection Tables.
- Duality Views to Collection Tables: Oracle GoldenGate can replicate data from Duality Views to Collection Tables, essentially moving data between these two JSON-focused features.
- Replication between Duality Views (Underlying Tables ) to Duality Views (Underlying Tables): Oracle GoldenGate allows replicating the underlying tables from Duality Views to Duality Views, without replicating the view. If supplemental logging is enabled for a JSON Duality Views, it generates extra redo on top of the existing relational table.
Note: Replication from one Duality View to another is not supported.

In this hands-on lab, we will load data in the Oracle Database schema ***SOE*** of Pluggable Database ***PDB***. GG extract process ***EXTORA*** will capture the changes from Oracle Database and write them to the local trail file ***et***. The Distribution Service ***SRC2TGT*** will route the trail file  ***et*** to target GoldenGate(MA) for Big Data Receiver Service as ***rt***. The replicat process will read the remote trail files ***rt*** and replicates to the desired target ***(Apache Kafka, Apache Hadoop, Apache HBase, Cassandra, and MongoDB)***.

Estimated Workshop Time: 4 hours

**Workshop  Microservices Architecture**
    ![Architecture](./images/architecture.png " ")

### Objectives
In this workshop, you will learn:
- How to replicate from Oracle to Apache Kafka.
- How to replicate from Oracle to Apache Hadoop cluster.
- How to replicate from Oracle to Apache HBase.
- How to replicate from Oracle to Apache Cassandra.
- How to replicate from Oracle to MongoDB.


### Prerequisites
This lab assumes you have:
* An Oracle account


You may now proceed to the next lab.

## Learn More

* [GoldenGate](https://www.oracle.com/middleware/data-integration/goldengate/")
* [GoldenGate for Big Data](https://www.oracle.com/middleware/data-integration/goldengate/big-data/")
* [GoldenGate Microservices Architecture (MA)](https://docs.oracle.com/en/middleware/goldengate/big-data/21.1/gadbd/getting-started-oracle-goldengate-microservices-big-data.html#GUID-248D5562-397F-4D10-9E95-CE9477012950)


## Acknowledgements
* **Author** - Madhu Kumar S, AppDev and Integration, Bangalore Tech Team
* **Contributors** - Madhu Kumar S, Brian Elliott, Deniz Sendil
* **Last Updated By/Date** - Madhu Kumar S, AppDev and Integration, Bangalore Tech Team, August 2022
