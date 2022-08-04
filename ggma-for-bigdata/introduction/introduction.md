# Introduction

## About Oracle GoldenGate Microservices for Big Data
Oracle GoldenGate Microservices for Big Data offers a high-performance, fault-tolerant, easy-to-use, and flexible real-time data streaming platform for big data environments. Oracle GoldenGate Microservices Architecture (MA) would configure and manage your data replication using an HTML user interface. The Oracle GoldenGate MA comprises the following components: Service Manager, Administration Server, Distribution Server, Receiver Server, Performance Metrics Server, and Admin Client.

In this hands-on lab, we will load data in the Oracle Database schema ***SOE*** of Pluggable Database ***PDB***. GG extract process ***EXTORA*** will capture the changes from Oracle Database and write them to the local trail file ***et***. The Distribution Service ***SRC2TGT*** will route the trail file  ***et*** to target GoldenGate(MA) for Big Data Receiver Service as ***rt***. The replicat process will read the remote trail files ***rt*** and replicates to the desired target ***(Apache Kafka, Apache Hadoop, Apache HBase, Cassandra, and MongoDB)***.

Estimated Workshop Time: 4 hours

**Workshop  Microservices Architecture**
    ![Architecture](./images/architecture.png " ")

### Objectives
In this workshop, you will learn:
- How to  replicate from  Oracle to Apache Kafka.
- How to  replicate from  Oracle to Apache Hadoop cluster.
- How to  replicate from  Oracle to Apache HBase.
- How to  replicate from  Oracle to Apache Cassandra.
- How to  replicate from  Oracle to MongoDB.


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
