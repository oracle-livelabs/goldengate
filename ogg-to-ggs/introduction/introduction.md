# Introduction

## About this Workshop

Oracle GoldenGate, the industry-leading data replication and integration software, is now available as a fully managed cloud service on Oracle Cloud Infrastructure (OCI). Existing Oracle GoldenGate customers with an on-premises installation or Marketplace image can use this workshop to help you data from Oracle GoldenGate to OCI GoldenGate.

> **Note:** This workshop uses Oracle Autonomous Databases as the source and target. If you plan to use Oracle Database, ensure that you use the CDB user to capture data from the PDBs.

![Diagram](./images/onprem2oci.png)

Estimated time: 120 minutes

[Watch us complete this workshop](https://youtu.be/6KsirCdeUXw).

### About Oracle Cloud Infrastructure GoldenGate

Oracle Cloud Infrastructure GoldenGate is a fully managed cloud service that uses Oracle GoldenGate Microservices to replicate data in real time, at scale, in the cloud. It processes data as it moves from one or more data management systems to target databases in Oracle Cloud Infrastructure.

### Objectives

In this workshop, you will:
* Create OCI GoldenGate resources
* Create a trusted connection between Oracle GoldenGate and OCI GoldenGate
* Create and run a distribution path on Oracle GoldenGate

### Prerequisites

To complete this LiveLab, you must have:

* An on-premises or [Marketplace Oracle GoldenGate installation](https://docs.oracle.com/en/middleware/goldengate/core/21.1/oggmp/oracle-goldengate-microservices-oracle-cloud-marketplace.html)
* An Oracle Cloud Infrastructure account with [access to Networking and OCI GoldenGate services](https://docs.oracle.com/en/cloud/paas/goldengate-service/oootq/index.html)
* Supported source and target databases provisioned and configured for [Oracle GoldenGate](https://www.oracle.com/integration/goldengate/certifications/) (source) and [OCI GoldenGate](https://docs.oracle.com/en/cloud/paas/goldengate-service/wxntz/index.html) (target)

## Learn more

* [Overview of Oracle Cloud Infrastructure GoldenGate](https://docs.oracle.com/en/cloud/paas/goldengate-service/druyg/index.html)

## Acknowledgements
* **Author** - Jenny Chan, Manager, Data Integration & Essbase User Assistance
* **Contributors** -  Werner He and Julien Testut, Database Product Management
* **Last Updated By/Date** - Jenny Chan, December 2025
