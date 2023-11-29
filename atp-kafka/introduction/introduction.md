# Introduction

## About this Workshop

Oracle GoldenGate, the industry-leading data replication, and integration software is now available as a fully-managed, cloud-native service on Oracle Cloud Infrastructure. This workshop guides you through how to use  OCI GoldenGate as the source deployment to extract data from Autonomous Transaction Processing (ATP) and deliver the data into a Kafka node running on an OCI Compute Instance. The Kafka node will be configurable through Terraform and the advertised listener will automatically be assigned with the Public IP of the compute node. Kafka & Zookeeper services will be started with the terraform as well. Topics will be created by OCI GoldenGate automatically.

Estimated time: 60 minutes

### About Oracle Cloud Infrastructure GoldenGate

Oracle Cloud Infrastructure GoldenGate is a fully-managed service that uses Oracle GoldenGate Microservices to help you replicate data in real-time, at scale, in the cloud. It processes data as it moves from one or more data management systems to target databases in Oracle Cloud Infrastructure.

![Work environment architecture](images/architecture.gif)

### Prerequisites

* Experience with Oracle Database
* Familiarity with Oracle GoldenGate is helpful, but not required
* Familiarity with Oracle Cloud Infrastructure is helpful, but not required
* An Oracle Cloud Account - Please view this workshop's landing page to see which environments are supported
* Access to OCI Cloud Shell
* Access to OCI Terraform
* Explore Autonomous Database and its capabilities
* 1 OCPU and 1 TB storage for the source Autonomous Transaction Processing (ATP) database
* Virtual machine for Apache Kafka - VM.Standard1.1

You may now **proceed to the next lab**.

## Learn more

* [About Oracle Cloud Infrastructure GoldenGate](https://docs.oracle.com/en/cloud/paas/goldengate-service/druyg/index.html#articletitle)
* [Take an interactive tour of OCI GoldenGate](https://apexapps.oracle.com/pls/apex/f?p=44785:112:0::::P112_CONTENT_ID:29986)

## Acknowledgements
* **Author** - Madhu Kumar S, Senior Solution Engineer, AppDev and Integration
* **Contributors** -  Denis Gray, Database Product Management; Jenny Chan, Consulting User Assistance Developer, Database User Assistance
* **Last Updated By/Date** - Madhu Kumar S, Senior Solution Engineer, AppDev and Integration
